package icarte.armedialab.com.icarte.service;

import java.util.List;

import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.datasource.CarteDatabaseManager;
import icarte.armedialab.com.icarte.domain.ItemCategory;
import icarte.armedialab.com.icarte.domain.Menu;
import icarte.armedialab.com.icarte.domain.Restaurant;

/**
 * Created by Maqsood on 5/24/2017.
 */
public class CarteService {

    private CarteDatabaseManager databaseManager;

    public Restaurant loadRestaurant() {
        return databaseManager.loadRestaurant();
    }

    public void saveRestaurant(Restaurant restaurant) {
        databaseManager.saveRestaurant(restaurant);
    }

    public void createRegistration(Restaurant restaurant) {
        databaseManager.createRegistration(restaurant);
    }

    public void setDatabaseManager(CarteDatabaseManager databaseManager) {
        this.databaseManager = databaseManager;
    }

    public List<ItemCategory> getCategoryList(Menu menu) {
        List<Menu> menus = ApplicationController.getInstance().getRestaurantInfo().getMenus();
        List<ItemCategory> categories = null;
        Menu temp;
        if(menu==null) {
            categories = menus.get(0).getCategories();
        } else {
            for (int i = 0; i < menus.size(); i++) {
                temp = menus.get(i);
                if (temp.getId() == menu.getId()) {
                    categories = menu.getCategories();
                    break;
                }
            }
        }
        return categories;
    }
}
