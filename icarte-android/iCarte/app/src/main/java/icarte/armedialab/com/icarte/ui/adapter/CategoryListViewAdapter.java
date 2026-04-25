package icarte.armedialab.com.icarte.ui.adapter;

import android.content.Intent;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.android.volley.cache.plus.ImageLoader;

import java.util.List;

import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.DataModel;
import icarte.armedialab.com.icarte.domain.ItemCategory;
import icarte.armedialab.com.icarte.service.ServerProxy;
import icarte.armedialab.com.icarte.ui.ItemsListActivity;
import icarte.armedialab.com.icarte.ui.adapter.listeners.OnCategoryClickListener;
import icarte.armedialab.com.icarte.util.Utils;

public class CategoryListViewAdapter extends Adapter<CategoryViewHolder> implements OnCategoryClickListener {

    private DataModel<ItemCategory> model;
    private int itemLayoutRes;
    private boolean isStaggered;

    public CategoryListViewAdapter(DataModel model, int itemLayoutRes, boolean isStaggered) {
        this.model = model;
        this.itemLayoutRes = itemLayoutRes;
        this.isStaggered = isStaggered;
    }

    @Override
    public CategoryViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View view;
        if (isStaggered && viewType == 0) {
            view = inflater.inflate(R.layout.grid_item_taller, parent, false);
        } else {
                view = inflater.inflate(itemLayoutRes, parent, false);
        }
        return new CategoryViewHolder(view, this, this);
    }

    @Override
    public void onBindViewHolder(final CategoryViewHolder holder, int position) {
        //holder.txtItemTitle.setBackgroundColor(backgroundColor(position, holder));
        final ItemCategory itemCategory = model.getModelItem(position);
        holder.setCategory(itemCategory);

        holder.imgCategory.setDefaultImageResId(R.drawable.img_placeholder);
        holder.imgCategory.setErrorImageResId(R.drawable.img_placeholder);


        holder.imgCategory.setImageUrl(Utils.getImagePath()
                + itemCategory.getImageUrl(), ApplicationController.getInstance().getImageLoader());



/*
        Context context = ApplicationController.getInstance().getApplicationContext();
        Picasso.with(context).setIndicatorsEnabled(true);
        Picasso.with(context)
                .load(ServerProxy.HOST + "/" + ServerProxy.CONTEXT + "/images/"
                        + itemCategory.getImageUrl())
                .fit().centerCrop()
                .placeholder(R.drawable.img_placeholder)
                .error(R.drawable.img_placeholder)
                .into(holder.imgItem);
*/

        holder.setItemPosition(position);
    }

    @Override
    public long getItemId(int position) {
        return getCategories()!=null? model.getModelItem(position).getId(): 0;
    }

    @Override
    public int getItemCount() {
        return getCategories() != null ? getCategories().size() : 0;
    }

    @Override
    public int getItemViewType(int position) {
        return isStaggered ? position % 2 : 0;
    }

    public List<ItemCategory> getCategories() {
        return model.getModel();
    }

    public void setModel(DataModel<ItemCategory> model) {
        this.model = model;
        this.notifyDataSetChanged();
    }

    public DataModel getModel() {
        return model;
    }

    @Override
    public void onCategorySelected(View view, ItemCategory category) {
        Intent intent = new Intent(view.getContext(), ItemsListActivity.class);
        intent.putExtra(Utils.KEY_SELECTED_CATEGORY, category);
        view.getContext().startActivity(intent);
    }
}
