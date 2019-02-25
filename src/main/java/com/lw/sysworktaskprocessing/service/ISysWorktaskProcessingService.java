package com.lw.sysworktaskprocessing.service;

import com.lw.core.base.service.IBaseService;
import com.lw.sysworktaskprocessing.entity.SysWorktaskProcessing;
import com.lw.sysworktaskprocessing.vo.SysWorktaskProcessingVo;

import java.util.List;
import java.util.Map;

/**
 * @ Author     ：
 * @ Date       ：
 * @ Description：
 * @ Modified By：
 * @ Version    :
 */
public interface ISysWorktaskProcessingService extends IBaseService<SysWorktaskProcessing> {
    List<SysWorktaskProcessingVo> getTongji(Map<String, Object> map);
}



