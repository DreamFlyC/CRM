package com.lw.acommon.util;

import java.io.Serializable;

/**
 * JSON 数据模型
 *
 * @pa 请求是否成功
 * @msg 请求提示信息
 * @obj 请求结果数据
 */
@SuppressWarnings("serial")
public class JsonMsgStatusEntity implements Serializable {

    private boolean status;
    private String msg;
    private Object obj;

    public JsonMsgStatusEntity() {
        super();
    }

    public JsonMsgStatusEntity(boolean status, String msg, Object obj) {
        super();
        this.status = status;
        this.msg = msg;
        this.obj = obj;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }

}
