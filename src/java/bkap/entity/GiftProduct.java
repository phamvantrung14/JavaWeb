package bkap.entity;
// Generated Oct 4, 2020 3:36:17 PM by Hibernate Tools 4.3.1



/**
 * GiftProduct generated by hbm2java
 */
public class GiftProduct  implements java.io.Serializable {


     private int whishlistId;
     private Gift gift;
     private Products products;

    public GiftProduct() {
    }

	
    public GiftProduct(int whishlistId) {
        this.whishlistId = whishlistId;
    }
    public GiftProduct(int whishlistId, Gift gift, Products products) {
       this.whishlistId = whishlistId;
       this.gift = gift;
       this.products = products;
    }
   
    public int getWhishlistId() {
        return this.whishlistId;
    }
    
    public void setWhishlistId(int whishlistId) {
        this.whishlistId = whishlistId;
    }
    public Gift getGift() {
        return this.gift;
    }
    
    public void setGift(Gift gift) {
        this.gift = gift;
    }
    public Products getProducts() {
        return this.products;
    }
    
    public void setProducts(Products products) {
        this.products = products;
    }




}


