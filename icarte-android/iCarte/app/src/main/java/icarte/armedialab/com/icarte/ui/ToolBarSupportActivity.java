package icarte.armedialab.com.icarte.ui;

import android.content.Intent;
import android.support.v4.app.NavUtils;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;

import com.mikepenz.actionitembadge.library.ActionItemBadge;
import com.yalantis.contextmenu.lib.ContextMenuDialogFragment;
import com.yalantis.contextmenu.lib.interfaces.OnMenuItemClickListener;

import butterknife.Bind;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.Order;
import icarte.armedialab.com.icarte.util.Utils;

/**
 * Created by Maqsood on 9/18/2017.
 */
public abstract class ToolBarSupportActivity extends AppCompatActivity implements OnMenuItemClickListener {

    private final LanguageToolbarSupport languageToolbarSupport = LanguageToolbarSupport.getInstance();

    @Bind(R.id.toolbar)
    Toolbar toolbar;

    @Bind(R.id.text_view_toolbar_title)
    TextView toolBarTitle;

    TextView txtCartItemCounter;

    boolean isMenuItemCreated = false;

    MenuItem cartViewMenuItem = null;

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(getMenuLayout(), menu);

        cartViewMenuItem = menu.findItem(R.id.order);
        View view =  cartViewMenuItem.getActionView();
        txtCartItemCounter = (TextView) view.findViewById(R.id.menu_badge);

        int badgeCount = ApplicationController.getInstance().getOrder().getOrderCount();
        if (badgeCount > 0) {
            updateCartBadgeCount(badgeCount);
            isMenuItemCreated = true;
        } else {
            ActionItemBadge.hide(cartViewMenuItem);
        }

        String code = ApplicationController.getInstance().getUserLanguage().getCode();
        int drawableIcon = R.drawable.en;

        if(Utils.LanguageCodes.ARABIC.getLanguageCode().equalsIgnoreCase(code)) {
            drawableIcon = R.drawable.ae;
        }
        menu.findItem(R.id.language).setIcon(drawableIcon);

        return true;
    }

    private void updateCartBadgeCount(int badgeCount) {
        ActionItemBadge.update(this, cartViewMenuItem,
                getResources().getDrawable(R.drawable.ico_cartx48),
                Utils.getBadgeStyle(),
                badgeCount);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.home:
                NavUtils.navigateUpFromSameTask(this);
            case R.id.order:
                startActivity(new Intent(this, CartViewActivity.class));
                break;
            case R.id.language:
                if (getSupportFragmentManager().findFragmentByTag(ContextMenuDialogFragment.TAG) == null) {
                    languageToolbarSupport.showDialog(getSupportFragmentManager());
                }
                break;
            case R.id.navigate_home:
                startActivity(new Intent(this, HomeActivity.class));
                finish();
                break;
            case R.id.callWaiter:
                new CallWaiterOnClickHandler(this).onClick(this.findViewById(R.id.callWaiter));
                break;
        }
        return super.onOptionsItemSelected(item);
    }

    public void setCartItemCounter(int counter) {
        if(counter>0 && cartViewMenuItem!=null && !isMenuItemCreated) {
            updateCartBadgeCount(counter);
        }
        txtCartItemCounter.setText(String.valueOf(counter));
    }


    @Override
    public void onBackPressed() {
        if(!languageToolbarSupport.dismiss()) {
            startActivity(new Intent(getApplicationContext(), HomeActivity.class));
            finish();
        }
    }

    @Override
    public void onMenuItemClick(View view, int i) {
        languageToolbarSupport.changeLanguage(view, i, this);
    }

    public abstract int getMenuLayout();
    //public abstract String getToolbarTitleText();
}
