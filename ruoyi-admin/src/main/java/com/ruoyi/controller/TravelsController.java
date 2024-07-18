package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Travels;
import com.ruoyi.system.service.ITravelsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 游记Controller
 * 
 * @author ...
 * @date 2022-03-13
 */
@RestController
@RequestMapping("/system/travels")
public class TravelsController extends BaseController
{
    @Autowired
    private ITravelsService travelsService;

    /**
     * 查询游记列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Travels travels)
    {
        startPage();
        List<Travels> list = travelsService.selectTravelsList(travels);
        return getDataTable(list);
    }

    @GetMapping("/hot")
    public AjaxResult hotList(){
        List<Travels> hot = travelsService.getHot();
        return AjaxResult.success(hot);
    }

    /**
     * 获取游记详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(travelsService.selectTravelsById(id));
    }

    /**
     * 新增游记
     */
    @PostMapping
    public AjaxResult add(@RequestBody Travels travels)
    {
        travels.setGoodNum(0);
        travels.setCreateTime(DateUtils.getNowDate());
        travels.setCreateUser(SecurityUtils.getUserId().intValue());
        return toAjax(travelsService.insertTravels(travels));
    }

    /**
     * 我的游记
     * @return
     */
    @GetMapping("/my")
    public AjaxResult getMyTravels(){
        return AjaxResult.success(travelsService.getMyTravels());
    }
    /**
     * 修改游记
     */
    @PutMapping
    public AjaxResult edit(@RequestBody Travels travels)
    {
        travels.setUpdateTime(DateUtils.getNowDate());
        travels.setUpdateUser(SecurityUtils.getUserId().intValue());
        return toAjax(travelsService.updateTravels(travels));
    }

    /**
     * 删除游记
     */
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {

        return toAjax(travelsService.deleteTravelsByIds(ids));
    }
}
