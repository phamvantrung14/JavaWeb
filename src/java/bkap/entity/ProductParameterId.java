package bkap.entity;
// Generated Oct 4, 2020 3:36:17 PM by Hibernate Tools 4.3.1



/**
 * ProductParameterId generated by hbm2java
 */
public class ProductParameterId  implements java.io.Serializable {


     private int productId;
     private int parameterId;

    public ProductParameterId() {
    }

    public ProductParameterId(int productId, int parameterId) {
       this.productId = productId;
       this.parameterId = parameterId;
    }
   
    public int getProductId() {
        return this.productId;
    }
    
    public void setProductId(int productId) {
        this.productId = productId;
    }
    public int getParameterId() {
        return this.parameterId;
    }
    
    public void setParameterId(int parameterId) {
        this.parameterId = parameterId;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof ProductParameterId) ) return false;
		 ProductParameterId castOther = ( ProductParameterId ) other; 
         
		 return (this.getProductId()==castOther.getProductId())
 && (this.getParameterId()==castOther.getParameterId());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getProductId();
         result = 37 * result + this.getParameterId();
         return result;
   }   


}

