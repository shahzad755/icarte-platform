package icarte.armedialab.com.icarte.domain;

import android.widget.EditText;

import java.util.ArrayList;
import java.util.List;

import icarte.armedialab.com.icarte.datamodel.Customer;
import icarte.armedialab.com.icarte.datamodel.Order;
import icarte.armedialab.com.icarte.util.ExcludeFromJsonSerialization;

import static icarte.armedialab.com.icarte.util.Utils.FeedbackType.HAPPINESS_METER;
import static icarte.armedialab.com.icarte.util.Utils.FeedbackType.REMARKS;
import static icarte.armedialab.com.icarte.util.Utils.FeedbackType.STAR_RATING;

/**
 * Created by Maqsood on 10/17/2017.
 */
public class CustomerFeedback {
    public List<FeedbackField> feedbackFields = new ArrayList<FeedbackField>(10);
    public long restaurantId;
    public Customer customer;
    public Order order;

    public CustomerFeedback(){
    }

    public void prepareFeedbackQuestions(long id) {
        restaurantId = id;
        feedbackFields.add(new FeedbackField(1L, HAPPINESS_METER.getFeedbackTypeId(), true));
        feedbackFields.add(new FeedbackField(2L, HAPPINESS_METER.getFeedbackTypeId(), true));
        feedbackFields.add(new FeedbackField(3L, STAR_RATING.getFeedbackTypeId()));
        feedbackFields.add(new FeedbackField(4L, HAPPINESS_METER.getFeedbackTypeId()));
        feedbackFields.add(new FeedbackField(5L, STAR_RATING.getFeedbackTypeId(), true));
        feedbackFields.add(new FeedbackField(6L, REMARKS.getFeedbackTypeId()));
        feedbackFields.add(new FeedbackField(7L, REMARKS.getFeedbackTypeId()));
        feedbackFields.add(new FeedbackField(8L, STAR_RATING.getFeedbackTypeId()));
        feedbackFields.add(new FeedbackField(9L, REMARKS.getFeedbackTypeId()));
        feedbackFields.add(new FeedbackField(10L, HAPPINESS_METER.getFeedbackTypeId()));
    }

    public class FeedbackField extends BaseDomain {
        public Long feedbackFieldId;
        public String value;
        public Integer feedbackType;
        public boolean required;
        public String hint;
        public String validationErrorMessage;

        @ExcludeFromJsonSerialization public EditText commentView;//temporary solution to get the text on click of submit feedback

        public FeedbackField(Long feedbackFieldId) {
            this(feedbackFieldId, HAPPINESS_METER.getFeedbackTypeId());
        }

        public FeedbackField(Long feedbackFieldId, int fieldType) {
            this(feedbackFieldId, fieldType, false);
        }

        public FeedbackField(Long feedbackFieldId, int fieldType, boolean required) {
            this(feedbackFieldId, fieldType, false, null, null);
        }

        public FeedbackField(Long feedbackFieldId, int fieldType, boolean required, String hint, String validationErrorMessage) {
            this.feedbackFieldId = feedbackFieldId;
            this.feedbackType = fieldType;
            this.required = required;
            this.hint = hint;
            this.validationErrorMessage = validationErrorMessage;
        }

        public String getQuestion(Language language) {
            return getTitle(language);
            //return getTranslationFor(language.getCode()).getTitle();
        }
    }
}
