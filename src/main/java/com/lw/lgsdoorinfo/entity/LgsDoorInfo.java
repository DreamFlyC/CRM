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

    private String doorNo;

    private String remark;

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

    public String getDoorNo() {
        return doorNo;
    }

    public void setDoorNo(String doorNo) {
        this.doorNo = doorNo;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}