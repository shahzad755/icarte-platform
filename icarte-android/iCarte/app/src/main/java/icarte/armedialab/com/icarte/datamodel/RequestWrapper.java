package icarte.armedialab.com.icarte.datamodel;

import java.util.HashMap;
import java.util.Map;

import icarte.armedialab.com.icarte.util.Utils;

/**
 * Created by Maqsood on 9/2/2017.
 */
public class RequestWrapper <T> {
    T request;
    private String requestType;
    private String applicationVersion = Utils.APP_VERSION;

    public RequestWrapper(String requestType) {
        this.requestType = requestType;
    }

    private Map<String, String> authorization = new HashMap<String, String>(5);

    public void setRestaurantActivationKey(String activationId){
        //authorization.put(Utils.APP_VERSION_ID, applicationVersion);
        authorization.put(Utils.RESTAURANT_ACTIVATION_KEY, activationId);
    }

    public void setRestaurantCode(String restaurantCode){
        authorization.put(Utils.RESTAURANT_CODE, restaurantCode);
    }

    public void setDeviceRegistrationCode(String deviceRegCode){
        authorization.put(Utils.DEVICE_REG_CODE, deviceRegCode);
    }

    public void setDeviceSerialNum(String deviceSerialNum){
        authorization.put(Utils.DEVICE_SERIAL_NO, deviceSerialNum);
        authorization.put(Utils.DEVICE_NAME, Utils.getDeviceName());
    }

    public void setRequest(T req){
        request =  req;
    }

    public Map<String, String> getAuthorization() {
        return authorization;
    }
}
