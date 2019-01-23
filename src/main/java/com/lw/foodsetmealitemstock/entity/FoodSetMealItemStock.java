package com.lw.foodsetmealitemstock.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * food_set_meal_item_stock
 * @author CZP
 */
public class FoodSetMealItemStock implements Serializable {
    private int id;

    /**
     * 录入日期时间
     */
    private Date adddate;

    /**
     * 修改日期时间
     */
    private Date editdate;

    /**
     * 配方明细ID
     */
    private int foodSetMealItemId;

    /**
     * 库存ID
     */
    private int stockId;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getAdddate() {
        return adddate;
    }

    public void setAdddate(Date adddate) {
        this.adddate = adddate;
    }

    public Date getEditdate() {
        return editdate;
    }

    public void setEditdate(Date editdate) {
        this.editdate = editdate;
    }

    public int getFoodSetMealItemId() {
        return foodSetMealItemId;
    }

    public void setFoodSetMealItemId(int foodSetMealItemId) {
        this.foodSetMealItemId = foodSetMealItemId;
    }

    public int getStockId() {
        return stockId;
    }

    public void setStockId(int stockId) {
        this.stockId = stockId;
    }
}