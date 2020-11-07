package bkap.entity;
// Generated Oct 4, 2020 3:36:17 PM by Hibernate Tools 4.3.1


import java.io.Serializable;

/**
 * Stores generated by hbm2java
 */
public class Stores  implements java.io.Serializable {


     private int storeId;
     private Citys citys;
     private String storeCode;
     private String storeNames;
     private String storeAddress;
     private Integer storePhone;
     private Integer guaranteePhone;
     private Boolean storeStatus;
     private String openTime;
     private String storeEmail;

    public Stores() {
    }

	
    public Stores(int storeId) {
        this.storeId = storeId;
    }
    public Stores(int storeId, Citys citys, String storeCode, String storeNames, String storeAddress, Integer storePhone, Integer guaranteePhone, Boolean storeStatus, String openTime, String storeEmail) {
       this.storeId = storeId;
       this.citys = citys;
       this.storeCode = storeCode;
       this.storeNames = storeNames;
       this.storeAddress = storeAddress;
       this.storePhone = storePhone;
       this.guaranteePhone = guaranteePhone;
       this.storeStatus = storeStatus;
       this.openTime = openTime;
       this.storeEmail = storeEmail;
    }
   
    public int getStoreId() {
        return this.storeId;
    }
    
    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }
    public Citys getCitys() {
        return this.citys;
    }
    
    public void setCitys(Citys citys) {
        this.citys = citys;
    }
    public String getStoreCode() {
        return this.storeCode;
    }
    
    public void setStoreCode(String storeCode) {
        this.storeCode = storeCode;
    }
    public String getStoreNames() {
        return this.storeNames;
    }
    
    public void setStoreNames(String storeNames) {
        this.storeNames = storeNames;
    }
    public String getStoreAddress() {
        return this.storeAddress;
    }
    
    public void setStoreAddress(String storeAddress) {
        this.storeAddress = storeAddress;
    }
    public Integer getStorePhone() {
        return this.storePhone;
    }
    
    public void setStorePhone(Integer storePhone) {
        this.storePhone = storePhone;
    }
    public Integer getGuaranteePhone() {
        return this.guaranteePhone;
    }
    
    public void setGuaranteePhone(Integer guaranteePhone) {
        this.guaranteePhone = guaranteePhone;
    }
    public Boolean getStoreStatus() {
        return this.storeStatus;
    }
    
    public void setStoreStatus(Boolean storeStatus) {
        this.storeStatus = storeStatus;
    }
    public String getOpenTime() {
        return this.openTime;
    }
    
    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }
    public String getStoreEmail() {
        return this.storeEmail;
    }
    
    public void setStoreEmail(String storeEmail) {
        this.storeEmail = storeEmail;
    }




}


