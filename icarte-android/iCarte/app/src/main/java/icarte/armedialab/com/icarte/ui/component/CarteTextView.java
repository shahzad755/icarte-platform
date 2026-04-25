package icarte.armedialab.com.icarte.ui.component;

import android.content.Context;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.widget.TextView;

/**
 * Created by Maqsood on 25/01/17.
 */
public class CarteTextView extends TextView {
    public CarteTextView (Context context) {

        super(context);

        if (!isInEditMode())
            init(context);
    }

    public CarteTextView (Context context, AttributeSet attrs) {

        super(context, attrs);

        if (!isInEditMode())
            init(context);
    }

    public CarteTextView (Context context, AttributeSet attrs, int defStyleAttr) {

        super(context, attrs, defStyleAttr);

        if (!isInEditMode())
            init(context);

    }

    private void init(Context context) {

        //Typeface t = Typeface.createFromAsset(context.getAssets(), "Lobster-Regular.ttf");
        Typeface t = Typeface.createFromAsset(context.getAssets(), "fonts/breamcatcher.ttf");
        this.setTypeface(t);
    }
}
