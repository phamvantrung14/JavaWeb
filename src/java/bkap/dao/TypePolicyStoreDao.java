/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.dao;

import bkap.entity.TypePolicyStore;
import java.util.List;

/**
 *
 * @author asuspc
 */
public interface TypePolicyStoreDao {
    public List<TypePolicyStore> getAllTypePolicyStore();
    public boolean insertTypePolicyStore(TypePolicyStore typePolicystore);
    public boolean updateTypePolicyStore(TypePolicyStore typePolicystore);
    public TypePolicyStore getTypePolicyStoreById(int id);
    public boolean deleteTypePolicyStore(int id);
}
