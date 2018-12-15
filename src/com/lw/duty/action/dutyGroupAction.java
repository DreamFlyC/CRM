/**
 * 
 */
package com.lw.duty.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.lw.duty.service.IDutyGroupService;

/**
 * @author CZP
 *
 * 2018年7月31日
 */

@Controller("dutyGroupAction")
public class dutyGroupAction {
	
	@Autowired 
	private IDutyGroupService dutyGroupService;
}
