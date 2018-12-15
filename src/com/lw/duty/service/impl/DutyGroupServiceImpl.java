/**
 * 
 */
package com.lw.duty.service.impl;

import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.duty.entity.DutyGroup;
import com.lw.duty.service.IDutyGroupService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author CZP
 *
 * 2018年7月31日
 */

@Service("DutyGroupServiceImpl")
@Transactional
public class DutyGroupServiceImpl extends BaseServiceImpl<DutyGroup> implements IDutyGroupService{

}
