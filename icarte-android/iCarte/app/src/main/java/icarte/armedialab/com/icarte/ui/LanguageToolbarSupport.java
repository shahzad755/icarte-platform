package icarte.armedialab.com.icarte.ui;

import android.app.Activity;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentManager;
import android.view.View;
import android.widget.ImageView;

import com.yalantis.contextmenu.lib.ContextMenuDialogFragment;
import com.yalantis.contextmenu.lib.MenuObject;
import com.yalantis.contextmenu.lib.MenuParams;

import java.util.ArrayList;
import java.util.List;

import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.domain.Language;
import icarte.armedialab.com.icarte.ui.component.LanguageMenuObject;
import icarte.armedialab.com.icarte.util.Utils;

/**
 * Created by Maqsood on 9/15/2017.
 */
public class LanguageToolbarSupport {

    DialogFragment mMenuDialogFragment;
    private List<MenuObject> menuObjects = new ArrayList<>();
    private static LanguageToolbarSupport mInstance;
    private boolean isInitialized = false;

    private LanguageToolbarSupport() {
    }

    public static LanguageToolbarSupport getInstance() {
        if(mInstance == null)
        {
            mInstance = new LanguageToolbarSupport();
        }
        return mInstance;
    }

    public void setupUI() {
        initMenuObjects();
        initMenuFragment();
    }

    private void initMenuFragment() {
        MenuParams menuParams = new MenuParams();
        menuParams.setActionBarSize((int) ApplicationController.getInstance().getResources().getDimension(R.dimen.tool_bar_height));
        menuParams.setMenuObjects(menuObjects);
        menuParams.setClosableOutside(true);

        mMenuDialogFragment = ContextMenuDialogFragment.newInstance(menuParams);
    }

    private void initMenuObjects() {
        if(!isInitialized) {
            MenuObject close = new MenuObject();
            close.setResource(R.drawable.close);

            MenuObject ae = new LanguageMenuObject(Utils.ARABIC);
            ae.setResource(R.drawable.ae);
            ae.setScaleType(ImageView.ScaleType.FIT_XY);

            MenuObject en = new LanguageMenuObject(Utils.ENGLISH);
            en.setResource(R.drawable.en);

    /*
            MenuObject like = new MenuObject("Like profile");
            Bitmap b = BitmapFactory.decodeResource(getResources(), R.drawable.icn_2);
            like.setBitmap(b);

            MenuObject addFr = new MenuObject("Add to friends");
            BitmapDrawable bd = new BitmapDrawable(getResources(),
                    BitmapFactory.decodeResource(getResources(), R.drawable.icn_3));
            addFr.setDrawable(bd);

            MenuObject addFav = new MenuObject("Add to favorites");
            addFav.setResource(R.drawable.icn_4);

            MenuObject block = new MenuObject("Block user");
            block.setResource(R.drawable.icn_5);
    */
            menuObjects.add(close);
            menuObjects.add(ae);
            menuObjects.add(en);
            isInitialized = true;
        }
    }

    public void changeLanguage(View view, int index, Activity activityTobeRecreated) {
        if(index>0) { // 0 is always close action
            Language language = ((LanguageMenuObject) menuObjects.get(index)).language;
            ApplicationController.getInstance().setUserLanguage(language);
            mMenuDialogFragment.setRetainInstance(true);
            activityTobeRecreated.recreate();
        }
    }

    public void showDialog(FragmentManager supportFragmentManager) {
        mMenuDialogFragment.show(supportFragmentManager, ContextMenuDialogFragment.TAG);
    }

    public boolean dismiss() {
        if (mMenuDialogFragment != null && mMenuDialogFragment.isAdded()) {
            mMenuDialogFragment.dismiss();
            return true;
        } else
            return false;
    }
}
