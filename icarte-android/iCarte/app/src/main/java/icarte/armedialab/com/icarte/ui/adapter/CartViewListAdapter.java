package icarte.armedialab.com.icarte.ui.adapter;

import android.net.Uri;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.TextView;

import com.ctrlplusz.anytextview.AnyTextView;
import com.facebook.drawee.view.SimpleDraweeView;

import java.util.List;

import butterknife.Bind;
import butterknife.ButterKnife;
import butterknife.OnClick;
import icarte.armedialab.com.icarte.ApplicationController;
import icarte.armedialab.com.icarte.R;
import icarte.armedialab.com.icarte.datamodel.Order;
import icarte.armedialab.com.icarte.datamodel.OrderItem;
import icarte.armedialab.com.icarte.service.ServerProxy;
import icarte.armedialab.com.icarte.ui.CartViewActivity;
import icarte.armedialab.com.icarte.ui.component.OrderItemConfigDialogFragment;
import icarte.armedialab.com.icarte.util.Utils;

/**
 * Created by Maqsood on 8/7/2017.
 */
public class CartViewListAdapter extends Adapter<CartViewListAdapter.OrderItemViewHolder> {

    private Order order;
    private CartViewActivity activity;

    public CartViewListAdapter(Order order, CartViewActivity activity) {
        this.order = order;
        this.activity = activity;
    }

    @Override
    public OrderItemViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());
        View view = inflater.inflate(R.layout.layout_cartview_item, parent, false);
        return new OrderItemViewHolder(view);
    }

    @Override
    public void onBindViewHolder(OrderItemViewHolder holder, int position) {
        OrderItem orderItem = order.getOrderItems().get(position);
        holder.setOrderItem(orderItem);
        holder.setPosition(position);
        ApplicationController appController = ApplicationController.getInstance();
        holder.txtOrderItemTitle.setText(orderItem.getItem().getTitle(appController.getUserLanguage()));
        holder.editTxtOrderItemQty.setText(String.valueOf(orderItem.getQuantity()));
        holder.txtOrderItemDescr.setText(orderItem.getItem().getDescription(appController.getUserLanguage()));
        setItemDisplay(holder.txtItemUnitPrice, orderItem);

        holder.txtOrderItemPrice.setText(orderItem.getPrice().toString()
                + " " +appController.getCurrencyCode());
        Uri uri = Uri.parse(Utils.getImagePath() + orderItem.getItem().getImageUrl());

        holder.imgOrderItemImage.setImageURI(uri);
    }

    public void setItemDisplay(TextView txtItemUnitPrice, OrderItem orderItem) {
        txtItemUnitPrice.setText(
                orderItem.getItemVariant()==null? orderItem.getItem().getPrice().toString():
                        orderItem.getItemVariant().getPrice().toString()
        );
    }

    @Override
    public long getItemId(int position) {
        return getItemCount() > 0 ? order.getOrderItems().get(position).getItem().getItemId() : 0;
    }

    @Override
    public int getItemCount() {
        List<OrderItem> orderItems = order.getOrderItems();
        return orderItems !=null ? orderItems.size(): 0;
    }

    public class OrderItemViewHolder extends RecyclerView.ViewHolder
            implements View.OnClickListener, OrderItemConfigDialogFragment.ItemConfigChangeListener {

        @Bind(R.id.imgOrderItemImage)
        SimpleDraweeView imgOrderItemImage;
        @Bind(R.id.txtOrderItemTitle)
        AnyTextView txtOrderItemTitle;
        @Bind(R.id.txtItemOrderQuantity)
        AnyTextView txtItemOrderQuantity;
        @Bind(R.id.editTxtOrderItemQty)
        AnyTextView editTxtOrderItemQty;
        /*
                @Bind(R.id.imgBtnDecreaseQty)
                ImageButton imgBtnDecreaseQty;
                @Bind(R.id.imgBtnIncreaseQty)
                ImageButton imgBtnIncreaseQty;
        */
        @Bind(R.id.txtOrderItemPrice)
        AnyTextView txtOrderItemPrice;

        @Bind(R.id.txtItemUnitPrice)
        AnyTextView txtItemUnitPrice;

        @Bind(R.id.txtOrderItemDescr)
        TextView txtOrderItemDescr;

        @Bind(R.id.imgOrderDeleteItem)
        ImageButton imgOrderDeleteItem;

        @Bind(R.id.imgDetail)
        ImageButton imgDetail;

        @Bind (R.id.itemOrderDescContainer)
        View itemOrderDescContainer;

        int position;

        OrderItem orderItem;

        public OrderItemViewHolder(View view) {
            super(view);
            ButterKnife.bind(this, view);
            itemOrderDescContainer.setOnClickListener(this);
            imgDetail.setOnClickListener(this);

            //view.setOnClickListener(this);
        }
/*

//        @OnClick (R.id.imgBtnDecreaseQty)
        public void onDecreaseQuantity(View v){
            if (orderItem.getQuantity() > 1) {
                orderItem.setQuantity(orderItem.getQuantity() - 1);
                editTxtOrderItemQty.setText(String.valueOf(orderItem.getQuantity()));
                txtOrderItemPrice.setText(orderItem.getPrice().toString()
                + " "+ ApplicationController.getInstance().getCurrencyCode());
                activity.setTotalOrderPriceText(order.getOrderTotal().toString());
            } else {
                Utils.showToast(v.getContext(), "Minimum order level is 1...");
            }
        }

//        @OnClick (R.id.imgBtnIncreaseQty)
        public void onIncreaseQuantity(View v){
            if (orderItem.getQuantity() < Utils.MAX_ITEM_ORDER_QTY) {
                orderItem.setQuantity(orderItem.getQuantity() + 1);
                editTxtOrderItemQty.setText(String.valueOf(orderItem.getQuantity()));
                txtOrderItemPrice.setText(orderItem.getPrice().toString()
                        + " " + ApplicationController.getInstance().getCurrencyCode());
                activity.setTotalOrderPriceText(order.getOrderTotal().toString());
            } else {
                Utils.showToast(v.getContext(), "Maximum order level is " + Utils.MAX_ITEM_ORDER_QTY + "...");
            }
        }
*/

        public void updateQuantity(int quantity) {
            orderItem.setQuantity(quantity);
            editTxtOrderItemQty.setText(String.valueOf(orderItem.getQuantity()));
            txtOrderItemPrice.setText(orderItem.getPrice().toString()
                    + " " + ApplicationController.getInstance().getCurrencyCode());
            activity.setTotalOrderPriceText(order.getOrderTotal().toString());
        }

        @OnClick (R.id.imgOrderDeleteItem)
        public void onDeleteOrderItem(){
            order.removeOrderItem(orderItem);
            this.orderItem = null;
            notifyItemRemoved(position);
            notifyItemRangeChanged(position, getItemCount());
            activity.setTotalOrderPriceText(order.getOrderTotal().toString());
            if(order.getOrderCount()<1) {
                activity.hideOrderButtonFromCartView();
/*
                Intent intent = new Intent(activity, CategoryListActivity.class);
                activity.startActivity(intent);
*/
                activity.onCartEmpty(null);
            }
        }

        @Override
        public void onClick(View v) {
                OrderItemConfigDialogFragment fragment = OrderItemConfigDialogFragment
                        .newInstance(activity.getResources()
                        .getString(R.string.dialog_fragment_title));
                fragment.setItem(orderItem.getOrigItem());
                fragment.setOrderItemViewHolder(this);
                fragment.show(activity.getSupportFragmentManager(), CartViewListAdapter.class.getName());
                fragment.setItemConfigChangeListener(this);
        }


        public void setPosition(int position) {
            this.position = position;
        }

        public void setOrderItem(OrderItem orderItem) {
            this.orderItem = orderItem;
        }

        public OrderItem getOrderItem() {
            return orderItem;
        }

        @Override
        public void onConfigChange(OrderItem oItem) {
            setItemDisplay(txtItemUnitPrice, oItem);
        }

    }
    public Order getOrder() {
        return order;
    }

}
