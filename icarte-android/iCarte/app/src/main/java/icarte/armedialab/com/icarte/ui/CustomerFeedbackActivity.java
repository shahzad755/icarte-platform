package icarte.armedialab.com.icarte.ui;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.RatingBar;
import android.widget.TextView;

import com.android.volley.error.VolleyError;
import com.esotericsoftware.minlog.Log;

import net.soulwolf.widget.materialradio.MaterialRadioGroup;
import net.soulwolf.widget.materialradio.listener.OnCheckedChangeListener;

import java.util.ArrayList;
import java.util.List;

import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.Customer;
import icarte.armedialab.com.icarte.datamodel.RequestWrapper;
import icarte.armedialab.com.icarte.domain.CustomerFeedback;
import icarte.armedialab.com.icarte.domain.Restaurant;
import icarte.armedialab.com.icarte.listeners.ResponseListener;
import icarte.armedialab.com.icarte.responses.ServerResponse;
import icarte.armedialab.com.icarte.service.ServerProxy;
import icarte.armedialab.com.icarte.util.Utils;
import me.fichardu.circleprogress.CircleProgress;

public class CustomerFeedbackActivity extends AppCompatActivity implements View.OnClickListener {

    CustomerFeedback customerFeedback;
    CircleProgress mProgressView;
    ImageButton btnBackHome;
    FloatingActionButton btnSubmitFeedback;
    EditText editFeedbackCustomerFName;
    EditText editFeedbackCustomerLName;
    EditText editFeedbackCustomerContact;
    EditText editFeedbackCustomerEmail;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        customerFeedback = ApplicationController.getInstance().getRestaurantInfo().getFeedbackForm(); //new CustomerFeedback();

        //customerFeedback.prepareFeedbackQuestions(ApplicationController.getInstance().getRestaurantInfo().getId());

        LayoutInflater inflater = (LayoutInflater) getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View view = inflater.inflate(R.layout.activity_customer_feedback, null, false);

        ((TextView)view.findViewById(R.id.txtFeedbackTitle)).setText(R.string.title_submit_feedback);
        mProgressView = (CircleProgress) view.findViewById(R.id.progressViewOnFeedback);

        editFeedbackCustomerFName = (EditText) view.findViewById(R.id.editFeedbackCustomerFName);
        editFeedbackCustomerLName = (EditText) view.findViewById(R.id.editFeedbackCustomerLName);
        editFeedbackCustomerContact = (EditText) view.findViewById(R.id.editFeedbackCustomerContact);
        editFeedbackCustomerEmail = (EditText) view.findViewById(R.id.editFeedbackCustomerEmail);

        btnSubmitFeedback = (FloatingActionButton) view.findViewById(R.id.btnSubmitFeedback);
        btnSubmitFeedback.setOnClickListener(this);
        btnBackHome = (ImageButton) view.findViewById(R.id.btnBackHome);
        btnBackHome.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(final View v) {
                AlertDialog.Builder alertDlg = new AlertDialog.Builder(v.getContext(),
                        R.style.Theme_AlertDialogPro_Material_Light);
                alertDlg.setMessage(R.string.feedbackView_navigate_away_msg);
                alertDlg.setCancelable(false);
                alertDlg.setPositiveButton(R.string.label_btn_yes, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        clearDataAndNavigateToHomeScreen();
                    }
                });

                alertDlg.setNegativeButton(R.string.label_btn_no, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        //Do Nothing
                    }
                });
                alertDlg.create().show();
            }
        });
        LinearLayout parent = (LinearLayout) view.findViewById(R.id.layoutContainerFeedback);

        View feedbackView = null;
        TextView questionView = null;
        //int idOfTheLastChild = 0;
        for (final CustomerFeedback.FeedbackField feedbackField : customerFeedback.feedbackFields) {
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            switch (Utils.FeedbackType.getFeedBackType(feedbackField.feedbackType)) {
                case HAPPINESS_METER:
                    feedbackView = inflater.inflate(R.layout.layout_feedback_happiness, null);
                    MaterialRadioGroup radioGroup = (MaterialRadioGroup) feedbackView.findViewById(R.id.happinessRadioGroup);
                    radioGroup.setOnCheckedChangeListener(new HappinessMeterOnCheckedChangeListener(feedbackField));
                    break;
                case STAR_RATING:
                    feedbackView = inflater.inflate(R.layout.layout_feedback_rating, null);
                    RatingBar ratingBarView = (RatingBar) feedbackView.findViewById(R.id.feedbackRatingBar);
                    ratingBarView.setOnRatingBarChangeListener(new RatingBarChangeListener(feedbackField));
                    break;
                case REMARKS:
                    feedbackView = inflater.inflate(R.layout.layout_feedback_comment, null);
                    final EditText commentView = (EditText) feedbackView.findViewById(R.id.feedbackComment);
                    //commentView.setOnFocusChangeListener(new CommentOnFocusChangeListener(commentView, feedbackField));
                    feedbackField.commentView = commentView;
                    break;
            }

            feedbackView.setId(feedbackField.feedbackFieldId.intValue());
            questionView = (TextView) feedbackView.findViewById(R.id.txtFeedackQuestion);
            questionView.setText(feedbackField.getQuestion(ApplicationController.getInstance().getUserLanguage()));
/*
            if(i==1){
                idOfTheLastChild = custom.getId();
                //layoutParams.addRule(RelativeLayout.BELOW, R.id.layoutContainerCommonNavHomeHeader);
            } else {
                //layoutParams.addRule(RelativeLayout.BELOW, idOfTheLastChild);

                idOfTheLastChild = custom.getId();
            }
*/
            parent.addView(feedbackView, layoutParams);
        }
            setContentView(view);


    }

    private void clearDataAndNavigateToHomeScreen() {
        // here clear all the values in the feedback fields
        for (CustomerFeedback.FeedbackField fd : customerFeedback.feedbackFields) {
            fd.value = null;
            fd.commentView = null;
        }
        startActivity(new Intent(getApplicationContext(), HomeActivity.class));
        finish();
    }

    @Override
    public void onClick(View v) {
        if(customerFeedback!=null) {
            String fName = editFeedbackCustomerFName.getText().toString();
            String lName = editFeedbackCustomerLName.getText().toString();
            String contact = editFeedbackCustomerContact.getText().toString();
            String email = editFeedbackCustomerEmail.getText().toString();
            if(Utils.isEmptyString(fName) ||
                    Utils.isEmptyString(lName) ||
                    Utils.isEmptyString(contact) ||
                    Utils.isEmptyString(email) ) {
                Utils.showAlert(R.string.feedbackView_customer_validation_error, null, v);
                return;
            }
            if(customerFeedback.customer==null) {
                customerFeedback.customer = new Customer();
                customerFeedback.customer.setFirstName(fName);
                customerFeedback.customer.setLastName(lName);
                customerFeedback.customer.setMobile(contact);
                customerFeedback.customer.setEmail(email);
            }
            if(customerFeedback.order==null && ApplicationController.getInstance().isOrderExist()) {
                customerFeedback.order = ApplicationController.getInstance().getOrder();
            }

            ViewGroup group = (ViewGroup)findViewById(R.id.layoutContainerFeedback);
            recursiveLoopChildren(group);

            List<String> errorFields = new ArrayList<>(customerFeedback.feedbackFields.size());
            //Utils.showToast(v.getContext(), customerFeedback.feedbackFields.size());
            //Some validation checks
            for (CustomerFeedback.FeedbackField feedbackField : customerFeedback.feedbackFields) {
                if(feedbackField.required && (feedbackField.value == null || feedbackField.value.trim().length()<1)) {
                    errorFields.add(feedbackField.getQuestion(ApplicationController.getInstance().getUserLanguage()));
                }
            }

            // Validation successful
            if(errorFields.size()==0) {
                submitFeedback(v);
            } else {
                Utils.showAlert(R.string.feedbackView_validation_error, null, v);
            }
        }
    }

    private void submitFeedback(final View v) {
        Utils.showProgressIndicator(btnSubmitFeedback, mProgressView, getResources());

        Restaurant restaurant = ApplicationController.getInstance().getRestaurantInfo();
        customerFeedback.restaurantId = restaurant.getId();

        final RequestWrapper<CustomerFeedback> request = new RequestWrapper<>(
                Utils.RequestCode.SUBMIT_FEEDBACK.getRequestCode());
        request.setDeviceSerialNum(Utils.getDeviceId(getApplicationContext()));
        request.setRestaurantActivationKey(restaurant.getActivationKey());
        request.setRestaurantCode(restaurant.getRestaurantCode());
        request.setDeviceRegistrationCode(restaurant.getDeviceRegistrationCode());
        request.setRequest(customerFeedback);

        if(Utils.isNetworkAvailable(getApplicationContext())) {
            ServerProxy.submitFeedbackQuestions(request, new ResponseListener.ResponseProcessor<ServerResponse<?>>() {
                @Override
                public void onSuccess(ServerResponse<?> response) {
                    if (response.isSuccess()) {
                        Utils.showToast(getApplicationContext(), getResources().getString(
                                R.string.feedback_submitted_success));
                        Utils.hideProgressIndicator(btnSubmitFeedback, mProgressView);
                        clearDataAndNavigateToHomeScreen();
                    } else {
                        // fault
                        Utils.hideProgressIndicator(btnSubmitFeedback, mProgressView);
                        Utils.showAlert(R.string.feedback_submitted_failure, null, v);
                    }
                }

                @Override
                public void onFault(VolleyError response) {
                    Log.error("Error ", response.getMessage());
                    Utils.hideProgressIndicator(btnSubmitFeedback, mProgressView);
                    Utils.showAlert(R.string.error_host_unreachable, null, v);
                }

            });
        } else {
            Utils.hideProgressIndicator(btnSubmitFeedback, mProgressView);
            //fault
            Utils.showAlert(R.string.feedback_submitted_failure, null, v);
        }
    }

/* Not needed for now
    private static class CommentOnFocusChangeListener implements View.OnFocusChangeListener {
        private final EditText commentView;
        private final CustomerFeedback.FeedbackField feedbackField;

        public CommentOnFocusChangeListener(EditText commentView, CustomerFeedback.FeedbackField feedbackField) {
            this.commentView = commentView;
            this.feedbackField = feedbackField;
        }

        @Override
        public void onFocusChange(View v, boolean hasFocus) {
            if (false || !hasFocus && commentView.length() > 0) {// TODO: Not working as expected. If the focus is not changed then the value of the field is not set
                feedbackField.value = commentView.getText().toString();
            }
        }
    }
*/

    private static class HappinessMeterOnCheckedChangeListener implements OnCheckedChangeListener {
        private final CustomerFeedback.FeedbackField feedbackField;

        public HappinessMeterOnCheckedChangeListener(CustomerFeedback.FeedbackField feedbackField) {
            this.feedbackField = feedbackField;
        }

        @Override
        public void onCheckedChanged(MaterialRadioGroup group, int checkedId) {
            switch (checkedId) {
                case R.id.feedBackHappy:
                    feedbackField.value = Utils.HappinessFeedbackType.HAPPY.getHappinessFeedbackTypeId();
                break;
                case R.id.feedBackSad:
                    feedbackField.value = Utils.HappinessFeedbackType.SAD.getHappinessFeedbackTypeId();
                break;
                default:
                    feedbackField.value = Utils.HappinessFeedbackType.NEUTRAL.getHappinessFeedbackTypeId();
            }
        }
    }

    private static class RatingBarChangeListener implements RatingBar.OnRatingBarChangeListener {
        private final CustomerFeedback.FeedbackField feedbackField;

        public RatingBarChangeListener(CustomerFeedback.FeedbackField feedbackField) {
            this.feedbackField = feedbackField;
        }

        @Override
        public void onRatingChanged(RatingBar ratingBar, float rating, boolean fromUser) {
            feedbackField.value = String.valueOf(rating);
        }
    }
    public void recursiveLoopChildren(ViewGroup parent) {
        for (int i = parent.getChildCount() - 1; i >= 0; i--) {
            final View child = parent.getChildAt(i);
            if (child instanceof ViewGroup) {
                recursiveLoopChildren((ViewGroup) child);
            } else {
                if (child != null) {
                    if(child instanceof EditText) {
                        for (CustomerFeedback.FeedbackField fdb : customerFeedback.feedbackFields) {
                            if(child.equals(fdb.commentView))
                                fdb.value = ((EditText) child).getText().toString();
                        }
                    }
                }
            }
        }
    }
}
