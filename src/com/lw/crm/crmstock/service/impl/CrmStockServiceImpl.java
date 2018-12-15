package com.lw.crm.crmstock.service.impl;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmstock.entity.CrmStock;
import com.lw.crm.crmstock.persistence.CrmStockMapper;
import com.lw.crm.crmstock.service.ICrmStockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service("CrmStockServiceImpl")
public class CrmStockServiceImpl extends BaseServiceImpl<CrmStock> implements ICrmStockService{
	@Autowired
	private CrmStockMapper crmStockMapper;
	// 删除所有信息

	@Transactional(rollbackFor = {Exception.class})
	@Override
    public int delete(int[]  id){
			return crmStockMapper.delete(id);
		}

    @Override
    public int getCount(int id) {
			return crmStockMapper.getCount(id);
		}

    @Override
    public int getStockBySidAndSnumber(Map param) {
			return crmStockMapper.getStockBySidAndSnumber(param);
		}
		
	/*
	 * create by: CZP
	 * description:统计功能
	 * create time: 10:04 2018/11/22
	  * @Param: null
	 * @return 
	 */	
    @Override
    public List<CrmStock> getStatisticsByType(Map map) {
        return crmStockMapper.getStatisticsByType(map);
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
	public int test(){
    	CrmStock crmStock=new CrmStock();
    	crmStock.setSnumber("1111");
		crmStock.setTitle("test");
		crmStock.setPrice(6.56);
    	crmStock.setType(1);
		crmStock.setUid(1);
		crmStock.setStocknum("22");
    	crmStockMapper.save(crmStock);
    	int i=1/0;
		crmStockMapper.editById(crmStock);
		return i;
	}
}
