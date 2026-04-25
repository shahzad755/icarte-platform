package icarte.armedialab.com.icarte.domain;

import java.io.Serializable;

import ru.noties.storm.anno.Autoincrement;
import ru.noties.storm.anno.Column;
import ru.noties.storm.anno.PrimaryKey;
import ru.noties.storm.anno.Table;

/**
 * Created by Maqsood on 5/7/2017.
 */
@Table("ref_language")
public class Language implements Serializable {

    @PrimaryKey
    @Column private long id;

    @Column private String code;

    @Column private String name;

    @Column private boolean active;

    public Language() {
    }

    public Language(long id, String code, String name, boolean active) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.active = active;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
