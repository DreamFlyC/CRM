package com.lw.sysworktaskprocessing.service.impl;

import com.lw.sysworktaskprocessing.entity.SysWorktaskProcessing;
import com.lw.sysworktaskprocessing.persistence.SysWorktaskProcessingMapper;
import com.lw.sysworktaskprocessing.service.ISysWorktaskProcessingService;
import com.lw.core.base.service.impl.BaseServiceImpl;

import com.lw.sysworktaskprocessing.vo.SysWorktaskProcessingVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @ author     ：
 * @ Date       ：
 * @ Description：
 * @ Modified By：
 * @ Version    :
 */

@Service("SysWorktaskProcessingServiceImpl")
public class SysWorktaskProcessingServiceImpl extends BaseServiceImpl<SysWorktaskProcessing> implements ISysWorktaskProcessingService {

    @Autowired
    private SysWorktaskProcessingMapper sysWorktaskProcessingMapper;


    @Override
    public List<SysWorktaskProcessingVo> getTongji(Map<String, Object> map) {
        return sysWorktaskProcessingMapper.getTongji(map);
    }
}