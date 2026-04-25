package icarte.armedialab.com.icarte.util;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.v7.app.AlertDialog;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.Menu;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.github.johnpersano.supertoasts.SuperToast;
import com.mikepenz.actionitembadge.library.utils.BadgeStyle;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.Order;
import icarte.armedialab.com.icarte.domain.Item;
import icarte.armedialab.com.icarte.domain.Language;
import icarte.armedialab.com.icarte.ui.HomeActivity;
import me.fichardu.circleprogress.CircleProgress;

public class Utils {

    public static final String DATE_FORMAT_MEDIUM = "yyyy-MM-dd HH:mm";
    public static final String DATE_FORMAT_LONG = "yyyy-MM-dd'T'HH:mm:ssZ";
    public static final String DATE_FORMAT = "yyyy-MM-dd";
    public static final String TIME_FORMAT = "HH:mm:ss";
    public static final String DAY = "dd";
    public static final String MONTH = "MMM";
    public static final String YEAR = "yyyy";
    public static final String DATE_FORMAT_DEFAULT = DATE_FORMAT_LONG;

    public static final String APP_VERSION_ID = "applicationVersion";
    public static final String RESTAURANT_ACTIVATION_KEY = "restaurantActivationKey";
    public static final String DEVICE_SERIAL_NO = "deviceSerialNo";
    public static final String DEVICE_REG_CODE = "deviceRegistrationCode";
    public static final String RESTAURANT_CODE = "restaurantCode";
    public static final String RESTAURANT_NAME = "restaurantName";
    public static final String DEVICE_NAME = "deviceName";
    public static final Language ENGLISH = new Language(1, "en", "English", true);
    public static final Language ARABIC = new Language(2, "ar", "Arabic", true);
    public static final String CURRENCY = "AED";

    public static final Language DEFAULT_LANGUAGE = ENGLISH;
    public static final String KEY_SELECTED_CATEGORY = "category";
    public static final int MIN_ITEM_ORDER_QTY = 1;
    public static final int MAX_ITEM_ORDER_QTY = 25;
    public static final String KEY_ITEM_MEDIA_CONTENTS = "item_media_contents";
    private static final String IMAGES_FOLDER = "restaurant-images";
    public static final String APP_VERSION = "0.1.0";
    public static final String KEY_ORDER_RESPONSE = "order_response";
    public static final int REQUEST_TIMEOUT = 10000;

    public static final String HOST = "http://localhost:8080";
    //public static final String CONTEXT = "icarte"; //php context
    public static final String CONTEXT = "icarte-portal-0.1"; //JEE context


    private static String IMAGE_PATH = HOST + "/" + CONTEXT + "/"+ IMAGES_FOLDER + "/";
    public static final ApplicationMode DEFAULT_APPLICATION_MODE = ApplicationMode.ROAMING;


    private static Pattern pattern = Pattern.compile("^(\\+97[\\s]{0,1}[\\-]{0,1}[\\s]{0,1}1|0)50[\\s]{0,1}[\\-]{0,1}[\\s]{0,1}[1-9]{1}[0-9]{6}$");


    public static boolean validateContactNumber(String contactNumber) {
        if(ApplicationController.getInstance().isContactNumberMandatoryForOrder()) {
            return !isEmptyString(contactNumber);
            /*  //TODO: Fix the validation
                    if(contactNumber!=null && contactNumber.length()>0) {
                        return pattern.matcher(contactNumber).matches();
                    }
            */
        } else
            return true;
    }

    public static void showErrorView(View btnRetry, View txtConnectionError) {
        btnRetry.setVisibility(View.VISIBLE);
        txtConnectionError.setVisibility(View.VISIBLE);
    }

    public static void hideErrorView(View btnRetry, View txtConnectionError) {
        if(btnRetry.getVisibility()!=View.GONE)
            btnRetry.setVisibility(View.GONE);

        if(txtConnectionError.getVisibility()!=View.GONE)
            txtConnectionError.setVisibility(View.GONE);
    }

    @NonNull
    public static BadgeStyle getBadgeStyle() {
        return new BadgeStyle(
                BadgeStyle.Style.DEFAULT,
                R.layout.menu_badge_custom,
                Color.parseColor("#99CC00"),
                Color.parseColor("#669900"),
                Color.WHITE,
                10);
    }

    public enum RequestCode {
        REGISTER_DEVICE("register_device"),
        VERIFY_DEVICE("verify_device"),
        LOAD_ITEMS("load_items"),
        SUBMIT_ORDER("submit_order"),
        SUBMIT_FEEDBACK("submit_feedback"),
        SUBMIT_COMMENTS("submit_comments"),
        CALL_WAITER("call_waiter"),
        LOGIN("login_request");

        private String requestCode;

        RequestCode(String requestCode) {
            this.requestCode = requestCode;
        }

        public String getRequestCode() {
            return requestCode;
        }
    }

    public enum ErrorCode {
        GeneralError(5000, "An error has occured, please contact the Administrator for details..."),
        RecordNotFound(1001, "No database record found for the given id/code"),
        UKFailure(1002, "Unique key constraint failed while saving the record"),
        InsertionFailure(1003, "Error occurred while saving new record..."),
        UpdationFailure(1004, ""),
        DatabaseFailure(1005, ""),

        NetworkNotAvailable(2001, ""),
        BadResponseRecieved(3001, ""),
        ResponseNotParseable(3001, "");

        private long errorCode;
        private String errorMsg;

        ErrorCode(long errorCode, String errorMsg) {
            this.errorCode = errorCode;
            this.errorMsg = errorMsg;
        }

        public long getErrorCode() {
            return errorCode;
        }

        public void setErrorCode(long errorCode) {
            this.errorCode = errorCode;
        }

        public String getErrorMsg() {
            return errorMsg;
        }

        public void setErrorMsg(String errorMsg) {
            this.errorMsg = errorMsg;
        }
    }


    public enum LanguageCodes {

        ENGLISH("en", Utils.ENGLISH),
        ARABIC("ar", Utils.ARABIC);

        private String languageCode;
        private Language language;

        LanguageCodes(String languageCode, Language lang) {
            this.languageCode = languageCode;
            this.language = lang;
        }

        public Language getLanguage() {
            return language;
        }

        public void setLanguage(Language language) {
            this.language = language;
        }

        public String getLanguageCode() {
            return languageCode;
        }

        public static Language findLanguage(String languageCode) {
            LanguageCodes[] codes = LanguageCodes.values();
            for (LanguageCodes lang: codes) {
                if(lang.getLanguageCode().equals(languageCode)){
                    return lang.language;
                }
            }
            return null;
        }
    }

    public enum FeedbackType {
        HAPPINESS_METER(1),
        STAR_RATING(2),
        REMARKS(3);

        int feedbackTypeId;

        FeedbackType(int feedbackTypeId) {
            this.feedbackTypeId = feedbackTypeId;
        }

        public int getFeedbackTypeId() {
            return feedbackTypeId;
        }

        public static FeedbackType getFeedBackType(int feedbackTypeId) {
            FeedbackType[] codes = FeedbackType.values();
            FeedbackType type = REMARKS;
            for (FeedbackType feedbackType: codes) {
                if(feedbackType.getFeedbackTypeId()== feedbackTypeId){
                    type = feedbackType;
                    break;
                }
            }
            return type;
        }

    }

    public enum HappinessFeedbackType {
        HAPPY("1"),
        NEUTRAL("2"),
        SAD("3");

        private String happinessFeedbackTypeId;

        HappinessFeedbackType(String id) {
            this.happinessFeedbackTypeId = id;
        }

        public String getHappinessFeedbackTypeId() {
            return happinessFeedbackTypeId;
        }
    }

    public enum ApplicationMode {
        ROAMING(1),
        FIXED(2),
        KIOSK(3);

        int applicationMode;

        ApplicationMode(int applicationMode) {
            this.applicationMode= applicationMode;
        }

        public int getApplicationMode() {
            return applicationMode;
        }

        public static ApplicationMode getApplicationMode(int applicationMode) {
            ApplicationMode[] modes = ApplicationMode.values();
            ApplicationMode mode = DEFAULT_APPLICATION_MODE;
            for (ApplicationMode appMode: modes) {
                if(appMode.getApplicationMode()== applicationMode){
                    mode = appMode;
                    break;
                }
            }
            return mode;
        }

    }

    /**
     * Use for getting your device id if available.
     *
     * @param context the context
     * @return your device id
     */
    public static String getDeviceId(Context context) {
/*
            TelephonyManager telephonyManager =
                (TelephonyManager) context.getSystemService(Context.TELEPHONY_SERVICE);
            return telephonyManager.getDeviceId();
*/
        String sId = ApplicationController.getInstance().getDeviceId();
        if(isEmptyString(sId)) {
            sId = Installation.id(context);
            ApplicationController.getInstance().setDeviceId(sId);
        }
        return sId;
    }

    public static boolean isEmptyEditText(EditText edText) {
        return edText == null || isEmptyString(edText.getText().toString());
    }

    public static boolean isEmptyString(String aString) {
        return !(aString != null && aString.trim().length() > 0);
    }

    /**
     * check availability of Internet
     *
     * @param context the context
     * @return true or false
     */
    public static boolean isNetworkAvailable(Context context) {

        ConnectivityManager cm = (ConnectivityManager) context
                .getSystemService(Context.CONNECTIVITY_SERVICE);
        if (cm != null) {
            NetworkInfo netInfo = cm.getActiveNetworkInfo();
            if (netInfo != null && netInfo.isConnected()) {
                return true;
            }
        }
        return false;
    }

    /**
     * Get today's date in any format.
     *
     * @param dateFormat pass format for get like: "yyyy-MM-dd hh:mm:ss"
     * @return current date in string format
     */
    public static String getCurrentDateAsString(String dateFormat) {
        Locale locale;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            locale = Locale.forLanguageTag(
                    ApplicationController.getInstance().getUserLanguage().getCode());
        } else {
            locale = Locale.getDefault();
        }
        return new SimpleDateFormat(dateFormat, locale).format(new Date().getTime());
    }

    /**
     * Format given date in any format.
     *
     * @param date to be formatted
     * @param dateFormat pass format for get like: "yyyy-MM-dd hh:mm:ss"
     * @return current date in string format
     */
    public static String getDateAsString(Date date, String dateFormat) {
        Locale locale;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            locale = Locale.forLanguageTag(
                    ApplicationController.getInstance().getUserLanguage().getCode());
        } else {
            locale = Locale.getDefault();
        }
        return new SimpleDateFormat(dateFormat, locale).format(date.getTime());
    }

    public static void showToast(Context context, String text) {
       SuperToast superToast = new SuperToast(context);
        superToast.setDuration(SuperToast.Duration.LONG);
        superToast.setText(text);
        superToast.setIcon(SuperToast.Icon.Light.INFO, SuperToast.IconPosition.LEFT);
        superToast.setAnimations(SuperToast.Animations.FLYIN);
        superToast.setBackground(R.color.bluegreen);
        superToast.show();
/*
        Toast toast = Toast.makeText(context, text, Toast.LENGTH_LONG);
        toast.setGravity(Gravity.CENTER, 0, 0);
        toast.show();*/

    }

    public static String saveToInternalSorage(Bitmap bitmapImage, String imageDir, String name, Context context) throws IOException {
        ContextWrapper cw = new ContextWrapper(context);
        // path to /data/data/yourapp/app_data/imageDir
        File directory = cw.getDir(imageDir, Context.MODE_PRIVATE);
        // Create imageDir
        File mypath=new File(directory, name);

        FileOutputStream fos = null;


            fos = new FileOutputStream(mypath);

            // Use the compress method on the BitMap object to write image to the OutputStream
            bitmapImage.compress(Bitmap.CompressFormat.PNG, 100, fos);
            fos.close();

        return directory.getAbsolutePath();
    }

    public static void loadImageFromStorage(String path, String name, ImageView img) throws FileNotFoundException
    {
            File f=new File(path, name);
            Bitmap b = BitmapFactory.decodeStream(new FileInputStream(f));
            img.setImageBitmap(b);

    }

    /** Returns the consumer friendly device name */
    public static String getDeviceName() {
        final String manufacturer = Build.MANUFACTURER;
        final String model = Build.MODEL;
        if (model.startsWith(manufacturer)) {
            return capitalize(model);
        }
        if (manufacturer.equalsIgnoreCase("HTC")) {
            // make sure "HTC" is fully capitalized.
            return "HTC " + model;
        }
        return capitalize(manufacturer) + " " + model;
    }

    private static String capitalize(String str) {
        if (TextUtils.isEmpty(str)) {
            return str;
        }
        final char[] arr = str.toCharArray();
        boolean capitalizeNext = true;
        String phrase = "";
        for (final char c : arr) {
            if (capitalizeNext && Character.isLetter(c)) {
                phrase += Character.toUpperCase(c);
                capitalizeNext = false;
                continue;
            } else if (Character.isWhitespace(c)) {
                capitalizeNext = true;
            }
            phrase += c;
        }
        return phrase;
    }

    public static int getBackgroundColorRes(int position, int itemLayoutRes) {
        return (position % 4 == 0 || position % 4 == 3) ? R.color.green : R.color.blue;
    }

    public static Map<String, Integer> buildEffectMap(Context context) {
        Map<String, Integer> effectMap = new LinkedHashMap<>();
        int i = 0;
        String[] effects = context.getResources().getStringArray(R.array.jazzy_effects);
        for (String effect : effects) {
            effectMap.put(effect, i++);
        }
        return effectMap;
    }

    public static void populateEffectMenu(Menu menu, List<String> effectNames, Context context) {
        Collections.sort(effectNames);
        effectNames.remove(context.getString(R.string.standard));
        effectNames.add(0, context.getString(R.string.standard));
        for (String effectName : effectNames) {
            menu.add(effectName);
        }
    }

    public static boolean isShowDialog(Item item) {
        boolean hasVariants = item.getItemVariants()!=null && item.getItemVariants().size()>0;
        boolean hasAddOns = item.getAddons()!=null && item.getAddons().size()>0;
        return hasVariants || hasAddOns;
    }

    /**
     * Updates the Locale for the current process (application) to the given language code
     *
     * @param context the ContextWrapper instance to get the Resources from
     * @param language the language code in the form of <xx> (e.g. <es>) or <xx-(r)XX> (e.g. <pt-rBR>)
     * @param forceUpdate whether to force an update when the default language (empty language code) is requested
     */
    public static void setLanguage(final ContextWrapper context, Language language, final boolean forceUpdate) {
        final String languageCode = language.getCode();
        // if a custom language is requested (non-empty language code) or a forced update is requested
        if (!languageCode.equals("") || forceUpdate) {
            try {
                // create a new Locale instance
                final Locale newLocale;

                // if the default language is requested (empty language code)
                if (languageCode.equals("")) {
                    // set the new Locale instance to the default language
                    newLocale = new Locale(ApplicationController.getInstance().getUserLanguage().getCode());
                }
                // if a custom language is requested (non-empty language code)
                else {
                    // if the language code does also contain a region
                    if (languageCode.contains("-r") || languageCode.contains("-")) {
                        // split the language code into language and region
                        final String[] language_region = languageCode.split("\\-(r)?");
                        // construct a new Locale object with the specified language and region
                        newLocale = new Locale(language_region[0], language_region[1]);
                    }
                    // if the language code does not contain a region
                    else {
                        // simply construct a new Locale object from the given language code
                        newLocale = new Locale(languageCode);
                    }
                }

                // update the app's configuration to use the new Locale
                final Resources resources = context.getBaseContext().getResources();
                final android.content.res.Configuration conf = resources.getConfiguration();
                conf.locale = newLocale;
                resources.updateConfiguration(conf, resources.getDisplayMetrics());

                // overwrite the default Locale
                Locale.setDefault(newLocale);
            }
            catch (Exception ignored) { }
        }
    }


    public static void showProgressIndicator(View button, CircleProgress mProgressView, Resources resources) {
        button.setEnabled(false);
        mProgressView.setAlpha(0f);
        mProgressView.setVisibility(View.VISIBLE);
        mProgressView.startAnim();
        mProgressView.animate()
                .alpha(1f)
                .setDuration(resources.getInteger(
                        android.R.integer.config_mediumAnimTime))
                .setListener(null);
    }

    public static void hideProgressIndicator(View button, CircleProgress mProgressView) {
        mProgressView.stopAnim();
        mProgressView.setVisibility(View.INVISIBLE);
        button.setEnabled(true);
    }

    public static void showAlert(int messageId, String text, View v) {
        //Show a error dialog box
        AlertDialog.Builder alertDlg = new AlertDialog.Builder(v.getContext(),
                R.style.Theme_AlertDialogPro_Material_Light);
        if(text!=null)
            alertDlg.setMessage(text);
        else
            alertDlg.setMessage(messageId);

        alertDlg.setCancelable(true);
        alertDlg.setPositiveButton(R.string.label_btn_ok, null);

        alertDlg.create().show();
    }

    public static void navigateToHomeScreen(Activity activity) {
        activity.startActivity(new Intent(activity, HomeActivity.class));
        activity.finish();
    }

    public static boolean isTableNumberAvailable(){
        return !isEmptyString(getTableReferenceId());
    }

    public static String getTableReferenceId() {
        return ApplicationController.getInstance().getTableReference();
    }

    public static void hideKeyboard(Activity activity) {
        View view = activity.getCurrentFocus();
        if (view != null) {
            ((InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE)).
                    hideSoftInputFromWindow(view.getWindowToken(), InputMethodManager.HIDE_NOT_ALWAYS);
        }
    }

    public static void setImagePath(String path) {
        if(!isEmptyString(path)) {
            IMAGE_PATH = path;
        }
    }

    public static String getImagePath() {
        return IMAGE_PATH;
    }

}
