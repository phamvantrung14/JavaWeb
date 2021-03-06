package bkap.entity;
// Generated Oct 4, 2020 3:36:17 PM by Hibernate Tools 4.3.1


import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * TypePolicyStore generated by hbm2java
 */
public class TypePolicyStore  implements java.io.Serializable {


     private int typePsid;
     private String typePsname;
     private Integer typePspriority;
     private Integer parentId;
     private Boolean typePsstatus;
     private Set policyStores = new HashSet(0);

    public TypePolicyStore() {
    }

	
    public TypePolicyStore(int typePsid) {
        this.typePsid = typePsid;
    }
    public TypePolicyStore(int typePsid, String typePsname, Integer typePspriority, Integer parentId, Boolean typePsstatus, Set policyStores) {
       this.typePsid = typePsid;
       this.typePsname = typePsname;
       this.typePspriority = typePspriority;
       this.parentId = parentId;
       this.typePsstatus = typePsstatus;
       this.policyStores = policyStores;
    }
   
    public int getTypePsid() {
        return this.typePsid;
    }
    
    public void setTypePsid(int typePsid) {
        this.typePsid = typePsid;
    }
    public String getTypePsname() {
        return this.typePsname;
    }
    
    public void setTypePsname(String typePsname) {
        this.typePsname = typePsname;
    }
    public Integer getTypePspriority() {
        return this.typePspriority;
    }
    
    public void setTypePspriority(Integer typePspriority) {
        this.typePspriority = typePspriority;
    }
    public Integer getParentId() {
        return this.parentId;
    }
    
    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
    public Boolean getTypePsstatus() {
        return this.typePsstatus;
    }
    
    public void setTypePsstatus(Boolean typePsstatus) {
        this.typePsstatus = typePsstatus;
    }
    public Set getPolicyStores() {
        return this.policyStores;
    }
    
    public void setPolicyStores(Set policyStores) {
        this.policyStores = policyStores;
    }




}


