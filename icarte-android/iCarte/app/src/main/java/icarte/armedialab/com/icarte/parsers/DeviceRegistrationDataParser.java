package icarte.armedialab.com.icarte.parsers;

import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import icarte.armedialab.com.icarte.util.Utils;

/**
 * Created by Maqsood on 4/28/2017.
 */
@Deprecated
public class DeviceRegistrationDataParser implements Parser<Map<String, String>, JSONObject>{

    @Override
    public Map<String, String> parse(JSONObject response) {
        Map<String, String> data = new HashMap<String, String>();
        try {
            Log.d("Response from server: ", response.toString());
            data.put(Utils.RESTAURANT_ACTIVATION_KEY, response.getString("name"));
            data.put(Utils.RESTAURANT_CODE, response.getString("email"));
        } catch (JSONException e) {
            e.printStackTrace();
            Log.e(getClass().getName(), "Error while parsing json feed:", e);
        }
        return data;
    }
}
