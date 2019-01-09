package com.lw.apiproductpurch.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * api_product_purch
 * @author 
 */
public class ApiProductPurch implements Serializable {
    /**
     * ID
     */
    private Integer id;

    private String clientCustomerid;

    private String clientDb;

    private String messageid;

    private String apptoken;

    private String appkey;

    private String sign;

    private Date timestamp;

    private String data;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getClientCustomerid() {
        return clientCustomerid;
    }

    public void setClientCustomerid(String clientCustomerid) {
        this.clientCustomerid = clientCustomerid;
    }

    public String getClientDb() {
        return clientDb;
    }

    public void setClientDb(String clientDb) {
        this.clientDb = clientDb;
    }

    public String getMessageid() {
        return messageid;
    }

    public void setMessageid(String messageid) {
        this.messageid = messageid;
    }

    public String getApptoken() {
        return apptoken;
    }

    public void setApptoken(String apptoken) {
        this.apptoken = apptoken;
    }

    public String getAppkey() {
        return appkey;
    }

    public void setAppkey(String appkey) {
        this.appkey = appkey;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }
}