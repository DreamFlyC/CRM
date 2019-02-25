package com.lw.wxkf.entity;

import java.io.Serializable;
import java.util.Date;

public class Wxkf implements Serializable {
    private int id;
    private String kfaccount;
    private String kfheadimgurl;
    private String kfid;
    private String kfnick;
    private String kfwx;
    private String nvitewx;
    private Date inviteexpiretime;
    private String invitestatus;
    private Date adddatetime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKfaccount() {
        return kfaccount;
    }

    public void setKfaccount(String kfaccount) {
        this.kfaccount = kfaccount;
    }

    public String getKfheadimgurl() {
        return kfheadimgurl;
    }

    public void setKfheadimgurl(String kfheadimgurl) {
        this.kfheadimgurl = kfheadimgurl;
    }

    public String getKfid() {
        return kfid;
    }

    public void setKfid(String kfid) {
        this.kfid = kfid;
    }

    public String getKfnick() {
        return kfnick;
    }

    public void setKfnick(String kfnick) {
        this.kfnick = kfnick;
    }

    public String getKfwx() {
        return kfwx;
    }

    public void setKfwx(String kfwx) {
        this.kfwx = kfwx;
    }

    public String getNvitewx() {
        return nvitewx;
    }

    public void setNvitewx(String nvitewx) {
        this.nvitewx = nvitewx;
    }

    public Date getInviteexpiretime() {
        return inviteexpiretime;
    }

    public void setInviteexpiretime(Date inviteexpiretime) {
        this.inviteexpiretime = inviteexpiretime;
    }

    public String getInvitestatus() {
        return invitestatus;
    }

    public void setInvitestatus(String invitestatus) {
        this.invitestatus = invitestatus;
    }

    public Date getAdddatetime() {
        return adddatetime;
    }

    public void setAdddatetime(Date adddatetime) {
        this.adddatetime = adddatetime;
    }
}