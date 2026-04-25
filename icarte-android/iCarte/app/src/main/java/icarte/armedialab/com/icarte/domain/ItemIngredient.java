package icarte.armedialab.com.icarte.domain;

import java.io.Serializable;

import ru.noties.storm.anno.Column;
import ru.noties.storm.anno.PrimaryKey;
import ru.noties.storm.anno.Table;

/**
 * Created by Maqsood on 6/20/2017.
 */
@Table("item_ingredient")
public class ItemIngredient extends BaseDomain implements Serializable{

    @Column
    @PrimaryKey
    private long itemIngredientId;

    @Column
    private long ingredientId;

    @Column
    private String imageUrl;

    @Column
    private long itemId;

    private Item item;

    public long getItemIngredientId() {
        return itemIngredientId;
    }

    public void setItemIngredientId(long itemIngredientId) {
        this.itemIngredientId = itemIngredientId;
    }

    public long getIngredientId() {
        return ingredientId;
    }

    public void setIngredientId(long ingredientId) {
        this.ingredientId = ingredientId;
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
}
