package icarte.armedialab.com.icarte.ui;

import android.graphics.Typeface;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.Spinner;

import butterknife.Bind;
import butterknife.ButterKnife;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.domain.ItemVariant;
import icarte.armedialab.com.icarte.util.Utils;

public class ContactusActivity extends ToolBarSupportActivity  {

    private static final String TAG = ContactusActivity.class.getName();


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_contactus);
        ButterKnife.bind(this);

        setupToolbar();
        //getFragmentManager().findFragmentById(R.id.contact_form_fragment);

    }

    private void setupToolbar() {
        setSupportActionBar(toolbar);
        getSupportActionBar().setHomeButtonEnabled(true);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        getSupportActionBar().setDisplayShowTitleEnabled(false);
        toolBarTitle.setText(R.string.title_activity_contactus);
    }

    @Override
    public int getMenuLayout() {
        return R.menu.menu_categories;
    }
}
