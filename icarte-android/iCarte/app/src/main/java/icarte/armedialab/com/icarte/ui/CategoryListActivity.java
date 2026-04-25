package icarte.armedialab.com.icarte.ui;

import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.GridLayoutManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.StaggeredGridLayoutManager;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;

import com.mikepenz.actionitembadge.library.ActionItemBadge;
import com.yalantis.contextmenu.lib.ContextMenuDialogFragment;
import com.yalantis.contextmenu.lib.interfaces.OnMenuItemClickListener;

import butterknife.Bind;
import butterknife.ButterKnife;
import butterknife.OnClick;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.CategoryDataModel;
import icarte.armedialab.com.icarte.datamodel.Order;
import icarte.armedialab.com.icarte.ui.adapter.CategoryListViewAdapter;
import icarte.armedialab.com.icarte.util.Utils;

public class CategoryListActivity extends ToolBarSupportActivity {

    private static final String TAG = CategoryListActivity.class.getName();

    // private LanguageToolbarSupport languageSupportBar;

    private boolean isStaggered = Boolean.FALSE;

    @Bind(R.id.categoryList) RecyclerView recyclerView;
    @Bind(R.id.btnCallWaiter) FloatingActionButton callWaiter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_categories);
        ButterKnife.bind(this);
        setSupportActionBar(toolbar);
        getSupportActionBar().setDisplayShowTitleEnabled(false);
        toolBarTitle.setText(R.string.title_activity_category_list2);

        callWaiter.setOnClickListener(new CallWaiterOnClickHandler(this));
        recyclerView.setLayoutManager(createLayoutManager(R.layout.grid_item, isStaggered));
        recyclerView.setHasFixedSize(true);

        recyclerView.setAdapter(new CategoryListViewAdapter(
                new CategoryDataModel(ApplicationController.getInstance().getCarteService().getCategoryList(null)),
                R.layout.grid_item, isStaggered));

/*
        Task.callInBackground(new Callable<DataModel<ItemCategory>>() {
            public DataModel<ItemCategory> call() {
                Log.d(TAG, "1- Creating Data Model...");
                try {
                    Thread.sleep(5000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                Log.d(TAG, "2- Data Model Created...");
                return new CategoryDataModel(ApplicationController.getInstance().getCarteService().getCategoryList(null));
            }
        }).continueWith(new Continuation<DataModel<ItemCategory>, Void>() {
            @Override
            public Void then(Task<DataModel<ItemCategory>> task) throws Exception {
                Log.d(TAG, "3- Use the new Data Model...");
                return null;
            }
        });
*/

    }

    private LayoutManager createLayoutManager(int itemLayoutRes, boolean isStaggered) {
        if (itemLayoutRes == R.layout.category_item) {
            return new LinearLayoutManager(this, LinearLayoutManager.HORIZONTAL, false);
        } else {
            if (isStaggered) {
                return new StaggeredGridLayoutManager(2, StaggeredGridLayoutManager.VERTICAL);
            } else {
                GridLayoutManager gridLayoutManager = new GridLayoutManager(this, 2);
/*
                gridLayoutManager.setSpanSizeLookup(new GridLayoutManager.SpanSizeLookup() {
                    @Override
                    public int getSpanSize(int position) {
                        return (3 - position % 3);
                    }
                });
*/
                return gridLayoutManager;
            }
        }
    }

    @Override
    public int getMenuLayout() {
        return R.menu.menu_categories;
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
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
    }
}
