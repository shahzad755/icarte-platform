package icarte.armedialab.com.icarte.ui;

import android.app.Fragment;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.support.v4.app.NavUtils;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;

import com.mikepenz.actionitembadge.library.ActionItemBadge;

import butterknife.ButterKnife;
import butterknife.Bind;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.Order;
import icarte.armedialab.com.icarte.ui.adapter.listeners.OnCategoryClickListener;
import icarte.armedialab.com.icarte.domain.ItemCategory;
import icarte.armedialab.com.icarte.util.Utils;

public class ItemsListActivity extends ToolBarSupportActivity implements OnCategoryClickListener {

    private static final String TAG = ItemsListActivity.class.getName();
    private ItemCategory category;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_items);
        ButterKnife.bind(this);

        Intent intent = getIntent();
        Bundle extras = intent.getExtras();
        if(extras!=null)
            category = (ItemCategory) extras.get(Utils.KEY_SELECTED_CATEGORY);

        if(category!=null) {
            setActionBarTitle();
        } else {
            throw new java.lang.IllegalStateException("No category is associated with this activity...");
        }

        setSupportActionBar(toolbar);
        getSupportActionBar().setHomeButtonEnabled(true);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowTitleEnabled(false);
        //getSupportActionBar().setIcon();
        updateItemsFragmentData();
        selectCategory();
    }

    private void selectCategory() {
        Fragment fragment = getFragmentManager().findFragmentById(R.id.categoriesFragment);
        if(fragment!=null) {
            if (fragment instanceof AttachedToCategory) {
                ((AttachedToCategory) fragment).setCategory(category);
            }
        }
    }

    @Override
    public void onCategorySelected(View view, ItemCategory category) {
        this.category = category;
        setActionBarTitle();
        updateItemsFragmentData();
    }

    private ItemsFragement getItemsFragement() {
        return (ItemsFragement)
                    getSupportFragmentManager().findFragmentById(R.id.itemsFragment);
    }

    private void updateItemsFragmentData() {
        ItemsFragement itemsFragement = getItemsFragement();
        if(itemsFragement!=null) {
            itemsFragement.loadItems(this.category);
        }
    }

    private void setActionBarTitle() {
        toolBarTitle.setText(category.getTitle(ApplicationController.getInstance().getUserLanguage()));
        //setTitle(category.getTitle(ApplicationController.getInstance().getUserLanguage()));
    }


    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);

/*        if (getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE) {
            Utils.showToast(getApplicationContext(), "Configuration changed: Landscape");

        } else {
            Utils.showToast(getApplicationContext(), "Configuration changed: Portrait");
        }*/
    }

    @Override
    public int getMenuLayout() {
        return R.menu.menu_categories;
    }

}
