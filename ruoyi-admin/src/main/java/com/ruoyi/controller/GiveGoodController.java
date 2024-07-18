package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.GiveGood;
import com.ruoyi.system.domain.Travels;
import com.ruoyi.system.service.IGiveGoodService;
import com.ruoyi.system.service.ITravelsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 点赞Controller
 *
 * @author ...
 * @date 2022-03-27
 */
@RestController
@RequestMapping("/system/good")
public class GiveGoodController extends BaseController {
    @Autowired
    private IGiveGoodService giveGoodService;
    @Autowired
    private ITravelsService travelsService;
    /**
     * 查询点赞列表
     */
    @GetMapping("/list")
    public TableDataInfo list(GiveGood giveGood) {
        startPage();
        List<GiveGood> list = giveGoodService.selectGiveGoodList(giveGood);
        return getDataTable(list);
    }

    /**
     * 获取点赞详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id) {
        return AjaxResult.success(giveGoodService.selectGiveGoodById(id));
    }

    /**
     * 新增点赞
     */
    @PostMapping
    public AjaxResult add(@RequestBody GiveGood giveGood) {
        Travels travels = travelsService.selectTravelsById(giveGood.getTid());
        Integer goodNum = travels.getGoodNum();
        goodNum = goodNum+1;
        travels.setGoodNum(goodNum);
        travelsService.updateTravels(travels);
        giveGood.setUserName(SecurityUtils.getLoginUser().getUser().getNickName());
        giveGood.setCreateUser(SecurityUtils.getUserId().intValue());
        return toAjax(giveGoodService.insertGiveGood(giveGood));
    }

    /**
     * 取消点赞
     * @param giveGood
     * @return
     */
    @PostMapping("/cancel")
    public AjaxResult cancel(@RequestBody GiveGood giveGood){
        Travels travels = travelsService.selectTravelsById(giveGood.getTid());
        Integer goodNum = travels.getGoodNum();
        goodNum = goodNum-1;
        travels.setGoodNum(goodNum);
        travelsService.updateTravels(travels);

        giveGood.setCreateUser(SecurityUtils.getUserId().intValue());
        List<GiveGood> list = giveGoodService.selectGiveGoodList(giveGood);
        GiveGood giveGood1 = list.get(0);
        return toAjax(giveGoodService.deleteGiveGoodById(giveGood1.getId()));
    }

    /**
     * 获取点赞没有
     * @param giveGood
     * @return
     */
    @GetMapping("/get")
    public AjaxResult get(GiveGood giveGood){
        giveGood.setCreateUser(SecurityUtils.getUserId().intValue());
        List<GiveGood> list = giveGoodService.selectGiveGoodList(giveGood);
        return AjaxResult.success(list.size());
    }

    /**
     * 修改点赞
     */
    @PutMapping
    public AjaxResult edit(@RequestBody GiveGood giveGood) {
        return toAjax(giveGoodService.updateGiveGood(giveGood));
    }

    /**
     * 删除点赞
     */
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids) {
        return toAjax(giveGoodService.deleteGiveGoodByIds(ids));
    }
}
