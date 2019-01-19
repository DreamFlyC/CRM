package com.lw.memberdoorauthoritylog.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * member_door_authority_log
 * @author 
 */
public class MemberDoorAuthorityLog implements Serializable {
    private int id;

    private int memberId;

    private int doorId;

    /**
     * 类型
     */
    private int type;

    /**
     * 登录时间
     */
    private Date loginTime;

    /**
     * 添加时间
     */
    private Date addTime;

    /**
     * 状态
     */
    private int status;

    private static final long serialVersionUID = 1L;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public int getDoorId() {
        return doorId;
    }

    public void setDoorId(int doorId) {
        this.doorId = doorId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}