package icarte.armedialab.com.icarte.datamodel;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * Created by Maqsood on 8/27/2017.
 */
public class    OrderResponse implements Serializable {
    long orderId;
    String orderRef;
    BigDecimal orderAmount;
    String estimatedTime;

    public OrderResponse() {
    }

    public OrderResponse(long orderId, String orderRef, BigDecimal orderAmount, String estimatedTime) {
        this.orderId = orderId;
        this.orderRef = orderRef;
        this.orderAmount = orderAmount;
        this.estimatedTime = estimatedTime;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public String getOrderRef() {
        return orderRef;
    }

    public void setOrderRef(String orderRef) {
        this.orderRef = orderRef;
    }

    public BigDecimal getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(BigDecimal orderAmount) {
        this.orderAmount = orderAmount;
    }

    public String getEstimatedTime() {
        return estimatedTime;
    }

    public void setEstimatedTime(String estimatedTime) {
        this.estimatedTime = estimatedTime;
    }
}
