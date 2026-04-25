package icarte.armedialab.com.icarte.domain;

import android.support.annotation.NonNull;

import java.io.Serializable;
import java.util.List;

import icarte.armedialab.com.icarte.datamodel.Event;
import ru.noties.storm.anno.Autoincrement;
import ru.noties.storm.anno.Column;
import ru.noties.storm.anno.PrimaryKey;
import ru.noties.storm.anno.Table;


/**
 * Created by Maqsood on 5/6/2017.
 */
@Table("restaurant")
public class Restaurant extends BaseDomain implements Serializable {

    @PrimaryKey
    @Column
    @Autoincrement
    private long id;

    @Column
    @NonNull
    private String restaurantCode;

    @Column
    private String activationKey; /*Restaurant Activation Key*/

    @Column
    private String deviceRegistrationCode; /*Device Registration Code*/

    @Column
    private String contactPerson;

    @Column
    private String name;

    @Column
    private String logoSmall;

    @Column
    private String logoLarge;

    @Column
    private String theme;

    @Column
    private String backgroundImage;

    private AccountType accountType;

    @Column
    private boolean isBlocked;

    @Column
    private String deviceSerialNo;

    @Column
    private int applicationMode = 0;

    @Column
    private String tableReference;

    @Column
    private boolean contactNumberMandatory = Boolean.FALSE;

    @Column
    private String imagePath;

    private List<Menu> menus;

    private List<Branch> branches;

    private CustomerFeedback feedbackForm;

    private List<Event> events;

    public Restaurant() {
        super();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @NonNull
    public String getRestaurantCode() {
        return restaurantCode;
    }

    public void setRestaurantCode(@NonNull String restaurantCode) {
        this.restaurantCode = restaurantCode;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    public String getLogoSmall() {
        return logoSmall;
    }

    public void setLogoSmall(String logoSmall) {
        this.logoSmall = logoSmall;
    }

    public String getLogoLarge() {
        return logoLarge;
    }

    public void setLogoLarge(String logoLarge) {
        this.logoLarge = logoLarge;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getBackgroundImage() {
        return backgroundImage;
    }

    public void setBackgroundImage(String backgroundImage) {
        this.backgroundImage = backgroundImage;
    }

    public AccountType getAccountType() {
        return accountType;
    }

    public void setAccountType(AccountType accountType) {
        this.accountType = accountType;
    }

    public String getActivationKey() {
        return activationKey;
    }

    public void setActivationKey(String activationKey) {
        this.activationKey = activationKey;
    }

    public String getDeviceRegistrationCode() {
        return deviceRegistrationCode;
    }

    public void setDeviceRegistrationCode(String deviceRegistrationCode) {
        this.deviceRegistrationCode = deviceRegistrationCode;
    }

    public boolean isBlocked() {
        return isBlocked;
    }

    public void setBlocked(boolean isBlocked) {
        this.isBlocked = isBlocked;
    }

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }

    public void setIsBlocked(boolean isBlocked) {
        this.isBlocked = isBlocked;
    }

    public String getDeviceSerialNo() {
        return deviceSerialNo;
    }

    public void setDeviceSerialNo(String deviceSerialNo) {
        this.deviceSerialNo = deviceSerialNo;
    }

    public CustomerFeedback getFeedbackForm() {
        return feedbackForm;
    }

    public void setFeedbackForm(CustomerFeedback feedbackForm) {
        this.feedbackForm = feedbackForm;
    }

    public List<Branch> getBranches() {
        return branches;
    }

    public void setBranches(List<Branch> branches) {
        this.branches = branches;
    }

    public List<Event> getEvents() {
        return events;
    }

    public void setEvents(List<Event> events) {
        this.events = events;
    }

    public int getApplicationMode() {
        return applicationMode;
    }

    public void setApplicationMode(int applicationMode) {
        this.applicationMode = applicationMode;
    }

    public boolean isContactNumberMandatory() {
        return contactNumberMandatory;
    }

    public void setContactNumberMandatory(boolean contactNumberMandatory) {
        this.contactNumberMandatory = contactNumberMandatory;
    }

    public String getTableReference() {
        return tableReference;
    }

    public void setTableReference(String tableReference) {
        this.tableReference = tableReference;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public static class Branch {
        public long branchId;
        public String branchName;
        public Address address;
    }
    /**
     * Created by Maqsood on 8/27/2017.
     */
    public static class Address {
        public long restaurantId;
        public long addressId;
        public String description;
        public String street;
        public String area;
        public String city;
        public String country;
        public String poBox;
        public String phone1;
        public String phone2;
        public String phone3;
        public String lat;
        public String lon;
        public String email;
        public String mapsURL;
    }
}
