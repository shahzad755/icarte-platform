package icarte.armedialab.com.icarte.ui.adapter;


import android.net.Uri;
import android.support.v4.app.FragmentManager;
import android.support.v7.widget.RecyclerView.Adapter;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;

import com.android.volley.cache.BitmapCache;
import com.android.volley.toolbox.ImageLoader;

import java.util.List;

import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.DataModel;
import icarte.armedialab.com.icarte.domain.Item;
import icarte.armedialab.com.icarte.domain.ItemVariant;
import icarte.armedialab.com.icarte.ui.ItemsFragement;
import icarte.armedialab.com.icarte.ui.adapter.listeners.OnItemClickListener;
import icarte.armedialab.com.icarte.util.Utils;

public class ItemListFragmentViewAdapter extends Adapter<ItemViewHolder>  {

    private final FragmentManager fragmentManager;
    private final ItemsFragement fragment;
    private DataModel<Item> model;
    private int itemLayoutRes;
    //private ImageLoader imageLoader = ApplicationController.getInstance().getImageLoader();
    private ImageLoader imageLoader = null;
    private OnItemClickListener listener;

    public ItemListFragmentViewAdapter(DataModel<Item> model, int itemLayoutRes,
                                       OnItemClickListener listener, FragmentManager fManager,
                                       ItemsFragement itemsFragement) {
        this.model = model;
        this.itemLayoutRes = itemLayoutRes;
        this.listener = listener;
        this.fragmentManager = fManager;
        this.fragment = itemsFragement;
    }

    @Override
    public ItemViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View view = inflater.inflate(itemLayoutRes, parent, false);

        return new ItemViewHolder(view, listener, this);
    }

    @Override
    public void onBindViewHolder(final ItemViewHolder holder, int position) {
        //holder.txtItemTitle.setBackgroundColor(backgroundColor(position, holder));
        final Item item = model.getModelItem(position);
        holder.setItem(item);
        ApplicationController controller = ApplicationController.getInstance();
        holder.txtItemTitle.setText(item.getTitle(controller.getUserLanguage()));
        holder.txtItemDescription.setText(item.getDescription(controller.getUserLanguage()));
        holder.txtItemPrice.setText(controller.getCurrencyCode() +" "+item.getPrice().toString());
        if(item.getCusineType()!=null)
            holder.txtCuisineType.setText(item.getCusineType().getTitle(controller.getUserLanguage()));
        if(item.getSpiceType()!=null)
            holder.txtSpiceType.setText(item.getSpiceType().getTitle(controller.getUserLanguage()));

        // First remove the existing textviews from the layout
        holder.itemVariantContainer.removeAllViews();

        //here add the requried views in itemVariantContainer based on item variant
        List<ItemVariant> itemVariants = item.getItemVariants();
        if(itemVariants!=null && itemVariants.size()>0) {
            TextView textView;
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.WRAP_CONTENT,
                    FrameLayout.LayoutParams.WRAP_CONTENT);
            params.setMargins(10, 2, 10, 2);
            for (ItemVariant variant: itemVariants) {
                textView = new TextView(holder.itemView.getContext());
                StringBuilder text = new StringBuilder().append(variant.getTitle(controller.getUserLanguage()))
                        .append(": ")
                        .append(variant.getPrice())
                        .append(" ")
                        .append(controller.getCurrencyCode());
                textView.setText(text);
                textView.setLayoutParams(params);
                textView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
                textView.setBackgroundResource(R.drawable.product_item_variant_background);
                holder.itemVariantContainer.addView(textView);
           }
        }


/*
        holder.imgItem.setImageUrl(ServerProxy.HOST + "/" + ServerProxy.CONTEXT + "/images/"
                + item.getImageUrl(), getImageLoader());
*/

        Uri uri = Uri.parse(Utils.getImagePath() + item.getImageUrl());

        holder.imgItem.setImageURI(uri);


/*
        Picasso.with(controller.getApplicationContext()).setIndicatorsEnabled(true);

        Picasso.with(controller.getApplicationContext())
                .load(ServerProxy.HOST + "/" + ServerProxy.CONTEXT + "/images/"
                        + item.getImageUrl())
                .fit().centerCrop()
//                .img_placeholder(R.drawable.img_placeholder)
                .error(R.drawable.img_placeholder)
                .into(holder.imgItem);
*/
        holder.setItemPosition(position);
    }

    @Override
    public long getItemId(int position) {
        return getItems()!=null? model.getModelItem(position).getItemId(): 0;
    }

    @Override
    public int getItemCount() {
        return getItems() != null ? getItems().size() : 0;
    }

    @Override
    public int getItemViewType(int position) {
        return super.getItemViewType(position);
    }

    public List<Item> getItems() {
        return model.getModel();
    }

    public void setModel(DataModel<Item> model) {
        this.model = model;
        this.notifyDataSetChanged();
    }

    public DataModel getModel() {
        return model;
    }

    public FragmentManager getFragmentManager() {
        return fragmentManager;
    }

    public ItemsFragement getFragment() {
        return fragment;
    }
}
