package com.lw.traceabilityunit.entity;

import java.io.Serializable;

/**
 * traceability_unit
 * @author 
 */
public class TraceabilityUnit implements Serializable {
    private int id;

    /**
     * 名称
     */
    private String name;

    /**
     * 排序
     */
    private int seq;

    /**
     * 类型
     */
    private int type;

    private static final long serialVersionUID = 1L;

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

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}