package icarte.armedialab.com.icarte.domain;

import java.io.Serializable;

import ru.noties.storm.anno.Column;
import ru.noties.storm.anno.PrimaryKey;
import ru.noties.storm.anno.Table;

/**
 * Created by Maqsood on 6/20/2017.
 */
@Table("spice_type")
public class SpiceType extends BaseDomain implements Serializable{
    @Column
    @PrimaryKey
    private long spiceTypeId;

    @Column
    private String imageUrl;

    public long getSpiceTypeId() {
        return spiceTypeId;
    }

    public void setSpiceTypeId(long spiceTypeId) {
        this.spiceTypeId = spiceTypeId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
}
