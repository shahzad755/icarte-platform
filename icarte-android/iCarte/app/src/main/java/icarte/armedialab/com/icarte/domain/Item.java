package icarte.armedialab.com.icarte.domain;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import ru.noties.storm.anno.Column;
import ru.noties.storm.anno.PrimaryKey;
import ru.noties.storm.anno.Table;

/**
 * Created by Maqsood on 6/20/2017.
 */
@Table("item")
public class Item extends BaseDomain implements Serializable {

    @Column
    @PrimaryKey
    private long itemId;

    @Column
    private long primaryVariantId;

    @Column
    private BigDecimal price;

    @Column
    private String imageUrl;

    @Column
    private String smallIconUrl;

    @Column
    private String largeIconUrl;

    @Column
    private String tags;

    @Column
    private long categoryId;

    @Column
    private String approxPreperationTime;

    @Column
    private long cuisineTypeId;

    @Column
    private long spiceTypeId;

    private SpiceType spiceType;

    private CusineType cusineType;

    private List<ItemMediaContent>  mediaContents;

    private List<ItemIngredient> itemIngrediants;

    private List<ItemVariant> itemVariants;

    private List<ItemAddon> addons;

    private String currencyCode;

    public Item() {
    }

    public long getItemId() {
        return itemId;
    }

    public void setItemId(long itemId) {
        this.itemId = itemId;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getImageUrl() {
        if(imageUrl==null) {
            //play a trick here
            setMediaContents(this.mediaContents);
        }
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getSmallIconUrl() {
        return smallIconUrl;
    }

    public void setSmallIconUrl(String smallIconUrl) {
        this.smallIconUrl = smallIconUrl;
    }

    public String getLargeIconUrl() {
        return largeIconUrl;
    }

    public void setLargeIconUrl(String largeIconUrl) {
        this.largeIconUrl = largeIconUrl;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public long getCuisineTypeId() {
        if(cuisineTypeId<0) {
            cuisineTypeId = cusineType.getCuisineTypeId();
        }
        return cuisineTypeId;
    }

    public void setCuisineTypeId(long cuisineTypeId) {
        this.cuisineTypeId = cuisineTypeId;
    }

    public long getSpiceTypeId() {
        if(spiceTypeId<0) {
            spiceTypeId = spiceType.getSpiceTypeId();
        }
        return spiceTypeId;
    }

    public void setSpiceTypeId(long spiceTypeId) {
        this.spiceTypeId = spiceTypeId;
    }

    public SpiceType getSpiceType() {
        return spiceType;
    }

    public void setSpiceType(SpiceType spiceType) {
        this.spiceType = spiceType;
        if(spiceType!=null) {
            setSpiceTypeId(spiceType.getSpiceTypeId());
        }
    }

    public CusineType getCusineType() {
        return cusineType;
    }

    public void setCusineType(CusineType cusineType) {
        this.cusineType = cusineType;
        if(cusineType!=null)
            setCuisineTypeId(cusineType.getCuisineTypeId());
    }

    public List<ItemMediaContent> getMediaContents() {
        return mediaContents;
    }

    public void setMediaContents(List<ItemMediaContent> _mediaContents) {
        mediaContents = _mediaContents;
        if(mediaContents!=null && mediaContents.size()>0) {
            int size = mediaContents.size();
                Collections.sort(mediaContents, new Comparator<ItemMediaContent>() {
                    @Override
                    public int compare(ItemMediaContent lhs, ItemMediaContent rhs) {
                        if(lhs.getDisplayOrder() < rhs.getDisplayOrder())
                            return -1;
                        else if(lhs.getDisplayOrder() > rhs.getDisplayOrder())
                            return 1;
                        else
                            return 0;
                    }
                });
                this.imageUrl = mediaContents.get(0).getImageUrl();
                for (int i = 0; i < size; i++) {
                    mediaContents.get(i).setItem(this);
                }
        }
    }

    public void setItemIngrediants(List<ItemIngredient> _itemIngrediants) {
        if(_itemIngrediants!=null) {
            for (ItemIngredient ingredient: _itemIngrediants) {
                ingredient.setItem(this);
            }
            itemIngrediants = _itemIngrediants;
        }
    }

    public void setItemVariants(List<ItemVariant> _itemVariants) {
        if(_itemVariants!=null) {
            for (ItemVariant variant: _itemVariants) {
                variant.setItem(this);
            }
            itemVariants = _itemVariants;
        }
    }
    public void setAddons(List<ItemAddon> _itemAddons) {
        if(_itemAddons!=null) {
            for (ItemAddon addon: _itemAddons) {
                addon.setItem(this);
            }
            addons = _itemAddons;
        }
    }

    public List<ItemIngredient> getItemIngrediants() {
        return itemIngrediants;
    }

    public List<ItemVariant> getItemVariants() {
        return itemVariants;
    }

    public List<ItemAddon> getAddons() {
        return addons;
    }

    public String getCurrencyCode() {
        return currencyCode;
    }

    public void setCurrencyCode(String currencyCode) {
        this.currencyCode = currencyCode;
    }

    public String getApproxPreperationTime() {
        return approxPreperationTime;
    }

    public void setApproxPreperationTime(String approxPreperationTime) {
        this.approxPreperationTime = approxPreperationTime;
    }

    public long getPrimaryVariantId() {
        return primaryVariantId;
    }

    public void setPrimaryVariantId(long primaryVariantId) {
        this.primaryVariantId = primaryVariantId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Item item = (Item) o;

        if (itemId != item.itemId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (itemId ^ (itemId >>> 32));
        result = 31 * result + (int) (categoryId ^ (categoryId >>> 32));
        return result;
    }
}
