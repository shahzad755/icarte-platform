package icarte.armedialab.com.icarte.ui.adapter;

import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.util.Log;
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
import icarte.armedialab.com.icarte.ui.adapter.listeners.OnCategoryClickListener;
import icarte.armedialab.com.icarte.util.Utils;

public class CategoryListFragmentViewAdapter extends Adapter<CategoryViewHolder>  {

    DataModel<ItemCategory> model;
    private int itemLayoutRes;
    private ImageLoader imageLoader = ApplicationController.getInstance().getImageLoader();
    private OnCategoryClickListener listener;
    long selectedItem = 0;
    RecyclerView recyclerView;

    public CategoryListFragmentViewAdapter(DataModel<ItemCategory> model, int itemLayoutRes, OnCategoryClickListener listener, RecyclerView recyclerView) {
        this.model = model;
        this.itemLayoutRes = itemLayoutRes;
        this.listener = listener;
        this.recyclerView = recyclerView;
    }

    @Override
    public CategoryViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        return new CategoryViewHolder(inflater.inflate(itemLayoutRes, parent, false), listener, this);
    }

    @Override
    public void onBindViewHolder(final CategoryViewHolder holder, int position) {
        final ItemCategory itemCategory = model.getModelItem(position);
        holder.setCategory(itemCategory);

        holder.imgCategory.setDefaultImageResId(R.drawable.img_placeholder);
        holder.imgCategory.setErrorImageResId(R.drawable.img_placeholder);

        holder.imgCategory.setImageUrl(Utils.getImagePath() + itemCategory.getImageUrl(), this.imageLoader);

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
        // Set selected state; use a state list drawable to style the view
        //TODO: this should be based on selected Category from previous activity
        holder.itemView.setSelected(selectedItem == position);

    }

    @Override
    public long getItemId(int position) {
        return getCategories()!=null? model.getModelItem(position).getItemCategoryId(): 0;
    }

    @Override
    public int getItemCount() {
        return getCategories() != null ? getCategories().size() : 0;
    }

    @Override
    public int getItemViewType(int position) {
        return super.getItemViewType(position);
    }

    private List<ItemCategory> getCategories() {
        return model.getModel();
    }

    public void setModel(DataModel<ItemCategory> model) {
        this.model = model;
        this.notifyDataSetChanged();
    }

    public DataModel<ItemCategory> getModel() {
        return model;
    }

    public void setSelectedItem(int position) {
        selectedItem = position;
    }

    public void setSelectedView(View v, ItemCategory category, int index) {
        Log.d("Selected View", category.getItemCategoryId()+" Index: "+ index);

        List<ItemCategory> list = getCategories();
        for (ItemCategory item: list) {
            RecyclerView.ViewHolder viewHolder = recyclerView.findViewHolderForItemId(item.getItemCategoryId());
            if(viewHolder!=null)
                viewHolder.itemView.setSelected(false);
        }
        v.setSelected(true);
/*
        RecyclerView.ViewHolder oldViewHolder = (RecyclerView.ViewHolder) recyclerView.findViewHolderForItemId(selectedItem);
        oldViewHolder.itemView.setSelected(false);

        selectedItem = category.getItemCategoryId();

        RecyclerView.ViewHolder newViewHolder = (RecyclerView.ViewHolder) recyclerView.findViewHolderForItemId(selectedItem);
        newViewHolder.itemView.setSelected(true);
*/
/*
        notifyItemChanged(selectedItem);
        //recyclerView.findViewHolderForAdapterPosition(selectedItem).itemView.setSelected(false);
        selectedItem = recyclerView.getChildLayoutPosition(v);
        notifyItemChanged(selectedItem);
*/
    }

}
