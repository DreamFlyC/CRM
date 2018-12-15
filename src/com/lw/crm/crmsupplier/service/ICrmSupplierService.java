package com.lw.crm.crmsupplier.service;

import com.lw.core.base.service.IBaseService;
import com.lw.crm.crmsupplier.entity.CrmSupplier;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICrmSupplierService extends IBaseService<CrmSupplier>{

	/**
	 * @Desc 
	 * @param supplier
	 * @return
	 * @author CZP
	 */

	List<CrmSupplier> getIdBySupplier(@Param("supplier")String supplier);

}
