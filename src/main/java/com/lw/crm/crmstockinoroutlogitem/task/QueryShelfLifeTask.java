package com.lw.crm.crmstockinoroutlogitem.task;

import com.lw.crm.crmstockinoroutlogitem.entity.CrmStockInorOutLogItem;
import com.lw.crm.crmstockinoroutlogitem.service.ICrmStockInorOutLogItemService;
import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

/**
 * @ author     ：CZP.
 * @ Date       ：Created in 9:50 2019/2/13
 * @ Description：查询状态
 * @ Modified By：
 * @ Version    : $
 */
@Component
public class QueryShelfLifeTask {

    private static final Logger log = LoggerFactory.getLogger(QueryShelfLifeTask.class);

    @Autowired
    private ICrmStockInorOutLogItemService crmStockInorOutLogItemService;

//    @Scheduled(cron = "0/1 * * * * ? ")
    public void setStatus() {
        final int overdue = 7;
        List<CrmStockInorOutLogItem> crmStockInorOutLogItemList = crmStockInorOutLogItemService.getList();
        if (crmStockInorOutLogItemList.size() > 0) {
            for (CrmStockInorOutLogItem crmStockInorOutLogItem : crmStockInorOutLogItemList) {
                //查询每条数据的生产日期和保质期
                Date overTime = DateUtils.addDays(crmStockInorOutLogItem.getProductTime(), crmStockInorOutLogItem.getShelfLife());
                //获取剩余时间
                long time = overTime.getTime() - System.currentTimeMillis();
                if (time <= 0) {
                    if (crmStockInorOutLogItem.getStatus() != 2) {
                        log.info("商品已过期：{}，time:{}", crmStockInorOutLogItem.getTitle(), time);
                        CrmStockInorOutLogItem item = new CrmStockInorOutLogItem();
                        item.setId(crmStockInorOutLogItem.getId());
                        item.setStatus(2);
                        crmStockInorOutLogItemService.edit(item);
                        log.info("修改状态成功");
                    } else {
                        log.info("未发生变化，商品：{}，time:{}", crmStockInorOutLogItem.getTitle(), time);
                    }
                } else if (time < overdue * 24 * 60 * 60 * 1000) {
                    //即将过期(小于7天)
                    if (crmStockInorOutLogItem.getStatus() != 1) {
                        log.info("商品即将过期：{}，time:{}", crmStockInorOutLogItem.getTitle(), time);
                        CrmStockInorOutLogItem item = new CrmStockInorOutLogItem();
                        item.setId(crmStockInorOutLogItem.getId());
                        item.setStatus(1);
                        crmStockInorOutLogItemService.edit(item);
                        log.info("修改状态成功");
                    } else {
                        log.info("未发生变化，商品：{}，time:{}", crmStockInorOutLogItem.getTitle(), time);
                    }
                } else {
                    //正常
                    if (crmStockInorOutLogItem.getStatus() != 0) {
                        log.info("商品状态正常：{}，time:{}", crmStockInorOutLogItem.getTitle(), time);
                        CrmStockInorOutLogItem item = new CrmStockInorOutLogItem();
                        item.setId(crmStockInorOutLogItem.getId());
                        item.setStatus(0);
                        crmStockInorOutLogItemService.edit(item);
                        log.info("修改状态成功");
                    } else {
                        log.info("未发生变化，商品：{}，time:{}", crmStockInorOutLogItem.getTitle(), time);
                    }
                }
            }
            log.info("--------------------------------");
        }
        log.info("crmStockInorOutLogItemList为空");
    }

}
