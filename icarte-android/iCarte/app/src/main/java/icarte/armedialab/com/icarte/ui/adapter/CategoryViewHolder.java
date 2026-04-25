package icarte.armedialab.com.icarte.ui.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.TextView;

import com.android.volley.ui.NetworkImageViewPlus;

import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.ui.adapter.listeners.OnCategoryClickListener;
import icarte.armedialab.com.icarte.domain.ItemCategory;

/**
 * Created by Maqsood on 6/17/2017.
 */
public class CategoryViewHolder extends RecyclerView.ViewHolder
        implements View.OnClickListener {

    final TextView text;
    final NetworkImageViewPlus imgCategory;
    private ItemCategory category;
    private OnCategoryClickListener onCategoryClickListener;
    private RecyclerView.Adapter adapter;
    private int itemPosition;

    CategoryViewHolder(View view, OnCategoryClickListener listener, RecyclerView.Adapter adapter) {
        super(view);
        text = (TextView) view.findViewById(R.id.txtCategoryTitle);
        imgCategory = (NetworkImageViewPlus)view.findViewById(R.id.imgCategory);
        this.onCategoryClickListener = listener;
        this.adapter = adapter;
        view.setOnClickListener(this);
    }

    public void setCategory(ItemCategory category) {
        this.category = category;
        this.text.setText(category.getTitle(ApplicationController.getInstance().getUserLanguage()));
    }

    public ItemCategory getCategory() {
        return category;
    }

    @Override
    public void onClick(View v) {

        if(adapter instanceof CategoryListFragmentViewAdapter) {
            ((CategoryListFragmentViewAdapter)adapter).setSelectedView(v, getCategory(), itemPosition);
        }

        if(onCategoryClickListener!=null) {
            onCategoryClickListener.onCategorySelected(v, getCategory());
        }
        /*
        Utils.showToast(v.getContext(), txtItemTitle.getText().toString() + ": Category:" +
                getCategory().getDescription(ApplicationController.getInstance().getUserLanguage()));
        Intent intent = new Intent(v.getContext(), ItemsListActivity.class);
        intent.putExtra(Utils.KEY_SELECTED_CATEGORY, getCategory());
        v.getContext().startActivity(intent);
        */
    }

    public void setItemPosition(int itemPosition) {
        this.itemPosition = itemPosition;
    }
}

