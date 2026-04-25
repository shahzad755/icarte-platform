package icarte.armedialab.com.icarte.listeners;

import com.android.volley.Response;
import com.android.volley.VolleyLog;
import com.android.volley.error.VolleyError;


/**
* Created by Maqsood on 4/29/2017.
*/
public class ResponseListener<T> implements Response.Listener <T>, Response.ErrorListener {
    private static final String TAG = ResponseListener.class.getName();
    //private Parser<Map<String, String>, T> parser;

    private ResponseProcessor<T> callback;

    public ResponseListener(ResponseProcessor<T> callback) {
        //this.parser = parser;
        this.callback = callback;
    }

    @Override
    public void onResponse(T response) {
        VolleyLog.d(TAG, "Response Received from server.."+ response);

        if (response != null) {
            this.callback.onSuccess(response);
        } else {
            throw new RuntimeException("Received json response is empty...");
        }
    }

    @Override
    public void onErrorResponse(VolleyError error) {
        VolleyLog.d(TAG, "Error Response received from server: " + error.getMessage());
        callback.onFault(error);
    }


    public static interface ResponseProcessor<T> {
        public void onSuccess(T response);
        public void onFault(VolleyError response);
    }
}
