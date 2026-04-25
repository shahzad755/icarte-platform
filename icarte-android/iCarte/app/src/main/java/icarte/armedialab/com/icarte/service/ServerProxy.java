package icarte.armedialab.com.icarte.service;

import com.google.gson.reflect.TypeToken;

import java.util.Map;

import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.datamodel.Staff;
import icarte.armedialab.com.icarte.domain.CustomerFeedback;
import icarte.armedialab.com.icarte.datamodel.Order;
import icarte.armedialab.com.icarte.datamodel.OrderResponse;
import icarte.armedialab.com.icarte.datamodel.RequestWrapper;
import icarte.armedialab.com.icarte.listeners.ResponseListener;
import icarte.armedialab.com.icarte.domain.Restaurant;
import icarte.armedialab.com.icarte.responses.ServerResponse;
import icarte.armedialab.com.icarte.ui.CallWaiterOnClickHandler;
import icarte.armedialab.com.icarte.ui.ContactUsFormFragment;
import icarte.armedialab.com.icarte.util.GsonRequest;
import icarte.armedialab.com.icarte.util.ItemWrapper;
import icarte.armedialab.com.icarte.util.Utils;

/**
 * Created by Maqsood on 4/25/2017.
 */
public class ServerProxy {

    private static final String TAG = ServerProxy.class.getName();

    // JEE based urls
    private static final String SERVER_ACTIVATION_URL = Utils.HOST+"/"+Utils.CONTEXT+"/verifyactivation";//http://api.androidhive.info/game/game_stats.json";
    private static final String SERVER_DEVICE_REG_URL = Utils.HOST+"/"+Utils.CONTEXT+"/registerdevice";//"http://10.0.2.2/icarte/echo.php";//http://api.androidhive.info/volley/person_object.json";
    private static final String SERVER_LOAD_ITEMS = Utils.HOST+"/"+Utils.CONTEXT+"/loaditems";//"http://10.0.2.2/icarte/echo.php";//http://api.androidhive.info/volley/person_object.json";
    private static final String SERVER_ORDER_SUBMIT_URL = Utils.HOST+"/"+Utils.CONTEXT+"/submitorder";
    private static final String SERVER_SUBMIT_FEEDBACK_URL = Utils.HOST + "/" + Utils.CONTEXT + "/submitfeedback";
    private static final String SERVER_SUBMIT_COMMENTS_URL = Utils.HOST + "/" + Utils.CONTEXT + "/submitcomments";
    private static final String SERVER_CALL_WAITER_URL = Utils.HOST + "/" + Utils.CONTEXT + "/callwaiter";
    private static final String SERVER_LOGIN_REQUEST_URL = Utils.HOST + "/" + Utils.CONTEXT + "/stafflogin";;



    // PHP based urls

    /*
    private static final String SERVER_ACTIVATION_URL = Utils.HOST+"/"+Utils.CONTEXT+"/verifyactivation1.php";//http://api.androidhive.info/game/game_stats.json";
    private static final String SERVER_DEVICE_REG_URL = Utils.HOST+"/"+Utils.CONTEXT+"/registerdevice.php";//"http://10.0.2.2/icarte/echo.php";//http://api.androidhive.info/volley/person_object.json";
    private static final String SERVER_LOAD_ITEMS = Utils.HOST+"/"+Utils.CONTEXT+"/loaditems.php";//"http://10.0.2.2/icarte/echo.php";//http://api.androidhive.info/volley/person_object.json";
    private static final String SERVER_ORDER_SUBMIT_URL = Utils.HOST+"/"+Utils.CONTEXT+"/submitorder.php";
    private static final String SERVER_SUBMIT_FEEDBACK_URL = Utils.HOST + "/" + Utils.CONTEXT + "/submitfeedback.php";
    private static final String SERVER_SUBMIT_COMMENTS_URL = Utils.HOST + "/" + Utils.CONTEXT + "/submitcomments.php";
    private static final String SERVER_CALL_WAITER_URL = Utils.HOST + "/" + Utils.CONTEXT + "/callwaiter.php";
    private static final String SERVER_LOGIN_REQUEST_URL = Utils.HOST + "/" + Utils.CONTEXT + "/login.php";;
*/

    public static void verifyDevice(final RequestWrapper request,
                               ResponseListener.ResponseProcessor responseProcessor) {
        ResponseListener<ServerResponse<Restaurant>> listener = new ResponseListener(responseProcessor);
        GsonRequest<ServerResponse<Restaurant>> gsonRequest = new GsonRequest<ServerResponse<Restaurant>>(
                SERVER_ACTIVATION_URL,
                new TypeToken<ServerResponse<Restaurant>>() {
                }.getType(),
                request,
                listener,
                listener,
                null
        );
        gsonRequest.setShouldCache(false);

        ApplicationController.getInstance().addToRequestQueue(gsonRequest, TAG + responseProcessor.getClass());
    }

    public static void registerDevice(final RequestWrapper request, ResponseListener.ResponseProcessor responseProcessor) {
        ResponseListener<ServerResponse<Restaurant>> listener = new ResponseListener(responseProcessor);
        GsonRequest<ServerResponse<Restaurant>> gsonRequest = new GsonRequest<ServerResponse<Restaurant>>(
                SERVER_DEVICE_REG_URL,
                new TypeToken<ServerResponse<Restaurant>>() {}.getType(),
                request,
                listener,
                listener,
                null
                );

        gsonRequest.setShouldCache(false);
        ApplicationController.getInstance().addToRequestQueue(gsonRequest, TAG+responseProcessor.getClass());
    }

    public static void loadItems(final RequestWrapper<Map<String, String>> request, ResponseListener.ResponseProcessor responseProcessor) {
        ResponseListener<ServerResponse<ItemWrapper>> listener = new ResponseListener(responseProcessor);
        GsonRequest<ServerResponse<ItemWrapper>> gsonRequest = new GsonRequest<ServerResponse<ItemWrapper>>(
                SERVER_LOAD_ITEMS,
                new TypeToken<ServerResponse<ItemWrapper>>() {}.getType(),
                request,
                listener,
                listener,
                null
        );

        gsonRequest.setShouldCache(false);
        ApplicationController.getInstance().addToRequestQueue(gsonRequest, TAG+responseProcessor.getClass());
    }

    public static void submitOrder(final RequestWrapper<Order.OrderJsonWrapper> request, ResponseListener.ResponseProcessor responseProcessor) {
        ResponseListener<ServerResponse<OrderResponse>> listener = new ResponseListener(responseProcessor);
        GsonRequest<ServerResponse<OrderResponse>> gsonRequest = new GsonRequest<ServerResponse<OrderResponse>>(
                SERVER_ORDER_SUBMIT_URL,
                new TypeToken<ServerResponse<OrderResponse>>() {}.getType(),
                request,
                listener,
                listener,
                null
        );

        gsonRequest.setShouldCache(false);
        ApplicationController.getInstance().addToRequestQueue(gsonRequest, TAG+responseProcessor.getClass());
    }

    public static void submitFeedbackQuestions(final RequestWrapper<CustomerFeedback> request,
                                               ResponseListener.ResponseProcessor responseProcessor) {
        ResponseListener<ServerResponse<?>> listener = new ResponseListener<ServerResponse<?>>(responseProcessor);
        GsonRequest<ServerResponse<?>> gsonRequest = new GsonRequest<ServerResponse<?>>(
                SERVER_SUBMIT_FEEDBACK_URL,
                new TypeToken<ServerResponse<?>>() {}.getType(),
                request,
                listener,
                listener,
                null
        );

        gsonRequest.setShouldCache(false);
        ApplicationController.getInstance().addToRequestQueue(gsonRequest, TAG+responseProcessor.getClass());
    }

    public static void submitComments(final RequestWrapper<ContactUsFormFragment.ContactUs> request,
                                               ResponseListener.ResponseProcessor responseProcessor) {
        ResponseListener<ServerResponse<?>> listener = new ResponseListener<ServerResponse<?>>(responseProcessor);
        GsonRequest<ServerResponse<?>> gsonRequest = new GsonRequest<ServerResponse<?>>(
                SERVER_SUBMIT_COMMENTS_URL,
                new TypeToken<ServerResponse<?>>() {}.getType(),
                request,
                listener,
                listener,
                null
        );

        gsonRequest.setShouldCache(false);
        ApplicationController.getInstance().addToRequestQueue(gsonRequest, TAG+responseProcessor.getClass());
    }

    public static void callWaiterRequest(RequestWrapper<CallWaiterOnClickHandler.CallWaiterRequest> request, ResponseListener.ResponseProcessor<ServerResponse<?>> responseProcessor) {
        ResponseListener<ServerResponse<?>> listener = new ResponseListener<ServerResponse<?>>(responseProcessor);
        GsonRequest<ServerResponse<?>> gsonRequest = new GsonRequest<ServerResponse<?>>(
                SERVER_CALL_WAITER_URL,
                new TypeToken<ServerResponse<?>>() {}.getType(),
                request,
                listener,
                listener,
                null
        );

        gsonRequest.setShouldCache(false);
        ApplicationController.getInstance().addToRequestQueue(gsonRequest, TAG+responseProcessor.getClass());
    }

    public static void submitLogin2(RequestWrapper<Staff> request, ResponseListener.ResponseProcessor responseProcessor) {
        ResponseListener<ServerResponse<Staff>> listener = new ResponseListener(responseProcessor);
        GsonRequest<ServerResponse<Staff>> gsonRequest = new GsonRequest<ServerResponse<Staff>>(
                SERVER_LOGIN_REQUEST_URL,
                new TypeToken<ServerResponse<?>>() {}.getType(),
                request,
                listener,
                listener,
                null
        );

        gsonRequest.setShouldCache(false);
        ApplicationController.getInstance().addToRequestQueue(gsonRequest, TAG+responseProcessor.getClass());
    }
    public static void submitLogin(final RequestWrapper request,
                                    ResponseListener.ResponseProcessor<ServerResponse<Staff>> responseProcessor) {
        ResponseListener<ServerResponse<Staff>> listener = new ResponseListener<ServerResponse<Staff>>(responseProcessor);
        GsonRequest<ServerResponse<Staff>> gsonRequest = new GsonRequest<ServerResponse<Staff>>(
                SERVER_LOGIN_REQUEST_URL,
                new TypeToken<ServerResponse<Staff>>() {
                }.getType(),
                request,
                listener,
                listener,
                null
        );
        gsonRequest.setShouldCache(false);

        ApplicationController.getInstance().addToRequestQueue(gsonRequest, TAG + responseProcessor.getClass());
    }

    /*
    public void registerDevice(final Map<String, String> request, ResponseListener.ResponseProcessor responseProcessor) {
        ResponseListener listener = new ResponseListener(new DeviceRegistrationDataParser(), responseProcessor);
        JsonObjectRequest jsonReq = new JsonObjectRequest(Request.Method.POST,
                SERVER_DEVICE_REG_URL, new JSONObject(request), listener, listener){
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                HashMap<String, String> headers = new HashMap<String, String>();
                headers.put("Content-Type", "application/json; charset=utf-8");
                headers.put("User-agent", "iCarte on some android device");
                return headers;
            }
        };
        ApplicationController.getInstance().addToRequestQueue(jsonReq, TAG+responseProcessor.getClass());
    }
*/
}
