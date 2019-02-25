package com.lw.sysworktaskprocessing.vo;

import java.io.Serializable;

/**
 * @ author     ：CZP.
 * @ Date       ：Created in 14:49 2019/2/23
 * @ Description：
 * @ Modified By：
 * @ Version    : $
 */
public class SysWorktaskProcessingVo implements Serializable {
    private int status;
    private int count;

    public SysWorktaskProcessingVo(int status, int count) {
        this.status = status;
        this.count = count;
    }

    public SysWorktaskProcessingVo() {
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}

