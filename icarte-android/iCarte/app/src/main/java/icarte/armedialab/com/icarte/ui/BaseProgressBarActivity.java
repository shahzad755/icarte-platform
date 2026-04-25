package icarte.armedialab.com.icarte.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;

import butterknife.Bind;
import icarte.armedialab.com.icarte.R;
import me.fichardu.circleprogress.CircleProgress;

/**
 * Created by Maqsood on 5/30/2017.
 */
public abstract class BaseProgressBarActivity extends Activity {

    @Bind(R.id.progress)
    CircleProgress mProgressView;

    public abstract View getParentContainer();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    protected void hideProgressIndicator() {
        if(mProgressView!=null) {
            mProgressView.stopAnim();
            mProgressView.setVisibility(View.INVISIBLE);
        }
        if(getParentContainer()!=null)
            getParentContainer().setVisibility(View.VISIBLE);
    }

    protected void showProgressIndicator() {
        if(mProgressView!=null) {
            // Set the content view to 0% opacity but visible, so that it is visible
            // (but fully transparent) during the animation.
            mProgressView.setAlpha(0f);
            mProgressView.setVisibility(View.VISIBLE);
            mProgressView.startAnim();

            // Animate the content view to 100% opacity, and clear any animation
            // listener set on the view.
            mProgressView.animate()
                    .alpha(1f)
                    .setDuration(getAnimationDuration())
                    .setListener(null);
        }
        // Animate the loading view to 0% opacity. After the animation ends,
        // set its visibility to GONE as an optimization step (it won't
        // participate in layout passes, etc.)
        if(getParentContainer()!=null) {
            getParentContainer().animate()
                    .alpha(0f)
                    .setDuration(getAnimationDuration())
                    .setListener(new AnimatorListenerAdapter() {
                        @Override
                        public void onAnimationEnd(Animator animation) {
                            getParentContainer().setVisibility(View.GONE);
                        }
                    });
        }
    }

    public abstract int getAnimationDuration();
}
