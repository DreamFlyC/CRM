package com.lw.crm.crmproduct.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmproduct.entity.CrmProduct;
import com.lw.crm.crmproduct.persistence.CrmProductMapper;
import com.lw.crm.crmproduct.service.ICrmProductService;

@Service("CrmProductServiceImpl")
@Transactional
public class CrmProductServiceImpl extends BaseServiceImpl<CrmProduct> implements ICrmProductService{
	@Autowired
	private CrmProductMapper crmProductMapper;
	
	//根据产品编号和日期查询
	public List<CrmProduct> getAll(CrmProduct obj){
		return crmProductMapper.getAll(obj);

	}

	//获取总数
	public int getCount(CrmProduct obj){
		return crmProductMapper.getCount(obj);
	}
	

	//删除所有信息
	public int delete(int[] id){
		return crmProductMapper.delete(id);
	}
	
	// 修改信息
				public CrmProduct getById(int id){
					return crmProductMapper.getById(id);
				}

				public void update(CrmProduct obj){
					crmProductMapper.update(obj);
				}
				
				//批量导出
				public List<CrmProduct> getListOut(CrmProduct obj){
					return crmProductMapper.getListOut(obj);
				}
				
}
