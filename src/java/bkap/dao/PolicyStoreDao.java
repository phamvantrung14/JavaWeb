/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.dao;

import bkap.entity.PolicyStore;
import java.util.List;

/**
 *
 * @author asuspc
 */
public interface PolicyStoreDao {
    public List<PolicyStore> getAllPlicyStore();
    public boolean insertPolicyStore(PolicyStore policyStore);
    public boolean updatePolicyStore(PolicyStore policyStore);
    public PolicyStore getPolicyStoreById(int id);
    public boolean deletePolicyStore(int id);
}
