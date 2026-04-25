package icarte.armedialab.com.icarte.datasource;

import android.util.Log;

import java.util.ArrayList;
import java.util.List;

import icarte.armedialab.com.icarte.BaseException;
import icarte.armedialab.com.icarte.domain.AccountType;
import icarte.armedialab.com.icarte.domain.AppConfigurationData;
import icarte.armedialab.com.icarte.domain.ItemCategory;
import icarte.armedialab.com.icarte.domain.Language;
import icarte.armedialab.com.icarte.domain.Menu;
import icarte.armedialab.com.icarte.domain.Restaurant;
import icarte.armedialab.com.icarte.domain.Translation;
import icarte.armedialab.com.icarte.util.Utils;
import ru.noties.storm.DatabaseManager;
import ru.noties.storm.Pragma;
import ru.noties.storm.Storm;
import ru.noties.storm.exc.StormException;

/**
 * Created by Maqsood on 4/23/2017.
 */
public class CarteDatabaseManager {
    private static final String TAG = CarteDatabaseManager.class.getName();
    private final static CarteDatabaseManager INSTANCE = new CarteDatabaseManager();

    private DatabaseManager databaseManager;
    private Datasource<Restaurant> restaurantDatasource;

    private CarteDatabaseManager() {
    }
    public static CarteDatabaseManager getCarteDatabaseManager() {
        return INSTANCE;
    }

    public Restaurant loadRestaurant() {
        Restaurant restaurant = null;
        List<Restaurant> restaurants = restaurantDatasource.list();
        if(restaurants!=null && restaurants.size()>0) {
            //we know it is always going to be one records here
            restaurant = restaurants.get(0);
        }
        return restaurant;
    }

    public void saveRestaurant(Restaurant restaurant) {
        if(restaurant!=null) {
            restaurantDatasource.createOrUpdate(restaurant);
            Log.d(TAG, "Restaurant data created/updated for restaurant: "+ restaurant.getRestaurantCode());
        } else {
            throw new BaseException("Save empty data not allowed...", Utils.ErrorCode.GeneralError);
        }
    }

    public void createRegistration(final Restaurant restaurant) {
        restaurantDatasource.createOrUpdate(restaurant);
    }

    public synchronized void init() {
        final Pragma pragma = new Pragma.Builder()
                .setForeignKeys(Pragma.ForeignKeys.ON)
                .build();

        databaseManager = new DatabaseManager(
                Storm.getApplicationContext(),
                "icarte.db",
                1,
                new Class[]{
                        Restaurant.class,
                        AppConfigurationData.class,
                        AccountType.class,
                        Language.class,
                        ItemCategory.class,
                        Menu.class,
                        Translation.class
                },
                pragma
        );

        databaseManager.open();
    }

    public synchronized void close() {
        if(databaseManager!=null && databaseManager.isOpen())
            databaseManager.close();
        databaseManager = null;
    }

    public void setRestaurantDatasource(Datasource<Restaurant> restaurantDatasource) {
        this.restaurantDatasource = restaurantDatasource;
    }

    public DatabaseManager getDatabaseManager() {
        return databaseManager;
    }
}
