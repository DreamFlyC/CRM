package com.lw.crm.crmpurchacseitem.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.lw.common.util.ResponseUtil;
import com.lw.core.base.service.impl.BaseServiceImpl;
import com.lw.crm.crmpurchacse.entity.CrmPurchacse;
import com.lw.crm.crmpurchacse.service.ICrmPurchacseService;
import com.lw.crm.crmpurchacseitem.entity.CrmPurchacseItem;
import com.lw.crm.crmpurchacseitem.persistence.CrmPurchacseItemMapper;
import com.lw.crm.crmpurchacseitem.service.ICrmPurchacseItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.List;

/**
 * @author 作者:qw
 * @createDate 创建时间：2018年12月6日 上午10:34:49
 */
@Service("CrmPurchacseItemServiceImpl")
@Transactional(rollbackFor = Exception.class)
public class CrmPurchacseItemServiceImpl extends BaseServiceImpl<CrmPurchacseItem> implements ICrmPurchacseItemService {

    @Autowired
    private CrmPurchacseItemMapper crmPurchacseItemMapper;

    @Autowired
    private ICrmPurchacseService crmPurchacseService;

    @Override
    public String saveAll(String data, String crmPurchacse, HttpServletResponse response) {
        if (data != null && crmPurchacse != null) {
            List<CrmPurchacseItem> crmPurchacseItemList = JSON.parseArray(data, CrmPurchacseItem.class);

            int result=0;
            BigDecimal price=new BigDecimal(0);
            JSONObject json=new JSONObject();
            for(int i=0;i<crmPurchacseItemList.size();i++){
                price=price.add(crmPurchacseItemList.get(i).getPrice());
                result=crmPurchacseItemMapper.save(crmPurchacseItemList.get(i));
            }
            CrmPurchacse obj=JSON.parseObject(crmPurchacse,new TypeReference<CrmPurchacse>() {});
            obj.setPrice(price);
            crmPurchacseService.save(obj);
            if (result>0) {
                json.put("code", 200);
                json.put("msg", "保存成功");
                ResponseUtil.writeJson(response, json.toJSONString());
            } else {
                json.put("code", 404);
                json.put("msg", "保存失败");
                ResponseUtil.writeJson(response, json.toJSONString());
            }
        }
        return null;
    }
}
