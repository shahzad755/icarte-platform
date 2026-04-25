package icarte.armedialab.com.icarte.ui;

import android.content.DialogInterface;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.TextInputLayout;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;

import com.alertdialogpro.AlertDialogPro;
import com.android.volley.error.TimeoutError;
import com.android.volley.error.VolleyError;
import com.android.volley.ui.NetworkImageViewPlus;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;

import butterknife.Bind;
import butterknife.ButterKnife;
import butterknife.OnClick;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.Event;
import icarte.armedialab.com.icarte.datamodel.RequestWrapper;
import icarte.armedialab.com.icarte.datamodel.Staff;
import icarte.armedialab.com.icarte.domain.Restaurant;
import icarte.armedialab.com.icarte.listeners.ResponseListener;
import icarte.armedialab.com.icarte.responses.ServerResponse;
import icarte.armedialab.com.icarte.service.ServerProxy;
import icarte.armedialab.com.icarte.util.Utils;
import me.fichardu.circleprogress.CircleProgress;


public class HomeActivity extends AppCompatActivity implements Thread.UncaughtExceptionHandler {

    @Bind(R.id.bgImageHome) NetworkImageViewPlus bgImageHome;
    @Bind(R.id.ico_home_menu)ImageButton menuImageView;
    @Bind(R.id.ico_home_rating) ImageButton ratingImageView;
    @Bind(R.id.icon_home_contactus) ImageButton contactUsImageView;
    @Bind(R.id.ico_home_event)ImageButton eventImageView;
    @Bind(R.id.btnCallWaiter) FloatingActionButton callWaiter;
    @Bind(R.id.text_restaurant_name) TextView txtRestaurantName;
    @Bind(R.id.text_restaurant_title) TextView txtRestaurantTitle;
    @Bind(R.id.text_restaurant_description) TextView txtRestaurantDescription;

    private Animation animation;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        //constructIconView();
        ButterKnife.bind(this);
        animation = AnimationUtils.loadAnimation(getApplicationContext(),
                R.anim.animate_scale_out);

        ApplicationController applicationController = ApplicationController.getInstance();
        Restaurant restaurantInfo = applicationController.getRestaurantInfo();
        List<Event> events = restaurantInfo.getEvents();
        if(events!=null && events.size()>0) {
            ButterKnife.findById(this, R.id.layoutContainerEvent).setVisibility(View.VISIBLE);
        }
        callWaiter.setOnClickListener(new CallWaiterOnClickHandler(this));
/*
        if (!SafeLooper.isSafe()) {
            // install SafeLooper in main thread
            SafeLooper.install();
            SafeLooper.setUncaughtExceptionHandler(this);
            // process any uncaught exception in other threads
            Thread.setDefaultUncaughtExceptionHandler(this);
        }
*/
        txtRestaurantName.setText(restaurantInfo.getName());
        txtRestaurantTitle.setText(restaurantInfo.getTitle(
                applicationController.getUserLanguage()));
        txtRestaurantDescription.setText(restaurantInfo.getDescription(
                applicationController.getUserLanguage()));
        loadImage();
    }


    boolean doubleBackToExitPressedOnce = false;

    @Override
    public void onBackPressed() {
/*        if (doubleBackToExitPressedOnce) {
            super.onBackPressed();
            return;

        }

        this.doubleBackToExitPressedOnce = true;
        Utils.showToast(this, "Please click BACK again to exit");

        new Handler().postDelayed(new Runnable() {

            @Override
            public void run() {
                doubleBackToExitPressedOnce = false;
            }
        }, 2000);*/
    }

    private void loadImage() {
        Log.d(getLocalClassName(), "Loading Image from :"+ Utils.getImagePath()
                + ApplicationController.getInstance().getRestaurantInfo().getBackgroundImage());
        //TODO: Fix this as in case of any unhandled exception Restaurant Info is returned as null, no idea why restaurant info is null
        bgImageHome.setDefaultImageResId(R.drawable.bg_home_screen);
        bgImageHome.setAlpha(0.95f);
        bgImageHome.setErrorImageResId(R.drawable.bg_home_screen);
        bgImageHome.setImageUrl(
                Utils.getImagePath()
                        + ApplicationController.getInstance().getRestaurantInfo().getBackgroundImage(),
                ApplicationController.getInstance().getImageLoader());

    }

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
/*        // Checks the orientation of the screen
        if (newConfig.orientation == Configuration.ORIENTATION_LANDSCAPE) {
            Toast.makeText(this, "landscape", Toast.LENGTH_SHORT).show();
        } else if (newConfig.orientation == Configuration.ORIENTATION_PORTRAIT){
            Toast.makeText(this, "portrait", Toast.LENGTH_SHORT).show();
        }*/
    }

    @OnClick (R.id.ico_home_menu)
    void onRestaurantMenuClick(View view){
        view.startAnimation(animation);
        startActivity(new Intent(this, CategoryListActivity.class));
        finish();
    }

    @OnClick (R.id.ico_home_rating)
    void onRatingClick(View view){
        view.startAnimation(animation);
        startActivity(new Intent(this, CustomerFeedbackActivity.class));
    }

    @OnClick (R.id.icon_home_contactus)
    void onContactUsClick(View view){
        view.startAnimation(animation);
        startActivity(new Intent(this, ContactusActivity.class));
    }

    @OnClick (R.id.ico_home_event)
    void onEventsClick(View view){
        view.startAnimation(animation);
        startActivity(new Intent(this, EventListingActivity.class));
    }

    @OnClick (R.id.ico_login)
    void onLoginClick(View view){
        view.startAnimation(animation);
        final View inflatedView = getLayoutInflater().inflate(R.layout.layout_login_dialog_alert, null);
        final AlertDialogPro.Builder alertDlg = new AlertDialogPro.Builder(
                this, R.style.Theme_AlertDialogPro_Material){
           

            final TextInputLayout layoutEditStaffUserName = (TextInputLayout)inflatedView
                    .findViewById(R.id.layoutEditStaffUserName);
            
            final TextInputLayout layoutEditPassword = (TextInputLayout) inflatedView
                    .findViewById(R.id.layoutEditPassword);
            
            final CircleProgress mProgressView = (CircleProgress) inflatedView.findViewById(R.id.progressLogin);
            
            void hideProgressIndicator() {
                if(mProgressView!=null) {
                    mProgressView.stopAnim();
                    mProgressView.setVisibility(View.INVISIBLE);
                }
                //containerConfirmationDetails.setVisibility(View.VISIBLE);

            }
            void showProgressIndicator() {
                if (mProgressView != null) {
                    // Set the content view to 0% opacity but visible, so that it is visible
                    // (but fully transparent) during the animation.
                    mProgressView.setAlpha(0f);
                    mProgressView.setVisibility(View.VISIBLE);
                    mProgressView.startAnim();

                    // Animate the content view to 100% opacity, and clear any animation
                    // listener set on the view.
                    mProgressView.animate()
                            .alpha(1f)
                            .setDuration(getResources().getInteger(
                                    android.R.integer.config_mediumAnimTime))
                            .setListener(null);
                }
            }

            @Override
            public AlertDialogPro show() {
                layoutEditStaffUserName.setErrorEnabled(true);
                layoutEditPassword.setErrorEnabled(true);
                final AlertDialogPro d = create();

                d.setOnShowListener(new DialogInterface.OnShowListener() {

                    @Override
                    public void onShow(DialogInterface dialog) {

                        final Button btnPositive = d.getButton(DialogInterface.BUTTON_POSITIVE);
                        final Button btnNegative = d.getButton(DialogInterface.BUTTON_NEGATIVE);
                        btnPositive.setOnClickListener(new View.OnClickListener() {

                            @Override
                            public void onClick(View view) {
                                //Utils.hideKeyboard(d.getOwnerActivity());
                                boolean isInputError = false;

                                String username = layoutEditStaffUserName.getEditText().getText().toString();
                                if(Utils.isEmptyString(username)) {
                                    layoutEditStaffUserName.setError(getString(R.string.username_error_message));
                                    isInputError = true;
                                } else {
                                    layoutEditStaffUserName.setErrorEnabled(false);
                                }

                                String password = layoutEditPassword.getEditText().getText().toString();
                                if (Utils.isEmptyString(password)) {
                                    layoutEditPassword.setError(getString(R.string.password_error_message));
                                    isInputError = true;
                                } else {
                                    layoutEditPassword.setErrorEnabled(false);
                                }

                                if(!isInputError) {

                                    btnPositive.setEnabled(false);
                                    btnNegative.setEnabled(false);
                                    layoutEditStaffUserName.getEditText().setEnabled(false);
                                    layoutEditPassword.getEditText().setEnabled(false);

                                    showProgressIndicator();

                                    Restaurant restaurant = ApplicationController.getInstance().getRestaurantInfo();

                                    final RequestWrapper<Staff> request = new RequestWrapper<>(Utils.RequestCode.LOGIN.getRequestCode());
                                    request.setDeviceSerialNum(Utils.getDeviceId(d.getContext()));
                                    request.setRestaurantActivationKey(restaurant.getActivationKey());
                                    request.setRestaurantCode(restaurant.getRestaurantCode());
                                    request.setDeviceRegistrationCode(restaurant.getDeviceRegistrationCode());
                                    Staff staff = new Staff();
                                    staff.setUsername(username);
                                    staff.setPassword(password);
                                    request.setRequest(staff);

                                    if(Utils.isNetworkAvailable(getContext())) {
                                        ServerProxy.submitLogin(request, new ResponseListener.ResponseProcessor<ServerResponse<Staff>>() {
                                            @Override
                                            public void onSuccess(ServerResponse<Staff> response) {
                                                if (response.isSuccess()) {
                                                    ApplicationController.getInstance().setStaff(response.getModel());
                                                    Utils.showToast(getContext(), getResources().getString(R.string.login_successfull));
                                                    Intent intent = new Intent(getContext(), ConfigurationActivity.class);
                                                    //intent.putExtra(Utils.KEY_ORDER_RESPONSE, response.getModel());
                                                    d.dismiss();
                                                    startActivity(intent);
                                                    finish();

                                                } else {
                                                    adjustControlsAfterFault(getResources().getString(R.string.login_failed));
                                                }
                                            }

                                            @Override
                                            public void onFault(VolleyError response) {
                                                String errMsg = null;
                                                if(response instanceof TimeoutError)
                                                    errMsg = getResources().getString(R.string.error_host_unreachable);
                                                else
                                                    errMsg = response.getMessage();
                                                if(errMsg==null) {
                                                    errMsg = getResources().getString(R.string.error_host_unreachable);
                                                }
                                                adjustControlsAfterFault(errMsg);
                                            }

                                        });
                                    } else {
                                        adjustControlsAfterFault(getResources().getString(R.string.error_no_connection_cart_activity));
                                    }
                                }
                            }
                            void adjustControlsAfterFault(String msg) {
                                hideProgressIndicator();
                                Utils.showToast(getContext(), msg);
                                layoutEditStaffUserName.getEditText().setEnabled(true);
                                layoutEditPassword.getEditText().setEnabled(true);
                                layoutEditStaffUserName.requestFocus();
                                btnPositive.setEnabled(true);
                                btnNegative.setEnabled(true);
                            }
                        });
                    }
                });
                d.show();
                return d;
            }

        };
                alertDlg.setTitle("Please Login...")
                .setView(inflatedView)
                .setNegativeButton("Cancel", null)
                .setPositiveButton("Login", null).show()
                .setCancelable(false);
        // startActivity(new Intent(this, LoginActivity.class));*/
    }

    @Override
    public void uncaughtException(Thread thread, Throwable ex) {
// print the crash info on the screen
        StringWriter buf = new StringWriter();
        buf.append("App Crashed in: " + thread + "\n\n");
        PrintWriter w = new PrintWriter(buf);
        ex.printStackTrace(w);

        final String txt = buf.toString();
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                Utils.showToast(getApplicationContext(), txt);
            }
        });
    }
}
