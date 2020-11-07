package bkap.entity;
// Generated Oct 4, 2020 3:36:17 PM by Hibernate Tools 4.3.1


import java.io.Serializable;

/**
 * Banner generated by hbm2java
 */
public class Banner  implements java.io.Serializable {


     private int bannerId;
     private BannerType bannerType;
     private String bannerName;
     private String imageLink;
     private String bannerLink;
     private Integer priovity;
     private Boolean bannerStatus;

    public Banner() {
    }

	
    public Banner(int bannerId) {
        this.bannerId = bannerId;
    }
    public Banner(int bannerId, BannerType bannerType, String bannerName, String imageLink, String bannerLink, Integer priovity, Boolean bannerStatus) {
       this.bannerId = bannerId;
       this.bannerType = bannerType;
       this.bannerName = bannerName;
       this.imageLink = imageLink;
       this.bannerLink = bannerLink;
       this.priovity = priovity;
       this.bannerStatus = bannerStatus;
    }
   
    public int getBannerId() {
        return this.bannerId;
    }
    
    public void setBannerId(int bannerId) {
        this.bannerId = bannerId;
    }
    public BannerType getBannerType() {
        return this.bannerType;
    }
    
    public void setBannerType(BannerType bannerType) {
        this.bannerType = bannerType;
    }
    public String getBannerName() {
        return this.bannerName;
    }
    
    public void setBannerName(String bannerName) {
        this.bannerName = bannerName;
    }
    public String getImageLink() {
        return this.imageLink;
    }
    
    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }
    public String getBannerLink() {
        return this.bannerLink;
    }
    
    public void setBannerLink(String bannerLink) {
        this.bannerLink = bannerLink;
    }
    public Integer getPriovity() {
        return this.priovity;
    }
    
    public void setPriovity(Integer priovity) {
        this.priovity = priovity;
    }
    public Boolean getBannerStatus() {
        return this.bannerStatus;
    }
    
    public void setBannerStatus(Boolean bannerStatus) {
        this.bannerStatus = bannerStatus;
    }




}


