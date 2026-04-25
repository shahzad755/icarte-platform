package icarte.armedialab.com.icarte.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ru.noties.storm.ForeignKeyAction;
import ru.noties.storm.anno.Column;
import ru.noties.storm.anno.ForeignKey;
import ru.noties.storm.anno.PrimaryKey;
import ru.noties.storm.anno.Table;
import ru.noties.storm.anno.Unique;

/**
 * Created by Maqsood on 5/15/2017.
 */
@Table("item_category")
public class ItemCategory extends BaseDomain implements java.io.Serializable {

    @Column
    @PrimaryKey
    private long id;

    @Column
    @Unique
    private long itemCategoryId; // this is the id of the server

    @Column
    private String imageUrl;

    @Column
    private String smallIconUrl;

    @Column
    private String largeIconUrl;

    @Column
    private long parentCategory;

    @Column
    private String tags;

    @Column
    private Date availableDurationStart;

    @Column
    private Date availableDurationEnd;

    @Column
    private boolean isActive;

    private List<Item> items;

    @Column("menuId")
    @ForeignKey(
            parentTable = Menu.class,
            parentColumnName = "id",
            onDelete = ForeignKeyAction.CASCADE,
            onUpdate = ForeignKeyAction.NO_ACTION
    )
    private long menuId;

    private Menu menu;

    public ItemCategory() {
    }

    public ItemCategory(String imageUrl, String smallIconUrl,
                        String largeIconUrl, long parentCategory, long menuId) {
        this.imageUrl = imageUrl;
        this.smallIconUrl = smallIconUrl;
        this.largeIconUrl = largeIconUrl;
        this.parentCategory = parentCategory;
    }

    public ItemCategory(long id, String imageUrl, String smallIconUrl,
                        String largeIconUrl, long parentCategory, String tags, long menuId,
                        Date availableDurationStart, Date availableDurationEnd) {
        this.id = id;
        this.imageUrl = imageUrl;
        this.smallIconUrl = smallIconUrl;
        this.largeIconUrl = largeIconUrl;
        this.parentCategory = parentCategory;
        this.tags = tags;
        this.availableDurationStart = availableDurationStart;
        this.availableDurationEnd = availableDurationEnd;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getItemCategoryId() {
        return itemCategoryId;
    }

    public void setItemCategoryId(long itemCategoryId) {
        this.itemCategoryId = itemCategoryId;
    }

    public String getImageUrl() {
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

    public long getParentCategory() {
        return parentCategory;
    }

    public void setParentCategory(long parentCategory) {
        this.parentCategory = parentCategory;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public Date getAvailableDurationStart() {
        return availableDurationStart;
    }

    public void setAvailableDurationStart(Date availableDurationStart) {
        this.availableDurationStart = availableDurationStart;
    }

    public Date getAvailableDurationEnd() {
        return availableDurationEnd;
    }

    public void setAvailableDurationEnd(Date availableDurationEnd) {
        this.availableDurationEnd = availableDurationEnd;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public long getMenuId() {
        return menuId;
    }

    public void setMenuId(long menuId) {
        this.menuId = menuId;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ItemCategory that = (ItemCategory) o;

        if (id != that.id) return false;
        return itemCategoryId == that.itemCategoryId;

    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (int) (itemCategoryId ^ (itemCategoryId >>> 32));
        return result;
    }

}
