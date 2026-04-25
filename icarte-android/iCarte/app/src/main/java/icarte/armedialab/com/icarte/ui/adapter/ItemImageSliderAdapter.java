package icarte.armedialab.com.icarte.ui.adapter;

import android.app.Activity;
import android.content.Context;
import android.net.Uri;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.RelativeLayout;

import com.ctrlplusz.anytextview.AnyTextView;
import com.facebook.drawee.view.SimpleDraweeView;

import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.domain.ItemMediaContent;
import icarte.armedialab.com.icarte.service.ServerProxy;
import icarte.armedialab.com.icarte.util.Utils;

public class ItemImageSliderAdapter extends PagerAdapter {

	private Activity _activity;
	private Object []imagePaths;
	private LayoutInflater inflater;

	// constructor
	public ItemImageSliderAdapter(Activity activity,
                                  Object []imagePaths) {
		this._activity = activity;
		this.imagePaths = imagePaths;
	}

	@Override
	public int getCount() {
		return this.imagePaths.length;
	}

	@Override
    public boolean isViewFromObject(View view, Object object) {
        return view == ((RelativeLayout) object);
    }
	
	@Override
    public Object instantiateItem(ViewGroup container, int position) {
        SimpleDraweeView imgDisplay;
        ImageButton btnClose;
        AnyTextView txtItemImageSliderTitle;
 
        inflater = (LayoutInflater) _activity
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View viewLayout = inflater.inflate(R.layout.layout_item_image_slider_fragment, container,
                false);
 
        imgDisplay = (SimpleDraweeView) viewLayout.findViewById(R.id.slidingImageView);
        btnClose = (ImageButton) viewLayout.findViewById(R.id.btnClose);
        txtItemImageSliderTitle = (AnyTextView) viewLayout.findViewById(R.id.txtItemImageSliderTitle);
        if(imagePaths[position] instanceof ItemMediaContent) {
            ItemMediaContent mediaContent = ((ItemMediaContent)imagePaths[position]);
            String title = mediaContent.getItem().getTitle(ApplicationController.getInstance().getUserLanguage());
            if(title!=null && title.length()>0) {
                txtItemImageSliderTitle.setText(title);
                txtItemImageSliderTitle.setVisibility(View.VISIBLE);
            }
        }

        Uri uri = Uri.parse(Utils.getImagePath()
                + imagePaths[position].toString());
        imgDisplay.setImageURI(uri);
        // close button click event
        btnClose.setOnClickListener(new View.OnClickListener() {			
			@Override
			public void onClick(View v) {
				_activity.finish();
			}
		}); 

        ((ViewPager) container).addView(viewLayout);
 
        return viewLayout;
	}
	
	@Override
    public void destroyItem(ViewGroup container, int position, Object object) {
        ((ViewPager) container).removeView((RelativeLayout) object);
 
    }

}
