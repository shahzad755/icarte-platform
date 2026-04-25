package icarte.armedialab.com.icarte.datamodel;

import android.support.annotation.Nullable;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import icarte.armedialab.com.icarte.domain.Item;

/**
 * Created by Maqsood on 7/22/2017.
 */
public class Order {

    private String orderRefNumber;
    private Long orderId;
    private Customer customer;
    private Staff staff;
    private String servingTableRef;
    private String specialRemarks;
    private List<OrderItem> orderItems = new ArrayList<>(5);

    public String getServingTableRef() {
        return servingTableRef;
    }

    public void setServingTableRef(String servingTableRef) {
        this.servingTableRef = servingTableRef;
    }

    public String getSpecialRemarks() {
        return specialRemarks;
    }

    public void setSpecialRemarks(String specialRemarks) {
        this.specialRemarks = specialRemarks;
    }

    public String getOrderRefNumber() {
        return orderRefNumber;
    }

    public void setOrderRefNumber(String orderRefNumber) {
        this.orderRefNumber = orderRefNumber;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void addOrderItem(OrderItem orderItem, boolean doReplace) {
        OrderItem curEntry = null;
        for (OrderItem _orderItem: orderItems) {
            if(_orderItem.equals(orderItem)) {
                curEntry = _orderItem;
                break;
            }
        }


        // If the quantity is zero or less, remove the product
        if(curEntry != null) {
            if (orderItem.getQuantity() <= 0) {
                removeOrderItem(orderItem);
            } else {
                if(doReplace) {
                    removeOrderItem(orderItem);
                    orderItems.add(orderItem);
                } else {
                    curEntry.setQuantity(curEntry.getQuantity()+orderItem.getQuantity());
                }
            }
        }

        // If a current cart entry doesn't exist, create one
        if(curEntry == null) {
            orderItems.add(orderItem);
        }

    }

    public void removeOrderItem(OrderItem orderItem) {
        int size = orderItems.size();
        for (int i = 0; i < size; i++) {
            if(orderItem.equals(orderItems.get(i))) {
                //orderItem.clean();
                orderItems.remove(i);
                break;
            }
        }
    }

    @Nullable
    public OrderItem getOrderItem(Item item) {
        for (OrderItem orderItem: orderItems) {
            if(orderItem.getItem().equals(item)) {
                return orderItem;
            }
        }
/* below is less efficient so replaced by above code
        int size = orderItems.size();
        for (int i = 0; i < size; i++) {
            if(item.equals(orderItems.get(i).getItem())) {
                return orderItems.get(i);
            }
        }
*/
        return null;
    }

    public void removeAll(){
        orderItems.clear();
    }

    public BigDecimal getOrderTotal() {
        BigDecimal total = BigDecimal.ZERO;
        if(this.orderItems!=null) {
            int size = orderItems.size();
            for (int i = 0; i < size; i++) {
                total = total.add(orderItems.get(i).getPrice());
            }
        }
        return total;
    }

    public int getOrderCount(){
        if(this.orderItems!=null) {
            int itemQtyInCart = 0;
            int size = orderItems.size();
            for (int i = 0; i < size; i++) {
                itemQtyInCart += orderItems.get(i).getQuantity();
            }
            return itemQtyInCart;

            //return this.orderItems.size();
        }
        else return 0;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    public OrderJsonWrapper getJsonWrapper() {
        OrderJsonWrapper orderJsonWrapper = new OrderJsonWrapper();
        orderJsonWrapper.servingTable = servingTableRef;
        orderJsonWrapper.specialRemarks = specialRemarks;
        orderJsonWrapper.staffCode = staff!=null?staff.getStaffCode(): null;
        orderJsonWrapper.customer = customer.getCustomerJsonWrapper();

        orderJsonWrapper.orderItemList = new ArrayList<>();
        for (OrderItem orderItem: orderItems) {
            orderJsonWrapper.orderItemList.add(orderItem.getOrderItemJsonWrapper());
        }
        return orderJsonWrapper;
    }

    public class OrderJsonWrapper {

        public String servingTable;
        public String specialRemarks;
        public String staffCode;
        public List<OrderItem.OrderItemJsonWrapper> orderItemList;
        public Customer.CustomerJsonWrapper customer;
    }
}
