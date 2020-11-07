/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.dao;

import bkap.entity.Policy;
import java.util.List;

/**
 *
 * @author asuspc
 */
public interface PolicyDao {
    public List<Policy> getAllPolicys();
    public boolean insertPolicy(Policy poli);
    public boolean updatePolicy(Policy poli);
    public Policy getPolicyById(int id);
    public boolean deletePolicy(int id);
}
