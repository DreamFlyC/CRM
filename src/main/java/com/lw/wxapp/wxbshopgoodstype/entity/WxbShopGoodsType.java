package com.lw.wxapp.wxbshopgoodstype.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * wxb_shop_goods_type
 * @author 
 */
public class WxbShopGoodsType implements Serializable {
    private int id;

    private int memberMiniappId;

    private int goodsId;

    /**
     * 分类名称
     */
    private String typeName;

    /**
     * 库存
     */
    private int surplusNum;

    /**
     * 价格
     */
    private int price;

    /**
     * 删除
     */
    private boolean isDelete;

    private Date addTime;

    private String addIp;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMemberMiniappId() {
        return memberMiniappId;
    }

    public void setMemberMiniappId(int memberMiniappId) {
        this.memberMiniappId = memberMiniappId;
    }

    public int getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(int goodsId) {
        this.goodsId = goodsId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public int getSurplusNum() {
        return surplusNum;
    }

    public void setSurplusNum(int surplusNum) {
        this.surplusNum = surplusNum;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(boolean isDelete) {
        this.isDelete = isDelete;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getAddIp() {
        return addIp;
    }

    public void setAddIp(String addIp) {
        this.addIp = addIp;
    }
}