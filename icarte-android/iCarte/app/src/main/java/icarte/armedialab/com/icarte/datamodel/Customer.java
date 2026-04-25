package icarte.armedialab.com.icarte.datamodel;

import icarte.armedialab.com.icarte.domain.Restaurant;

/**
 * Created by Maqsood on 8/27/2017.
 */
public class Customer {
    Long customerId;
    String code;
    String firstName;
    String lastName;
    String mobile;
    String email;
    Restaurant.Address address;
    boolean subscribedToNewsletter;
    Restaurant restaurant;

    public long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(long customerId) {
        this.customerId = customerId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Restaurant.Address getAddress() {
        return address;
    }

    public void setAddress(Restaurant.Address address) {
        this.address = address;
    }

    public boolean isSubscribedToNewsletter() {
        return subscribedToNewsletter;
    }

    public void setSubscribedToNewsletter(boolean subscribedToNewsletter) {
        this.subscribedToNewsletter = subscribedToNewsletter;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Restaurant getRestaurant() {
        return restaurant;
    }

    public void setRestaurant(Restaurant restaurant) {
        this.restaurant = restaurant;
    }

    public CustomerJsonWrapper getCustomerJsonWrapper(){
        CustomerJsonWrapper jsonWrapper = new CustomerJsonWrapper();
        jsonWrapper.customerId = customerId;
        jsonWrapper.code = code;
        jsonWrapper.firstName = firstName;
        jsonWrapper.lastName = lastName;
        jsonWrapper.mobile = mobile;
        jsonWrapper.subscribedToNewsletter = subscribedToNewsletter;
        return jsonWrapper;
    }

    public class CustomerJsonWrapper {
        public Long customerId;
        public String code;
        public String firstName;
        public String lastName;
        public String mobile;
        //public Address address;
        public boolean subscribedToNewsletter;

    }
}
