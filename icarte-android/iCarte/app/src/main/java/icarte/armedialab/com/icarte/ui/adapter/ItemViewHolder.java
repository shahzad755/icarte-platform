package icarte.armedialab.com.icarte.ui.adapter;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.facebook.drawee.view.SimpleDraweeView;
import com.ms.square.android.expandabletextview.ExpandableTextView;

import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.Order;
import icarte.armedialab.com.icarte.datamodel.OrderItem;
import icarte.armedialab.com.icarte.domain.Item;
import icarte.armedialab.com.icarte.ui.ItemImageSliderActivity;
import icarte.armedialab.com.icarte.ui.ItemsListActivity;
import icarte.armedialab.com.icarte.ui.adapter.listeners.OnItemClickListener;
import icarte.armedialab.com.icarte.ui.component.OrderItemConfigDialogFragment;
import icarte.armedialab.com.icarte.util.Utils;

/**
 * Created by Maqsood on 6/17/2017.
 */
public class ItemViewHolder extends RecyclerView.ViewHolder
        implements View.OnClickListener {

    final TextView txtItemTitle;
    final TextView txtItemPrice;
    final ExpandableTextView txtItemDescription;
    //final NetworkImageViewPlus imgItem;
    final SimpleDraweeView imgItem;
    final LinearLayout miscellaneousInfoContainer;
    final TextView txtCuisineType;
    final TextView txtSpiceType;
    final Button btnAddEditOrder;
    final FrameLayout itemVariantContainer;
    private final OnItemClickListener onItemClickListener;
    private Item item;
    private ItemListFragmentViewAdapter adapter;
    private int itemPosition;


    public ItemViewHolder(final View view, OnItemClickListener listener, final ItemListFragmentViewAdapter adapter) {
        super(view);
        this.adapter = adapter;
        txtItemTitle = (TextView) view.findViewById(R.id.txtItemTitle);
        txtItemPrice = (TextView) view.findViewById(R.id.txtItemPrice);
        txtCuisineType = (TextView) view.findViewById(R.id.txtCuisineType);
        txtSpiceType = (TextView) view.findViewById(R.id.txtSpiceType);
        txtItemDescription = (ExpandableTextView) view.findViewById(R.id.expand_text_view);
        btnAddEditOrder = (Button) view.findViewById(R.id.btnAddEditOrder);
        //final Animation anim = AnimationUtils.loadAnimation(view.getContext(), R.anim.animate_rotate_order);
        //imgItem = (NetworkImageViewPlus)view.findViewById(R.id.imgItemPrimary);
        miscellaneousInfoContainer = (LinearLayout)view.findViewById(R.id.miscellaneous_info_container);
        itemVariantContainer = (FrameLayout) view.findViewById(R.id.itemVariantContainer);

        imgItem = (SimpleDraweeView)view.findViewById(R.id.imgItemPrimary);

        imgItem.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //TODO: Start the slide show
                Intent intent =  new Intent(v.getContext(), ItemImageSliderActivity.class);
                intent.putExtra(Utils.KEY_ITEM_MEDIA_CONTENTS, item.getMediaContents().toArray());
                v.getContext().startActivity(intent);
            }
        });

        this.btnAddEditOrder.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //v.startAnimation(anim);
                if(Utils.isShowDialog(item)) {
                    OrderItemConfigDialogFragment fragment = OrderItemConfigDialogFragment
                            .newInstance(adapter.getFragment()
                            .getResources().getString(R.string.dialog_fragment_title));
                    fragment.setItem(item);
                    fragment.show(adapter.getFragmentManager(), ItemViewHolder.class.getName());
                } else {
                    //Directly Add to order if the max item order limit is available
                    Order order = ApplicationController.getInstance().getOrder();
                    OrderItem tempOrderItem = order.getOrderItem(item);
                    StringBuilder stringBuilder = new StringBuilder();
                    if(tempOrderItem==null || tempOrderItem.getQuantity()<Utils.MAX_ITEM_ORDER_QTY) {
                        order.addOrderItem(new OrderItem(item, Utils.MIN_ITEM_ORDER_QTY, null, null, null), false);

                        Activity activity = adapter.getFragment().getActivity();
                        if(activity instanceof ItemsListActivity) {
                            ((ItemsListActivity)activity ).setCartItemCounter(order.getOrderCount());
                        }

                        stringBuilder.append(item.getTitle(ApplicationController.getInstance().getUserLanguage()))
                                .append(" ").append(adapter.getFragment().getString(
                                R.string.item_added_to_order_success_msg));
                    } else {
                        stringBuilder.append(adapter.getFragment().getString(
                                R.string.maximum_order_item_level_reached))
                                .append(" ")
                                .append(item.getTitle(
                                        ApplicationController.getInstance().getUserLanguage()));
                    }
                    Utils.showToast(v.getContext(), stringBuilder.toString());

                    //Utils.showToast(v.getContext(), "Directly add to order: " + itemPosition);
                }

            }
        });
        this.onItemClickListener = listener;
        this.adapter = adapter;
        view.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        if(onItemClickListener!=null) {
            onItemClickListener.onItemSelected(v, item);
        }
    }

    public void setItemPosition(int itemPosition) {
        this.itemPosition = itemPosition;
    }

    public void setItem(Item item) {
        this.item = item;
    }
}

