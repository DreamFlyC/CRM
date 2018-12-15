package com.lw.crm.crmpurchacse.service.impl;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmpurchacse.entity.CrmPurchacse;
import com.lw.crm.crmpurchacse.persistence.CrmPurchacseMapper;
import com.lw.crm.crmpurchacse.service.ICrmPurchacseService;
import com.lw.crm.crmpurchacseitem.entity.CrmPurchacseItem;
import com.lw.crm.crmpurchacseitem.service.ICrmPurchacseItemService;
import com.lw.crm.crmsupplierprice.entity.CrmSupplierPrice;
import com.lw.crm.crmsupplierprice.service.ICrmSupplierPriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

@Service("CrmPurchacseServiceImpl")
@Transactional
public class CrmPurchacseServiceImpl extends BaseServiceImpl<CrmPurchacse> implements ICrmPurchacseService{
	@Autowired
	private CrmPurchacseMapper crmPurchacseMapper;

    @Autowired
    private ICrmSupplierPriceService crmSupplierPriceService;

	@Autowired
	private ICrmPurchacseItemService crmPurchacseItemServiceService;


	@Override
	public List<CrmPurchacse> getAll(CrmPurchacse obj){
		return crmPurchacseMapper.getAll(obj);
		
	}
	@Override
    public int  getCount(CrmPurchacse obj){
		return crmPurchacseMapper.getCount(obj);
	}

  	// 删除所有信息
	@Override
	public int delete(int[] id){
		return crmPurchacseMapper.delete(id);
	}


	@Transactional(rollbackFor = Exception.class)
	@Override
	public boolean saveOrder(int[] ids,int[] nums,String[] notes,String title,String number,String address ){
	    if(ids.length<=0 || nums.length<=0){
	        return false;
        }
	    int count=0;
		BigDecimal price=new BigDecimal(0);
        // 根据id查询报价单表一条记录
        for(int i=0;i<ids.length;i++){
			CrmSupplierPrice crmSupplierPrice=crmSupplierPriceService.get(ids[i]);
            CrmPurchacseItem crmPurchacseItem=new CrmPurchacseItem();
			crmPurchacseItem.setSnumber(crmSupplierPrice.getSnumber());
			crmPurchacseItem.setNum(nums[i]);
			crmPurchacseItem.setSid(String.valueOf(crmSupplierPrice.getSid()));
			crmPurchacseItem.setName(crmSupplierPrice.getName());
			crmPurchacseItem.setUid(crmSupplierPrice.getUid());
			crmPurchacseItem.setPrice(crmSupplierPrice.getPrice());
			crmPurchacseItem.setType(crmSupplierPrice.getType());
			crmPurchacseItem.setTitle(title);
			crmPurchacseItem.setNote(notes[i]);
			crmPurchacseItem.setNumber(number);
            count=crmPurchacseItemServiceService.save(crmPurchacseItem);
            price=price.add(crmPurchacseItem.getPrice());
        }
        CrmPurchacse crmPurchacse=new CrmPurchacse();
        crmPurchacse.setNumber(number);
		crmPurchacse.setTitle(title);
        crmPurchacse.setUid(crmPurchacse.getUid());
        crmPurchacse.setPrice(price);
        crmPurchacse.setNote(Arrays.toString(notes).replace("[","").replace("]","").trim());
        crmPurchacse.setAddress(address);
        crmPurchacseMapper.save(crmPurchacse);
        if(count<=0){
            return false;
        }

		return true;
	}
}
