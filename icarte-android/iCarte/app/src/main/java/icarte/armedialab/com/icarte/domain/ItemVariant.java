package icarte.armedialab.com.icarte.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Map;

import icarte.armedialab.com.icarte.ApplicationController;
import ru.noties.storm.anno.Column;
import ru.noties.storm.anno.PrimaryKey;
import ru.noties.storm.anno.Table;

/**
 * Created by Maqsood on 7/17/2017.
 */
@Table("item_variant")
public class ItemVariant extends BaseDomain implements Serializable {

    @Column
    @PrimaryKey
    private long itemVariantId;

    @Column
    private long variantId;

    @Column
    private BigDecimal price;

    @Column
    private String imageUrl;

    @Column
    private String approxPreperationTime;

    @Column
    private long itemId;

    private Item item;

    public ItemVariant() {
    }

    public ItemVariant(long itemVariantId, long variantId, BigDecimal price, String imageUrl,
                       String approxPreperationTime, Item item,
                       Map<String, Translation> translations) {
        this.itemVariantId = itemVariantId;
        this.variantId = variantId;
        this.price = price;
        this.imageUrl = imageUrl;
        this.approxPreperationTime = approxPreperationTime;
        this.item = item;
        this.setTranslations(translations);
    }

    public long getItemVariantId() {
        return itemVariantId;
    }

    public void setItemVariantId(long itemVariantId) {
        this.itemVariantId = itemVariantId;
    }

    public long getVariantId() {
        return variantId;
    }

    public void setVariantId(long variantId) {
        this.variantId = variantId;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getApproxPreperationTime() {
        return approxPreperationTime;
    }

    public void setApproxPreperationTime(String approxPreperationTime) {
        this.approxPreperationTime = approxPreperationTime;
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

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Override
    public String toString() {
        return getTitle(ApplicationController.getInstance().getUserLanguage())
                + " ("+ price + " "
                + ApplicationController.getInstance().getCurrencyCode()
                + " )";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ItemVariant that = (ItemVariant) o;

        return itemVariantId == that.itemVariantId;

    }

    @Override
    public int hashCode() {
        return (int) (itemVariantId ^ (itemVariantId >>> 32));
    }
}
