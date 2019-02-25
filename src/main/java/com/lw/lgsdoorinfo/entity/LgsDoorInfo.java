package com.lw.lgsdoorinfo.entity;

import java.io.Serializable;

/**
 * lgs_door_info
 *
 * @author
 */
public class LgsDoorInfo implements Serializable {
    private int id;

    private String name;

    private int doorNo;

    private String remark;

    private int sq;

    public int getSq() {
        return sq;
    }

    public void setSq(int sq) {
        this.sq = sq;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDoorNo() {
        return doorNo;
    }

    public void setDoorNo(int doorNo) {
        this.doorNo = doorNo;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}