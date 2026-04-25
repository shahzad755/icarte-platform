package icarte.armedialab.com.icarte.util;

import java.util.List;

import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.domain.Item;
import icarte.armedialab.com.icarte.domain.ItemCategory;
/*import info.evelio.carbonite.Carbonite;
import info.evelio.carbonite.cache.CacheType;*/

/**
 * Created by Maqsood on 6/24/2017.
 */
public class CacheManager {
/*
    Carbonite carbonite = null;

    private static CacheManager INSTANCE = null;

    private CacheManager (){
        carbonite = Carbonite.using(ApplicationController.getInstance().getApplicationContext()) */
/* getApplicationContext() is used and not retained *//*

                .retaining(List.class)
                .in(CacheType.MEMORY) */
/* optional, default *//*

                //.and(CacheType.STORAGE) */
/* optional if you don't want to keep in memory *//*

                .build();
    }

    public static CacheManager getInstance() {
        if(INSTANCE==null) {
            INSTANCE = new CacheManager();
        }
        return INSTANCE;
    }


    public void putItemsForCategory(ItemCategory category, List<Item> items) {
        carbonite.set(String.valueOf(category.getId()), items);
    }

    public List<Item> getItemsForCategory(long categoryId) {

        return carbonite.memory(String.valueOf(categoryId), List.class);
    }
*/
}
