package icarte.armedialab.com.icarte.ui;

import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import android.support.v7.app.AlertDialog;
import android.view.View;

import com.android.volley.error.VolleyError;
import com.esotericsoftware.minlog.Log;

import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.RequestWrapper;
import icarte.armedialab.com.icarte.datamodel.Staff;
import icarte.armedialab.com.icarte.domain.Restaurant;
import icarte.armedialab.com.icarte.listeners.ResponseListener;
import icarte.armedialab.com.icarte.responses.ServerResponse;
import icarte.armedialab.com.icarte.service.ServerProxy;
import icarte.armedialab.com.icarte.util.Utils;
import me.fichardu.circleprogress.CircleProgress;

/**
 * Created by Maqsood on 11/8/2017.
 */
public class CallWaiterOnClickHandler implements View.OnClickListener {

    Activity activity;
    private CircleProgress mProgressView;

    public CallWaiterOnClickHandler(Activity activity) {
        this.activity = activity;
    }

    @Override
    public void onClick(final View v) {
        final AlertDialog.Builder alertDlg = new AlertDialog.Builder(v.getContext(),
                R.style.Theme_AlertDialogPro_Material_Light);
        alertDlg.setMessage(R.string.call_waiter_msg);
        alertDlg.setCancelable(false);
        alertDlg.setPositiveButton(R.string.label_btn_yes, new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                callWaiter(v);
            }
        });

        alertDlg.setNegativeButton(R.string.label_btn_no, null);
        alertDlg.create().show();

    }

    public void callWaiter(final View v) {
        if(!Utils.isTableNumberAvailable()) {
            final AlertDialog.Builder alertDlg = new AlertDialog.Builder(v.getContext(),
                    R.style.Base_Theme_AlertDialogPro_Material);
            alertDlg.setTitle(R.string.title_attention);
            alertDlg.setMessage(R.string.table_ref_error_message);
            alertDlg.setNegativeButton(R.string.label_btn_ok, null);
            alertDlg.setCancelable(true);
            alertDlg.create().show();
            return;
        }

        //Utils.showProgressIndicator(v, mProgressView, activity.getResources());
        final Restaurant restaurant = ApplicationController.getInstance().getRestaurantInfo();
        final Context context = activity.getApplicationContext();
        final RequestWrapper<CallWaiterRequest> request = new RequestWrapper<>(
                Utils.RequestCode.CALL_WAITER.getRequestCode());

        Staff staff = ApplicationController.getInstance().getStaff();

        CallWaiterRequest waiterRequest = new CallWaiterRequest(Utils.getTableReferenceId(),
                staff!=null?staff.getStaffCode(): null);

        request.setDeviceSerialNum(Utils.getDeviceId(context));
        request.setRestaurantActivationKey(restaurant.getActivationKey());
        request.setRestaurantCode(restaurant.getRestaurantCode());
        request.setDeviceRegistrationCode(restaurant.getDeviceRegistrationCode());
        request.setRequest(waiterRequest);

        if (Utils.isNetworkAvailable(context)) {
            ServerProxy.callWaiterRequest(request, new ResponseListener.ResponseProcessor<ServerResponse<?>>() {
                @Override
                public void onSuccess(ServerResponse<?> response) {
                    if (response.isSuccess()) {
                        Utils.showToast(context, activity.getResources().getString(
                                R.string.call_waiter_success_msg));
                        //Utils.hideProgressIndicator(v, mProgressView);
                        //Utils.navigateToHomeScreen(activity);
                    } else {
                        // fault
                        //Utils.hideProgressIndicator(v, mProgressView);
                        Utils.showAlert(R.string.feedback_submitted_failure, null, v);
                    }
                }

                @Override
                public void onFault(VolleyError response) {
                    Log.error("Error ", response.getMessage());
                    //Utils.hideProgressIndicator(v, mProgressView);
                    Utils.showAlert(R.string.error_host_unreachable, null, v);
                }

            });
        } else {
            //Utils.hideProgressIndicator(v, mProgressView);
            //fault
            Utils.showAlert(R.string.feedback_submitted_failure, null, v);
        }
    }

    public class CallWaiterRequest {
        String servingTableRef;
        String assignedStaffCode;

        public CallWaiterRequest(String servingTableRef, String staffCode) {
            this.servingTableRef = servingTableRef;
            this.assignedStaffCode = staffCode;
        }
    }

}
