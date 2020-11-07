package bkap.entity;
// Generated Oct 4, 2020 3:36:17 PM by Hibernate Tools 4.3.1



/**
 * Images generated by hbm2java
 */
public class Images  implements java.io.Serializable {


     private int imageId;
     private Products products;
     private String imageLink;
     private Boolean imageStatus;

    public Images() {
    }

	
    public Images(int imageId) {
        this.imageId = imageId;
    }
    public Images(int imageId, Products products, String imageLink, Boolean imageStatus) {
       this.imageId = imageId;
       this.products = products;
       this.imageLink = imageLink;
       this.imageStatus = imageStatus;
    }
   
    public int getImageId() {
        return this.imageId;
    }
    
    public void setImageId(int imageId) {
        this.imageId = imageId;
    }
    public Products getProducts() {
        return this.products;
    }
    
    public void setProducts(Products products) {
        this.products = products;
    }
    public String getImageLink() {
        return this.imageLink;
    }
    
    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }
    public Boolean getImageStatus() {
        return this.imageStatus;
    }
    
    public void setImageStatus(Boolean imageStatus) {
        this.imageStatus = imageStatus;
    }




}

