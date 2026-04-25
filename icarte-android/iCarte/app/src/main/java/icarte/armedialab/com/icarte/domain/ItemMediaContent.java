package icarte.armedialab.com.icarte.domain;

import java.io.Serializable;

import ru.noties.storm.anno.Column;
import ru.noties.storm.anno.PrimaryKey;
import ru.noties.storm.anno.Table;

/**
 * Created by Maqsood on 6/20/2017.
 */
@Table("item_media_content")
public class ItemMediaContent extends BaseDomain implements Serializable {

    @Column
    @PrimaryKey
    private long itemMediaId;

    @Column
    private String imageUrl;

    @Column
    private String vedioUrl;

    @Column
    private int displayOrder;

    @Column
    private long itemId;

    private Item item;

    public long getItemMediaId() {
        return itemMediaId;
    }

    public void setItemMediaId(long itemMediaId) {
        this.itemMediaId = itemMediaId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getVedioUrl() {
        return vedioUrl;
    }

    public void setVedioUrl(String vedioUrl) {
        this.vedioUrl = vedioUrl;
    }

    public int getDisplayOrder() {
        return displayOrder;
    }

    public void setDisplayOrder(int displayOrder) {
        this.displayOrder = displayOrder;
    }

    public long getItemId() {
        return itemId;
    }

    public void setItemId(long itemId) {
        this.itemId = itemId;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
        if(item!=null) {
            setItemId(item.getItemId());
        }
    }

    @Override
    public String toString() {
        return this.getImageUrl();
    }
}
