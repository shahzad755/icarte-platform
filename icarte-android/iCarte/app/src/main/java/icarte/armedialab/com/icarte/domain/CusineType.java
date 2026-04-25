package icarte.armedialab.com.icarte.domain;

import java.io.Serializable;

import ru.noties.storm.anno.Column;
import ru.noties.storm.anno.PrimaryKey;
import ru.noties.storm.anno.Table;

/**
 * Created by Maqsood on 6/20/2017.
 */
@Table("cuisine_type")
public class CusineType extends BaseDomain implements Serializable {
    @Column
    @PrimaryKey
    private long cuisineTypeId;

    @Column
    private String imageUrl;

    public long getCuisineTypeId() {
        return cuisineTypeId;
    }

    public void setCuisineTypeId(long cuisineTypeId) {
        this.cuisineTypeId = cuisineTypeId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
