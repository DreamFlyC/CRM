package com.lw.crm.crmsupplier.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.crm.crmsupplier.entity.CrmSupplier;

public interface CrmSupplierMapper extends BaseMapper<CrmSupplier> {
	
	List<CrmSupplier> getIdBySupplier(@Param("supplier")String supplier);

}