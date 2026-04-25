package icarte.armedialab.com.icarte.parsers;

import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Maqsood on 4/28/2017.
 */
@Deprecated
public class DeviceVerificationDataParser implements Parser<List<String>, JSONObject>{

    @Override
    public List<String> parse(JSONObject response) {
        List<String> res = new ArrayList<String>(2);
        try {
            res.add(response.getString("name"));
            res.add(response.getString("email"));
        } catch (JSONException e) {
            e.printStackTrace();
            Log.e(getClass().getName(), "Error while parsing json feed:", e);
        }
        return res;

    }
}
