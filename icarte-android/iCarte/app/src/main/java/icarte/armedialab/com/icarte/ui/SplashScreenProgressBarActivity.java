package icarte.armedialab.com.icarte.ui;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;

import com.android.volley.error.VolleyError;

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

public class SplashScreenProgressBarActivity extends BaseProgressBarActivity
        implements ResponseListener.ResponseProcessor<ServerResponse<Restaurant>> {

    private static String TAG = SplashScreenProgressBarActivity.class.getName();
    @Bind(R.id.btnRetry)
    ImageButton btnRetry;

    @Bind(R.id.txtConnectionError)
    TextView txtConnectionError;

    @Override
    public View getParentContainer() {
        return null;
    }

    @Override
    protected void onStart() {
        super.onStart();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash_screen);
        ButterKnife.bind(this);
        sendRequest();
    }

    @OnClick(R.id.btnRetry)
    void sendRequest() {
        showProgressIndicator();
        Utils.hideErrorView(btnRetry, txtConnectionError);
        Restaurant restaurant = ApplicationController.getInstance().getCarteService().loadRestaurant();

        RequestWrapper request = new RequestWrapper(Utils.RequestCode.VERIFY_DEVICE.getRequestCode());
        request.setDeviceSerialNum(Utils.getDeviceId(this));

        if (restaurant != null) {
            request.setRestaurantCode(restaurant.getRestaurantCode());
            request.setRestaurantActivationKey(restaurant.getActivationKey());
            request.setDeviceRegistrationCode(restaurant.getDeviceRegistrationCode());
        }
        if (Utils.isNetworkAvailable(this)) {
            ServerProxy.verifyDevice(request, this);
        } else {
            hideProgressIndicator();
            txtConnectionError.setText(getResources().getString(R.string.error_no_connection));
            Utils.showErrorView(btnRetry, txtConnectionError);
        }
    }

    private void navigateTo(Class activity){
        startActivity(new Intent(SplashScreenProgressBarActivity.this, activity));
        // close this activity
        this.finish();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }

    @Override
    public void onSuccess(ServerResponse<Restaurant> response) {
        hideProgressIndicator();
        if (response != null && "200".equals(response.getResponseCode())) {
            Restaurant restaurant = response.getModel();
            if(restaurant!=null && restaurant.isBlocked()) {
                Utils.showToast(getApplicationContext(),
                        "This account is blocked or de-activated. Please contact administrator for details..");
                txtConnectionError.setText(getResources().getString(R.string.error_account_blocked));
                Utils.showErrorView(btnRetry, txtConnectionError);
            } else {
                if (response.isSuccess()) {
                    restaurant.setDeviceSerialNo(Utils.getDeviceId(getApplicationContext()));
                    //save latest data in the database
                    ApplicationController controller = ApplicationController.getInstance();
                    Utils.setImagePath(restaurant.getImagePath() + "/");
                    controller.getCarteService().saveRestaurant(restaurant);
                    controller.setRestaurantInfo(restaurant);
                    Log.d(TAG, "Navigating to the Welcome screen...");
                    navigateTo(HomeActivity.class);
                } else {
                    Log.d(TAG, "Navigating to the Registration screen...");
                    Utils.showToast(getApplicationContext(), response.getErrorDetails());
                    navigateTo(DeviceRegistrationProgressBarActivity.class);
                }
            }
        } else {
            Utils.showToast(getApplicationContext(),
                    "Error fetching information from server. Please contact administrator for details..");
            txtConnectionError.setText(getResources().getString(R.string.error_host_unreachable));
            Utils.showErrorView(btnRetry, txtConnectionError);
        }
    }

    @Override
    public void onFault(VolleyError response) {
        hideProgressIndicator();
        Log.e(TAG, "Exception while connecting to server", response.getCause());
        txtConnectionError.setText(getResources().getString(R.string.error_host_unreachable));
        Utils.showErrorView(btnRetry, txtConnectionError);
    }

    @Override
    public int getAnimationDuration() {
        return getResources().getInteger(
                android.R.integer.config_mediumAnimTime);
    }
}
