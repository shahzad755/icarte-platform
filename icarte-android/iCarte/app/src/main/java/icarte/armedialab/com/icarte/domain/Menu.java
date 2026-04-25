package icarte.armedialab.com.icarte.domain;

import java.util.List;

import ru.noties.storm.ForeignKeyAction;
import ru.noties.storm.anno.Autoincrement;
import ru.noties.storm.anno.Column;
import ru.noties.storm.anno.ForeignKey;
import ru.noties.storm.anno.PrimaryKey;
import ru.noties.storm.anno.Table;

/**
 * Created by Maqsood on 5/14/2017.
 */

@Table("menu")
public class Menu extends BaseDomain implements java.io.Serializable {

    @Column
    @PrimaryKey
    @Autoincrement
    private long id;

    @Column long menuId;// this is the id on server

    public long getMenuId() {
        return menuId;
    }

    public void setMenuId(long menuId) {
        this.menuId = menuId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column
    private String name;

/*
    @Column("restaurant_id")
    @ForeignKey(
            parentTable = Restaurant.class,
            parentColumnName = "id",
            onDelete = ForeignKeyAction.CASCADE,
            onUpdate = ForeignKeyAction.NO_ACTION
    )
    private Restaurant Restaurant;
*/

    private List<ItemCategory> categories;

    public Menu() {
    }

    public Menu(String name, List<ItemCategory> categories) {
        this.name = name;
        this.categories = categories;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<ItemCategory> getCategories() {
        return categories;
    }

    public void setCategories(List<ItemCategory> categories) {
        this.categories = categories;
    }


}
