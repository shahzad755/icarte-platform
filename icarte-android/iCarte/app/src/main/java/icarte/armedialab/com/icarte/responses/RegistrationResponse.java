package icarte.armedialab.com.icarte.responses;

import icarte.armedialab.com.icarte.domain.Restaurant;

/**
 * Created by Maqsood on 5/2/2017.
 */
@Deprecated
public class RegistrationResponse {

    private Restaurant restaurant;
    private String activationCode;
    private boolean isRegistrationActive;

    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    public boolean isRegistrationActive() {
        return isRegistrationActive;
    }

    public void setRegistrationActive(boolean isRegistrationActive) {
        this.isRegistrationActive = isRegistrationActive;
    }

    public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }
}
