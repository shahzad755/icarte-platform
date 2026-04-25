package icarte.armedialab.com.icarte.util;

/**
 * Copyright 2013 Ognyan Bankov
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import android.util.Log;

import com.android.volley.DefaultRetryPolicy;
import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyLog;
import com.android.volley.error.AuthFailureError;
import com.android.volley.error.ParseError;
import com.android.volley.toolbox.HttpHeaderParser;
import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonSyntaxException;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.util.Map;

import icarte.armedialab.com.icarte.datamodel.Order;

/**
 * Volley adapter for JSON requests with POST method that will be parsed into Java objects by Gson.
 */
public class GsonRequest<T> extends Request<T> {
    private static String TAG = GsonRequest.class.getName();

    /** Charset for request. */
    protected static final String PROTOCOL_CHARSET = "utf-8";

    /** Content type for request. */
    private static final String PROTOCOL_CONTENT_TYPE =
            String.format("application/json; charset=%s", PROTOCOL_CHARSET);

    private Class<T> clazz;
    private Type type;
    private Map<String, String> headers;
    private Map<String, String> params;
    private Listener<T> listener;
    private Object requestObject;
    private String dateFormat = Utils.DATE_FORMAT_MEDIUM;
    private Gson mGson = new GsonBuilder()
            .setDateFormat(dateFormat)
            .setExclusionStrategies(new JsonExclusionStrategy(ExcludeFromJsonSerialization.class))
            .create();

    /**
     * Make a GET request and return a parsed object from JSON.
     *
     * @param url URL of the request to make
     * @param type Relevant class object, for Gson's reflection
     */
    public GsonRequest(int method,
                       String url,
                       Class<T> clazz,
                       Type type,
                       Map<String, String> params,
                       Listener<T> listener,
                       ErrorListener errorListener) {
        this(method, url, clazz, type, null, null, listener, errorListener, null);
    }

    /**
     * Make a GET request and return a parsed object from JSON.
     *
     * @param url URL of the request to make
     * @param type Relevant class object, for Gson's reflection
     */
    public GsonRequest(int method,
                       String url,
                       Type type,
                       Map<String, String> params,
                       Listener<T> listener,
                       ErrorListener errorListener) {
        this(method, url, null, type, null, null, listener, errorListener, null);
    }

    /**
     * Make a GET request and return a parsed object from JSON.
     *
     * @param url URL of the request to make
     * @param type Relevant class object, for Gson's reflection
     */
    public GsonRequest(String url,
                       Type type,
                       Object requestObject,
                       Listener<T> listener,
                       ErrorListener errorListener,
                       String dateFormat) {
        this(Request.Method.POST, url, null, type, requestObject, null, listener, errorListener, dateFormat);
    }

    /**
     * Make a POST request and return a parsed object from JSON.
     *
     * @param url URL of the request to make
     * @param type Relevant class object, for Gson's reflection
     */
    public GsonRequest(int method,
                       String url,
                       Class<T> clazz,
                       Type type,
                       Object requestObject,
                       Map<String, String> params,
                       Listener<T> listener,
                       ErrorListener errorListener,
                       String dateFormat) {

        super(method, url, errorListener);
        this.clazz = clazz;
        this.type = type;
        this.params = params;
        this.listener = listener;
        this.headers = null;
        this.requestObject = requestObject;
        setRetryPolicy(new DefaultRetryPolicy(Utils.REQUEST_TIMEOUT,
                DefaultRetryPolicy.DEFAULT_MAX_RETRIES,
                DefaultRetryPolicy.DEFAULT_BACKOFF_MULT));
        if(dateFormat!=null && dateFormat.length()>0)
            this.dateFormat = dateFormat;

    }

    @Override
    public Map<String, String> getHeaders() throws AuthFailureError {
        return headers != null ? headers : super.getHeaders();
    }

    @Override
    public String getBodyContentType() {
        return PROTOCOL_CONTENT_TYPE;
    }

    @Override
    protected Map<String, String> getParams() throws AuthFailureError {
        return params;
    }

    @Override
    public byte[] getBody() throws AuthFailureError {
        if(params!=null)
            return super.getBody();
        else {
            String mRequestBody = null;
            try {
                mRequestBody = mGson.toJson(requestObject);
                Log.d(TAG, "Request JSON:"+mRequestBody);
                return mRequestBody == null ? null : mRequestBody.getBytes(PROTOCOL_CHARSET);
            } catch (UnsupportedEncodingException uee) {
                VolleyLog.wtf("Unsupported Encoding while trying to get the bytes of %s using %s",
                        mRequestBody, PROTOCOL_CHARSET);
                return null;
            }
        }
    }

    @Override
    protected void deliverResponse(T response) {
        listener.onResponse(response);
    }

    @Override
    protected Response<T> parseNetworkResponse(NetworkResponse response) {
        try {
            String json = new String(
                    response.data, HttpHeaderParser.parseCharset(response.headers));

            Log.d(TAG, "Response as received from server:" + json);
            if(type!=null) {
                return (Response<T>) Response.success(
                        mGson.fromJson(
                                json,
                                this.type),
                        HttpHeaderParser.parseCacheHeaders(response));
            } else {
                return Response.success(
                        mGson.fromJson(json, clazz), HttpHeaderParser.parseCacheHeaders(response));
            }
        } catch (UnsupportedEncodingException e) {
            return Response.error(new ParseError(e));
        } catch (JsonSyntaxException e) {
            return Response.error(new ParseError(e));
        }
    }

/*    public void setRequestObject(Object requestObject) {
        this.requestObject = requestObject;
    }*/

    private static class JsonExclusionStrategy implements ExclusionStrategy {
        private final Class<?> typeToSkip;

        private JsonExclusionStrategy(Class<?> typeToSkip) {
            this.typeToSkip = typeToSkip;
        }

        public boolean shouldSkipClass(Class<?> clazz) {
            return (clazz == typeToSkip);
        }

        public boolean shouldSkipField(FieldAttributes f) {
            return f.getAnnotation(ExcludeFromJsonSerialization.class) != null;
        }
    }
}
