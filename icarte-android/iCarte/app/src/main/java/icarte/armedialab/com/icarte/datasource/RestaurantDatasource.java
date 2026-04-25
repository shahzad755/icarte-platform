package icarte.armedialab.com.icarte.datasource;

import android.util.Log;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import icarte.armedialab.com.icarte.BaseException;
import icarte.armedialab.com.icarte.domain.AccountType;
import icarte.armedialab.com.icarte.domain.ItemCategory;
import icarte.armedialab.com.icarte.domain.Menu;
import icarte.armedialab.com.icarte.domain.Restaurant;
import icarte.armedialab.com.icarte.domain.Translation;
import icarte.armedialab.com.icarte.util.Utils;
import ru.noties.storm.DatabaseManager;
import ru.noties.storm.Storm;
import ru.noties.storm.exc.StormException;
import ru.noties.storm.query.Selection;

/**
 * Created by Maqsood on 5/22/2017.
 */
public class RestaurantDatasource implements Datasource<Restaurant> {

    private static final String TAG = RestaurantDatasource.class.getName();
    private DatabaseManager dbMgr;
    private Datasource<Translation> translationDatasource;

    public RestaurantDatasource(DatabaseManager dbMgr) {
        this.dbMgr = dbMgr;
    }

    @Override
    public void createOrUpdate(final Restaurant restaurant) {
        Restaurant persistedInstance;
        if (restaurant != null) {
            try {
                Log.d(TAG, "Deleting all records");
                dbMgr.beginTransaction();
                deleteAll();
                Log.d(TAG, "Creating New Restaurant Record with code:" + restaurant.getRestaurantCode());
                long id = Storm.newInsert(dbMgr).insert(restaurant);
                restaurant.setId(id);

/*
                //TODO: this is not needed as i am removing all the data anyway
                persistedInstance = Storm.newSelect(dbMgr).query(Restaurant.class,
                        Selection.eq("restaurantCode",
                                restaurant.getRestaurantCode()));

                dbMgr.beginTransaction();
                delete(restaurant);

                if (persistedInstance == null) { //create
                    Log.d(TAG, "Creating New Restaurant Record with code:" + restaurant.getRestaurantCode());
                    long id = Storm.newInsert(dbMgr).insert(restaurant);
                    restaurant.setId(id);

                } else { //update
                    Log.d(TAG, "Updating existing Restaurant Record with code:" + persistedInstance.getRestaurantCode());
                    restaurant.setId(persistedInstance.getId());
                    Storm.newUpdate(dbMgr).update(restaurant);
                }
                if (restaurant.getId() > 0 && restaurant.getAccountType() != null) {
                    replaceAccountType(restaurant.getAccountType());
                }
                //save menu
                saveMenu(restaurant);
*/
                dbMgr.setTransactionSuccessful();
            } catch (StormException e) {
                Log.e(TAG, e.getMessage(), e);
                throw new BaseException(e.getMessage(), Utils.ErrorCode.DatabaseFailure, e);
            } finally {
                dbMgr.endTransaction();
            }
        }
    }

    @Override
    public void delete(Restaurant restaurant) {
        if(restaurant!=null) {
            try {
                resetRestaurantData(restaurant);
            } catch (StormException e) {
                Log.e(TAG, e.getMessage(), e);
                throw new BaseException(e.getMessage(), Utils.ErrorCode.DatabaseFailure, e);
            }
        }
    }

    @Override
    public Restaurant delete(long id) {
        Restaurant restaurant = new Restaurant();
        restaurant.setId(id);
        restaurant = find(restaurant);
        delete(restaurant);
        return restaurant;
    }

    @Override
    public long deleteAll() {
        try {
            return Storm.newDelete(dbMgr).deleteAll(Restaurant.class);
        } catch (StormException e) {
            Log.e(TAG, e.getMessage(), e);
            throw new BaseException(e.getMessage(), Utils.ErrorCode.DatabaseFailure, e);
        }
    }

    @Override
    public List<Restaurant> list() {
        return Storm.newSelect(dbMgr).queryAll(Restaurant.class);
    }

    @Override
    public List<Restaurant> findAllBy(Map<String, String> keys) {
        return list();
    }

    @Override
    public Restaurant find(Restaurant restaurant) {
        return Storm.newSelect(dbMgr).query(Restaurant.class,
                Selection.eq("restaurantCode",
                        restaurant.getRestaurantCode()));
    }

    protected void resetRestaurantData(Restaurant restaurant) throws StormException {
        try {
            //dbMgr.beginTransaction();
            //delete data from all child entities
            deleteMenuData(restaurant);
            //dbMgr.setTransactionSuccessful();
        }finally {
            //dbMgr.endTransaction();
        }
    }

    protected void deleteMenuData(Restaurant restaurant) throws StormException {
        if(restaurant!=null) {
            for (int i = 0; i < restaurant.getMenus().size(); i++) {
                resetItemCategoryData(restaurant.getMenus().get(i));
            }
        } else {
            resetItemCategoryData(null);
        }
        Storm.newDelete(dbMgr).deleteAll(Menu.class);
    }

    protected void resetItemCategoryData(Menu menu) throws StormException {
        //delete data from all child entities
        removeTranslations("ItemCategory");
        Storm.newDelete(dbMgr).delete(ItemCategory.class, Selection.eq("menuId", menu.getId()));
    }

    protected void removeTranslations(String clazzName) throws StormException {
        Storm.newDelete(dbMgr).delete(Translation.class, Selection.eq("classType", clazzName));
    }

    private void replaceAccountType(AccountType accountType) {
        //replace accountType
        try {
            Storm.newDelete(dbMgr).deleteAll(AccountType.class);
            Storm.newInsert(dbMgr).insert(accountType);
        } catch (StormException e) {
            e.printStackTrace();
            throw new RuntimeException("", e);
        }
    }

    private void saveMenu(Restaurant restaurant) throws StormException {
        List<Menu> menus = restaurant.getMenus();
        Menu menu;
        for (int i = 0; i < menus.size(); i++) {
            menu = menus.get(i);
            menu.setId(
                    Storm.newInsert(dbMgr).insert(menu)
            );
            saveItemCategory(menu);
        }
    }

    private void saveItemCategory(Menu menu) throws StormException {
        List<ItemCategory> categories = menu.getCategories();
        ItemCategory category;
        for (int i = 0; i < categories.size(); i++) {
            category = categories.get(i);
            category.setMenuId(menu.getId());
            category.setId(
                    Storm.newInsert(dbMgr).insert(category)
            );
            //saveTranslations(categories.get(i).getTranslations());
        }
    }

    private void saveTranslations(Map<String, Translation> translations){
        Translation translation = null;
        //traverse over the collection, if you find any result update it otherwise insert it, an easy
        // eay is to delete all and then insert
        String langKey = null;
        Iterator<String> iterator = null;
        Map<String, String> translationMap = null;
        if(translations!=null && translations.size()>0) {
            iterator = translations.keySet().iterator();
            while(iterator.hasNext()) {
                langKey = iterator.next();
                //now get the values for Translation Object0

            }
        }
        translationDatasource.createOrUpdate(translation);
    }

    @Override
    public void setTranslationDatasource(Datasource translationDatasource) {
        this.translationDatasource = translationDatasource;
    }
}
