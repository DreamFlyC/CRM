package com.lw.sysworktaskprocessing.persistence;

import com.lw.core.base.persistence.BaseMapper;
import com.lw.sysworktaskprocessing.entity.SysWorktaskProcessing;
import com.lw.sysworktaskprocessing.vo.SysWorktaskProcessingVo;

import java.util.List;
import java.util.Map;

public interface SysWorktaskProcessingMapper extends BaseMapper<SysWorktaskProcessing> {
    List<SysWorktaskProcessingVo> getTongji(Map<String, Object> map);
}