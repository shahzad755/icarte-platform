package icarte.armedialab.com.icarte.ui;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import com.android.volley.error.VolleyError;

import java.util.concurrent.Callable;

import bolts.Continuation;
import bolts.Task;
import butterknife.ButterKnife;
import butterknife.Bind;
import butterknife.OnClick;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.RequestWrapper;
import icarte.armedialab.com.icarte.listeners.ResponseListener;
import icarte.armedialab.com.icarte.domain.Restaurant;
import icarte.armedialab.com.icarte.responses.ServerResponse;
import icarte.armedialab.com.icarte.service.ServerProxy;
import icarte.armedialab.com.icarte.util.Utils;

public class DeviceRegistrationProgressBarActivity extends BaseProgressBarActivity
        implements ResponseListener.ResponseProcessor<ServerResponse<Restaurant>>, DialogInterface.OnClickListener {
    private static String TAG = DeviceRegistrationProgressBarActivity.class.getName();

    @Bind(R.id.txtInstanceId) TextView txtInstanceId;
    @Bind(R.id.txtActivationCode) EditText activationCode;
    @Bind(R.id.txtRestaurantCode) EditText restaurantCode;
    @Bind(R.id.txtDeviceRegCode) EditText txtDeviceRegCode;
    @Bind(R.id.regContentContainer) View mRegContentContainer;

    @Override
    public View getParentContainer() {
        return null;//mRegContentContainer;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_device_registration);
        ButterKnife.bind(this);
        txtInstanceId.setText(txtInstanceId.getText().toString() + " " + Utils.getDeviceId(this));
        Log.d(">>>>>>>>>>>>>>>" + getLocalClassName(), txtInstanceId.getText().toString());
    }

    @OnClick(R.id.btnRegister)
    void submitRegistration() {
        String rText = this.restaurantCode.getText().toString();
        String aText = this.activationCode.getText().toString();
        String regText = this.txtDeviceRegCode.getText().toString();

        if(Utils.isEmptyString(rText) || Utils.isEmptyString(aText) || Utils.isEmptyString(regText)){
            Utils.showToast(this.getApplicationContext(), "Please enter the required information");
        } else {
            final RequestWrapper request = new RequestWrapper(Utils.RequestCode.REGISTER_DEVICE.getRequestCode());
            request.setDeviceSerialNum(Utils.getDeviceId(this));
            request.setRestaurantCode(rText);
            request.setRestaurantActivationKey(aText);
            request.setDeviceRegistrationCode(regText);
            if(Utils.isNetworkAvailable(this)) {
                showProgressIndicator();
                ServerProxy.registerDevice(request, this);
                Log.d(TAG, "2- Request sent to server...");
            } else {
                hideProgressIndicator();
                showRetryAlert(getResources().getString(R.string.error_no_connection));
            }
    /*
            String deviceSerial = android.os.Build.SERIAL;
            String deviceId = Utils.getDeviceId(this.getApplicationContext());
            String android_id = Settings.Secure.getString(this.getContentResolver(),
                    Settings.Secure.ANDROID_ID);

            Log.d("Device ID:", deviceId);
            Log.i("Build Serial Number: ", deviceSerial);
            Log.i("Android ID: ", android_id);
    */
        }
    }

    @OnClick(R.id.btnCancel)
    void closeMe() {
        this.finish();
    }

    private void showRetryAlert(String msg) {
        AlertDialog alertDialog = new AlertDialog.Builder(this).create();
        alertDialog.setTitle("Error...");
        alertDialog.setMessage(msg);
        alertDialog.setButton(DialogInterface.BUTTON_POSITIVE, "Retry", this);
        alertDialog.setButton(DialogInterface.BUTTON_NEGATIVE, "Close", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                finish();
            }
        });
        alertDialog.show();
    }

    @Override
    public void onSuccess(final ServerResponse<Restaurant> response) {
        Log.d(TAG, "Response from server..." + response.getClass());
        final Restaurant registrationResponse = response.getModel();
        hideProgressIndicator();

        Task.callInBackground(new Callable <Boolean>(){
            @Override
            public Boolean call() throws Exception {
                if(response.isSuccess()) {
                    Utils.setImagePath(registrationResponse.getImagePath()+ "/");
                    boolean b = saveResponseInDatabase(registrationResponse);
                    if(b) {
                        ApplicationController.getInstance().setRestaurantInfo(registrationResponse);
                    }
                    return b;
                } else {
                    Utils.showToast(DeviceRegistrationProgressBarActivity.this, response.getErrorDetails());
                    return false;
                }
            }
        }).continueWith(new Continuation<Boolean, Void>() {
            @Override
            public Void then(Task<Boolean> task) throws Exception {
                if (task.isFaulted()) {
                    Log.e(TAG, "Fault occurred:", task.getError());
                    //hideProgressIndicator();
                    Utils.showToast(DeviceRegistrationProgressBarActivity.this, "Error while processing your request..." + task.getError().getLocalizedMessage());
                } else if (task.isCompleted() && task.getResult()) {
                    startActivity(new Intent(DeviceRegistrationProgressBarActivity.this, HomeActivity.class));
                    finish();
                }
                return null;
            }
        });


    }

    @Override
    public void onFault(VolleyError error) {
        Log.d(TAG, "Error Response from server: "+ error.getLocalizedMessage());
        hideProgressIndicator();
        showRetryAlert("Sorry for inconvenience! An error occurred, while processing your request. Please contact your administrator");
    }

    private boolean saveResponseInDatabase(Restaurant registrationResponse) {
        boolean result = Boolean.FALSE;
        Log.d(TAG, "Saving server response in the database..."+ registrationResponse);

        if(registrationResponse!=null) {
            ApplicationController.getInstance().getCarteService().saveRestaurant(registrationResponse);
            if(registrationResponse.getId()>0)
                result = true;
        }
        return result;
    }

    @Override
    public void onClick(DialogInterface dialog, int which) {
        submitRegistration();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
  }

    @Override
    public int getAnimationDuration() {
        return getResources().getInteger(
                android.R.integer.config_mediumAnimTime);
    }
}
