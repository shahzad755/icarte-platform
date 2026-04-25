package icarte.armedialab.com.icarte.util;

import java.util.List;

import icarte.armedialab.com.icarte.domain.Item;

/**
 * Created by Maqsood on 6/20/2017.
 */
public class ItemWrapper {
    private List<Item> items;
    private long categoryId;

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }
}
