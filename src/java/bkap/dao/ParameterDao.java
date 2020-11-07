/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.dao;

import bkap.entity.Parameter;
import java.util.List;

/**
 *
 * @author asuspc
 */
public interface ParameterDao {
    public List<Parameter> getAllParam();
    public boolean insertParam(Parameter param);
    public boolean updateParam(Parameter param);
    public Parameter getParamById(int id);
    public boolean deletePram(int id);
}
