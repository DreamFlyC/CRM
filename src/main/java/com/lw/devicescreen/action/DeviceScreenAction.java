package com.lw.devicescreen.action;

import com.lw.acommon.util.Upload;
import com.lw.common.page.Pager;
import com.lw.core.base.action.BaseAction;
import com.lw.devicescreen.entity.DeviceScreen;
import com.lw.devicescreen.service.IDeviceScreenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @ author     ：
 * @ Date       ：
 * @ Description：
 * @ Modified By：
 * @ Version    :
 */
@Controller
@RequestMapping(value = "/manage/devicescreen")
public class DeviceScreenAction extends BaseAction {
    @Autowired
    private IDeviceScreenService deviceScreenService;

    @RequestMapping("")
    public String list() {
        instantPage(20);
        List<DeviceScreen> list = deviceScreenService.getList();
        int total = deviceScreenService.getCount();
        Pager pager = new Pager(super.getPage(), super.getRows(), total);
        pager.setDatas(list);
        getRequest().setAttribute("pager", pager);
        return "/WEB-INF/devicescreen/devicescreen_list";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String addDeviceScreen() {
        return "/WEB-INF/devicescreen/devicescreen_add";
    }

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String addDeviceScreen(DeviceScreen devicescreen, @RequestParam(value = "img", required = false) MultipartFile img, HttpServletRequest request) throws Exception {
        String imgurl = Upload.upload(request, img, null);
        devicescreen.setImgurl(imgurl);
        deviceScreenService.save(devicescreen);
        return "redirect:/manage/devicescreen";
    }

    @RequestMapping(value = "/del/{id}")
    public String deleteDeviceScreen(@PathVariable("id") int id) {
        deviceScreenService.del(id);
        return "redirect:/manage/devicescreen";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String updateDeviceScreen(HttpServletRequest request, DeviceScreen deviceScreen, @RequestParam(value = "img", required = false) MultipartFile img) {
        if (img != null) {
            try {
                deviceScreen.setImgurl(Upload.upload(request, img, null));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        deviceScreenService.edit(deviceScreen);
        return "redirect:/manage/devicescreen";
    }

    @RequestMapping(value = "/{id}")
    public String viewDeviceScreen(@PathVariable("id") int id) {
        DeviceScreen deviceScreen = deviceScreenService.get(id);
        getRequest().setAttribute("deviceScreen", deviceScreen);
        return "/WEB-INF/devicescreen/devicescreen_detail";
    }
}

