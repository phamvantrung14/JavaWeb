/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.models;

import bkap.entity.PaginateDto;

/**
 *
 * @author asuspc
 */
public class PaginateModel {
    public PaginateDto GetInfoPaginates(int totalData, int limit, int currentPage)
    {
        PaginateDto paginate = new PaginateDto();
        paginate.setLimit(limit);
        paginate.setTotalPage(SetInfoTotalPage(totalData, limit));
        paginate.setCurrentPage(CheckCurrentPage(currentPage, totalData));
        int start = FindStart(paginate.getCurrentPage(), limit);
        paginate.setStart(start);
        int end = FindEnd(paginate.getStart(), limit, totalData);
        paginate.setEnd(end);
        
        return paginate;
    }
    //tinh sp ket thuc
    private int FindEnd(int start, int limit,int totalData)
    {
        return start + limit > totalData ? totalData : (start + limit);
    }
    
    //tinh sp bat dau
    private int FindStart(int currentPage, int limit)
    {
        return ((currentPage - 1)*limit);
    }
    //tinh tong so trang
    private int SetInfoTotalPage(int totalData,int limit)
    {
        int totalPage = 0;
        totalPage = totalData/limit;
        totalPage = totalPage * limit < totalData ? totalPage + 1: totalPage;
        return totalPage;
    }
    
    //check trang hien taij
    public  int CheckCurrentPage(int currentPage, int totalPage)
    {
        if (currentPage < 1) {
            return 1;
        }
        if (currentPage > totalPage) {
            return totalPage;
        }
        return currentPage;
    }
}
