package icarte.armedialab.com.icarte.ui;


import android.app.Fragment;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Typeface;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;

import com.android.volley.error.VolleyError;
import com.esotericsoftware.minlog.Log;

import butterknife.Bind;
import butterknife.ButterKnife;
import butterknife.OnClick;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.RequestWrapper;
import icarte.armedialab.com.icarte.domain.Restaurant;
import icarte.armedialab.com.icarte.listeners.ResponseListener;
import icarte.armedialab.com.icarte.responses.ServerResponse;
import icarte.armedialab.com.icarte.service.ServerProxy;
import icarte.armedialab.com.icarte.util.Utils;
import me.fichardu.circleprogress.CircleProgress;

/**
 * A simple {@link Fragment} subclass.
 */
public class ContactUsFormFragment extends Fragment {


    @Bind(R.id.editCustomerName) EditText editCustomerName;
    @Bind(R.id.editContactNumber) EditText editContactNumber;
    @Bind(R.id.commentType) Spinner commentType;
    @Bind(R.id.editComments) EditText editComments;
    @Bind(R.id.btnSubmitComments) Button submitComments;
    @Bind(R.id.progressBarContactForm) CircleProgress mProgressView;


    public ContactUsFormFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.layout_contact_form_fragment, container, false);
        ButterKnife.bind(this, view);
        setupCustomFonts();
        setupCommentTypeSpinner();
        return view;
    }

    private void setupCommentTypeSpinner() {
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(
                getActivity(), R.array.comment_types, R.layout.spinner_layout_item_comment);

        adapter.setDropDownViewResource(R.layout.spinner_layout_item_comment_checked);
        commentType.setAdapter(adapter);
    }

    private void setupCustomFonts() {
        Typeface typeFace= Typeface.createFromAsset(getActivity().getAssets(), "fonts/NoticiaText-Regular.ttf");
        editCustomerName.setTypeface(typeFace);
        editContactNumber.setTypeface(typeFace);
        editComments.setTypeface(typeFace);
    }

    @OnClick(R.id.btnSubmitComments)
    void submitComments(final View v){
        if(validateData()) {
            /*
            - Show the confirmation dialog, if user confirms then
                - Show the progressBar
                - Disable the submit button
                - Send the comments data to server
                - Receive the response and hide the progressBar
                - Finish this activity and Navigate to home activity
             */
            AlertDialog.Builder alertDlg = new AlertDialog.Builder(v.getContext(),
                    R.style.Theme_AlertDialogPro_Material_Light);
            alertDlg.setMessage(R.string.commentsView_submit_form_msg);
            alertDlg.setCancelable(false);
            alertDlg.setPositiveButton(R.string.label_btn_yes, new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    submitData(v);
                }
            });

            alertDlg.setNegativeButton(R.string.label_btn_no, null);
            alertDlg.create().show();
        }
    }

    private void submitData(final View v) {
        Utils.showProgressIndicator(submitComments, mProgressView, getResources());
        final Restaurant restaurant = ApplicationController.getInstance().getRestaurantInfo();

        final ContactUs contactUs = new ContactUs(
                editCustomerName.getText().toString(),
                editContactNumber.getText().toString(),
                commentType.getSelectedItem().toString(),
                editComments.getText().toString(), restaurant.getId());

            final Context context = getActivity().getApplicationContext();
            final RequestWrapper<ContactUs> request = new RequestWrapper<>(
                    Utils.RequestCode.SUBMIT_COMMENTS.getRequestCode());

            request.setDeviceSerialNum(Utils.getDeviceId(context));
            request.setRestaurantActivationKey(restaurant.getActivationKey());
            request.setRestaurantCode(restaurant.getRestaurantCode());
            request.setDeviceRegistrationCode(restaurant.getDeviceRegistrationCode());
            request.setRequest(contactUs);

            if (Utils.isNetworkAvailable(context)) {
                ServerProxy.submitComments(request, new ResponseListener.ResponseProcessor<ServerResponse<?>>() {
                    @Override
                    public void onSuccess(ServerResponse<?> response) {
                        if (response.isSuccess()) {
                            Utils.showToast(context, getResources().getString(
                                    R.string.contactus_submitted_success));
                            Utils.hideProgressIndicator(submitComments, mProgressView);
                            Utils.navigateToHomeScreen(getActivity());
                        } else {
                            // fault
                            Utils.hideProgressIndicator(submitComments, mProgressView);
                            Utils.showAlert(R.string.feedback_submitted_failure, null, v);
                        }
                    }

                    @Override
                    public void onFault(VolleyError response) {
                        Log.error("Error ", response.getMessage());
                        Utils.hideProgressIndicator(submitComments, mProgressView);
                        Utils.showAlert(R.string.error_host_unreachable, null, v);
                    }

                });
            } else {
                Utils.hideProgressIndicator(submitComments, mProgressView);
                //fault
                Utils.showAlert(R.string.feedback_submitted_failure, null, v);
            }
    }

    private boolean validateData() {
        boolean validated = true;
        if(Utils.isEmptyEditText(editCustomerName)){
            editCustomerName.setError(
                    getResources().getString(R.string.customer_name_empty_error));
            validated = false;
        } else {
            editCustomerName.setError(null);
        }
        if(Utils.isEmptyEditText(editContactNumber)){
            editContactNumber.setError(
                    getResources().getString(R.string.customer_contact_empty_error));
            validated = false;
        } else {
            editContactNumber.setError(null);
        }
        if(Utils.isEmptyEditText(editComments)){
            editComments.setError(
                    getResources().getString(R.string.customer_comment_empty_error));
            validated = false;
        } else {
            editComments.setError(null);
        }
        return validated;
    }

    /**
     * Created by Maqsood on 11/5/2017.
     */
    public static class ContactUs {
        public String name;
        public String contactNumber;
        public String type;
        public String comments;
        public long restaurantId;

        public ContactUs(){

        }

        public ContactUs(String name, String contactNumber, String type, String comments, long restaurantId) {
            this.name = name;
            this.contactNumber = contactNumber;
            this.type = type;
            this.comments = comments;
            this.restaurantId = restaurantId;
        }
    }
}
