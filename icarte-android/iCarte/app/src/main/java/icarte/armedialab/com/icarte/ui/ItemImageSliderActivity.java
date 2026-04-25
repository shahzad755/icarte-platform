package icarte.armedialab.com.icarte.ui;

import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.ui.adapter.ItemImageSliderAdapter;
import icarte.armedialab.com.icarte.util.Utils;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.view.ViewPager;
import android.support.v7.app.AppCompatActivity;
import android.view.View;

public class ItemImageSliderActivity extends AppCompatActivity {

	private ItemImageSliderAdapter adapter;
	private ViewPager viewPager;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_item_image_slider);

		viewPager = (ViewPager) findViewById(R.id.item_image_pager);
        viewPager.setPageTransformer(true, new ZoomOutPageTransformer());
		Intent i = getIntent();
        Object []mediaContents = (Object[])
                i.getExtras().get(Utils.KEY_ITEM_MEDIA_CONTENTS);
		adapter = new ItemImageSliderAdapter(ItemImageSliderActivity.this, mediaContents);

		viewPager.setAdapter(adapter);

		// displaying selected image first
        viewPager.setCurrentItem(0);
	}

    class ZoomOutPageTransformer implements ViewPager.PageTransformer {
        private static final float MIN_SCALE = 0.85f;
        private static final float MIN_ALPHA = 0.95f;

        public void transformPage(View view, float position) {
            int pageWidth = view.getWidth();
            int pageHeight = view.getHeight();

            if (position < -1) { // [-Infinity,-1)
                // This page is way off-screen to the left.
                view.setAlpha(0);

            } else if (position <= 1) { // [-1,1]
                // Modify the default slide transition to shrink the page as well
                float scaleFactor = Math.max(MIN_SCALE, 1 - Math.abs(position));
                float vertMargin = pageHeight * (1 - scaleFactor) / 2;
                float horzMargin = pageWidth * (1 - scaleFactor) / 2;
                if (position < 0) {
                    view.setTranslationX(horzMargin - vertMargin / 2);
                } else {
                    view.setTranslationX(-horzMargin + vertMargin / 2);
                }

                // Scale the page down (between MIN_SCALE and 1)
                view.setScaleX(scaleFactor);
                view.setScaleY(scaleFactor);

                // Fade the page relative to its size.
                view.setAlpha(MIN_ALPHA +
                        (scaleFactor - MIN_SCALE) /
                                (1 - MIN_SCALE) * (1 - MIN_ALPHA));

            } else { // (1,+Infinity]
                // This page is way off-screen to the right.
                view.setAlpha(0);
            }
        }
    }
}
