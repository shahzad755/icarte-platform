package icarte.armedialab.com.icarte.datamodel;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import icarte.armedialab.com.icarte.domain.Item;
import icarte.armedialab.com.icarte.domain.ItemAddon;
import icarte.armedialab.com.icarte.domain.ItemVariant;

/**
 * Created by Maqsood on 7/22/2017.
 */
public class OrderItem {

    private Item origItem;
    private Item item;
    private ItemVariant itemVariant;
    private List<ItemAddon> itemAddons;
    private int quantity;
    private String specialRemarks;

    public OrderItem(Item origItem, int quantity, String specialRemarks,
                     ItemVariant variant,
                     List<ItemAddon> addons) {
        this.quantity = quantity;
        this.specialRemarks = specialRemarks;
        this.itemVariant = variant;
        this.itemAddons = addons;
        this.origItem = origItem;
        this.item = copyItem(origItem);
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSpecialRemarks() {
        return specialRemarks;
    }

    public ItemVariant getItemVariant() {
        return itemVariant;
    }

    public List<ItemAddon> getItemAddons() {
        return itemAddons;
    }

    private Item copyItem (final Item item){
        Item newItem = new Item();
        newItem.setItemId(item.getItemId());
        newItem.setPrimaryVariantId(item.getPrimaryVariantId());
        newItem.setCategoryId(item.getCategoryId());
        newItem.setImageUrl(item.getImageUrl());
        newItem.setLargeIconUrl(item.getLargeIconUrl());
        newItem.setSmallIconUrl(item.getSmallIconUrl());

        if(itemVariant!=null) {
            newItem.setPrice(itemVariant.getPrice());
        } else {
            newItem.setPrice(item.getPrice());
        }
        newItem.setTranslations(item.getTranslations());
        return newItem;
    }

    public BigDecimal getPrice() {
        BigDecimal basePrice = item.getPrice();
/*
        if(itemVariant!=null) {
            basePrice = itemVariant.getPrice();
        }
*/
        BigDecimal calculatedPrice = basePrice.multiply(BigDecimal.valueOf(getQuantity()));
        if(itemAddons!=null && itemAddons.size()>0) {
            for (ItemAddon addon:itemAddons) {
                calculatedPrice = calculatedPrice.add(addon.getPrice());
            }
        }
        return calculatedPrice;
    }

    public Item getOrigItem() {
        return origItem;
    }

    public void clean() {
        this.origItem = null;
        this.itemAddons = null;
        this.item = null;
        this.itemVariant = null;
        this.specialRemarks = null;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrderItem orderItem = (OrderItem) o;

        return item.equals(orderItem.item);

    }

    @Override
    public int hashCode() {
        return item.hashCode();
    }

    public OrderItemJsonWrapper getOrderItemJsonWrapper() {
        OrderItemJsonWrapper jsonWrapper = new OrderItemJsonWrapper();
        if(item!=null) {
            jsonWrapper.itemId = item.getItemId();
            jsonWrapper.itemVariantId = itemVariant != null ? itemVariant.getItemVariantId() : item.getPrimaryVariantId();
            jsonWrapper.variantId = itemVariant != null ? itemVariant.getVariantId() : 0;
            jsonWrapper.quantity = quantity;
            jsonWrapper.specialRemarks = specialRemarks;
            jsonWrapper.itemAddons = new ArrayList<>();
            if (itemAddons != null) {
                for (ItemAddon addon : itemAddons) {
                    jsonWrapper.itemAddons.add(addon.getOrderItemAddonJsonWrapper());
                }
            }
        }
        return jsonWrapper;
    }

    public class OrderItemJsonWrapper {
        public long itemId;
        public int quantity;
        public long itemVariantId;
        public long variantId;
        public String specialRemarks;
        public List<ItemAddon.OrderItemAddonJsonWrapper> itemAddons;

    }
}
