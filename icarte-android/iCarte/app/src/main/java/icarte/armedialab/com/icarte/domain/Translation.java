package icarte.armedialab.com.icarte.domain;

import java.io.Serializable;

import ru.noties.storm.ForeignKeyAction;
import ru.noties.storm.anno.Autoincrement;
import ru.noties.storm.anno.Column;
import ru.noties.storm.anno.ForeignKey;
import ru.noties.storm.anno.PrimaryKey;
import ru.noties.storm.anno.Table;

/**
 * Created by Maqsood on 5/15/2017.
 */
@Table("translation")
public class Translation implements Serializable {

    @PrimaryKey
    @Autoincrement
    @Column
    private long id;

    @Column
    private long translationId; // this is the id on the server

    @Column
    private String title;

    @Column
    private String description;

    @Column
    private String classType;

    @Column
    private String dietaryInformation;

    @Column
    private boolean showValue;

    @Column("lang_id")
    @ForeignKey(
            parentTable = Language.class,
            parentColumnName = "id",
            onDelete = ForeignKeyAction.CASCADE,
            onUpdate = ForeignKeyAction.NO_ACTION
    )
    private long languageId;


    public Translation() {
    }


    public Translation(long translationId, String title, String description, String classType, boolean showValue, long language) {
        this.translationId = translationId;
        this.title = title;
        this.description = description;
        this.classType = classType;
        this.showValue = showValue;
        this.languageId = language;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getTranslationId() {
        return translationId;
    }

    public void setTranslationId(long translationId) {
        this.translationId = translationId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getClassType() {
        return classType;
    }

    public void setClassType(String classType) {
        this.classType = classType;
    }

    public boolean isShowValue() {
        return showValue;
    }

    public void setShowValue(boolean showValue) {
        this.showValue = showValue;
    }

    public long getLanguageId() {
        return languageId;
    }

    public void setLanguageId(long languageId) {
        this.languageId = languageId;
    }

    public String getDietaryInformation() {
        return dietaryInformation;
    }

    public void setDietaryInformation(String dietaryInformation) {
        this.dietaryInformation = dietaryInformation;
    }
}
