package icarte.armedialab.com.icarte.domain;

import java.io.Serializable;

import ru.noties.storm.anno.Column;
import ru.noties.storm.anno.PrimaryKey;
import ru.noties.storm.anno.Table;

/**
 * Created by Maqsood on 5/6/2017.
 */
@Table("accountType")
public class AccountType implements Serializable {

    @PrimaryKey
    @Column private long accountTypeId;

    @Column private String accountName;

    public AccountType() {
        super();
    }

    public long getAccountTypeId() {
        return accountTypeId;
    }

    public void setAccountTypeId(long accountTypeId) {
        this.accountTypeId = accountTypeId;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }
}
