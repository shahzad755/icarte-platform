package icarte.armedialab.com.icarte.domain;

import java.io.Serializable;
import java.util.Date;

import ru.noties.storm.anno.Autoincrement;
import ru.noties.storm.anno.Column;
import ru.noties.storm.anno.Index;
import ru.noties.storm.anno.PrimaryKey;
import ru.noties.storm.anno.Table;
import ru.noties.storm.anno.Unique;

/**
 * Created by Maqsood on 4/22/2017.
 */
@Table("app_configruation")
public class AppConfigurationData implements Serializable {

    @Column
    @PrimaryKey
    @Autoincrement
    private long id;

    @Column
    @Unique
    @Index("config_code_idx")
    private String configCode;

    @Column
    private String configValue;

    @Column
    private Date lastServerInquiryDate;

    public AppConfigurationData() {
        super();
    }

    public AppConfigurationData(String configCode, String configValue) {
        this.configCode = configCode;
        this.configValue = configValue;
        this.lastServerInquiryDate = new Date();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getConfigCode() {
        return configCode;
    }

    public void setConfigCode(String configCode) {
        this.configCode = configCode;
    }

    public String getConfigValue() {
        return configValue;
    }

    public void setConfigValue(String configValue) {
        this.configValue = configValue;
    }

    public Date getLastServerInquiryDate() {
        return lastServerInquiryDate;
    }

    public void setLastServerInquiryDate(Date lastServerInquiryDate) {
        this.lastServerInquiryDate = lastServerInquiryDate;
    }
}
