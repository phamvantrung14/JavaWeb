package bkap.entity;
// Generated Oct 4, 2020 3:36:17 PM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Orders generated by hbm2java
 */
public class Orders  implements java.io.Serializable {


     private int orderId;
     private Citys citys;
     private String orderCode;
     private Date created;
     private float totalArmount;
     private String orderNote;
     private Integer payment;
     private String email;
     private String orderAddress;
     private Integer orderStatus;
     private Integer phoneNumber;
     private Set orderDetails = new HashSet(0);

    public Orders() {
    }

	
    public Orders(int orderId) {
        this.orderId = orderId;
    }
    public Orders(int orderId, Citys citys, String orderCode, Date created, float totalArmount, String orderNote, Integer payment, String email, String orderAddress, Integer orderStatus, Integer phoneNumber, Set orderDetails) {
       this.orderId = orderId;
       this.citys = citys;
       this.orderCode = orderCode;
       this.created = created;
       this.totalArmount = totalArmount;
       this.orderNote = orderNote;
       this.payment = payment;
       this.email = email;
       this.orderAddress = orderAddress;
       this.orderStatus = orderStatus;
       this.phoneNumber = phoneNumber;
       this.orderDetails = orderDetails;
    }
   
    public int getOrderId() {
        return this.orderId;
    }
    
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
    public Citys getCitys() {
        return this.citys;
    }
    
    public void setCitys(Citys citys) {
        this.citys = citys;
    }
    public String getOrderCode() {
        return this.orderCode;
    }
    
    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }
    public Date getCreated() {
        return this.created;
    }
    
    public void setCreated(Date created) {
        this.created = created;
    }
    public float getTotalArmount() {
        return this.totalArmount;
    }
    
    public void setTotalArmount(float totalArmount) {
        this.totalArmount = totalArmount;
    }
    public String getOrderNote() {
        return this.orderNote;
    }
    
    public void setOrderNote(String orderNote) {
        this.orderNote = orderNote;
    }
    public Integer getPayment() {
        return this.payment;
    }
    
    public void setPayment(Integer payment) {
        this.payment = payment;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getOrderAddress() {
        return this.orderAddress;
    }
    
    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }
    public Integer getOrderStatus() {
        return this.orderStatus;
    }
    
    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }
    public Integer getPhoneNumber() {
        return this.phoneNumber;
    }
    
    public void setPhoneNumber(Integer phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    public Set getOrderDetails() {
        return this.orderDetails;
    }
    
    public void setOrderDetails(Set orderDetails) {
        this.orderDetails = orderDetails;
    }




}


