package icarte.armedialab.com.icarte.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Map;

import ru.noties.storm.anno.Column;
import ru.noties.storm.anno.PrimaryKey;
import ru.noties.storm.anno.Table;

@Table("item_addon")
public class ItemAddon extends BaseDomain implements Serializable {
    @Column
    @PrimaryKey
    private long itemAddonId;

    @Column
    private long addonId;

    @Column
    private BigDecimal price;

    @Column
    private String imageUrl;

    @Column
    private long itemId;

    private Item item;

    public ItemAddon() {
    }

    public ItemAddon(long itemAddonId, long addonId, BigDecimal price, String imageUrl, Item item,
            Map<String, Translation> translations) {
        this.itemAddonId = itemAddonId;
        this.addonId = addonId;
        this.price = price;
        this.imageUrl = imageUrl;
        this.item = item;
        this.setTranslations(translations);
    }

    public long getItemAddonId() {
        return itemAddonId;
    }

    public void setItemAddonId(long itemAddonId) {
        this.itemAddonId = itemAddonId;
    }

    public long getAddonId() {
        return addonId;
    }

    public void setAddonId(long addonId) {
        this.addonId = addonId;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        return itemAddonId == ((ItemAddon)o).itemAddonId;
    }

    @Override
    public int hashCode() {
        return (int) (itemAddonId ^ (itemAddonId >>> 32));
    }

    public OrderItemAddonJsonWrapper getOrderItemAddonJsonWrapper (){
        OrderItemAddonJsonWrapper orderItemAddonJsonWrapper = new OrderItemAddonJsonWrapper();
        orderItemAddonJsonWrapper.addonId = this.addonId;
        orderItemAddonJsonWrapper.itemAddonId = this.itemAddonId;
        return orderItemAddonJsonWrapper;
    }

    public class OrderItemAddonJsonWrapper {
        public long itemAddonId;
        public long addonId;
    }
}
