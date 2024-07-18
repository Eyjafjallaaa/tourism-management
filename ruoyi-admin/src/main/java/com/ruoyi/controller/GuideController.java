package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Guide;
import com.ruoyi.system.service.IGuideService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 导游员Controller
 *
 * @author ...
 * @date 2022-03-13
 */
@RestController
@RequestMapping("/system/guide")
public class GuideController extends BaseController {
    @Autowired
    private IGuideService guideService;

    /**
     * 查询导游员列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Guide guide) {
        startPage();
        List<Guide> list = guideService.selectGuideList(guide);
        return getDataTable(list);
    }

    /**
     * 获取所有导游员信息
     */
    @GetMapping("/all")
    public List<Guide> getAll() {
        return guideService.getAll();
    }

    /**
     * 根据ID获取导游员详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id) {
        return AjaxResult.success(guideService.selectGuideById(id));
    }

    /**
     * 新增导游员
     */
    @PostMapping
    public AjaxResult add(@RequestBody Guide guide) {
        guide.setCreateTime(DateUtils.getNowDate());
        return toAjax(guideService.insertGuide(guide));
    }

    /**
     * 修改导游员信息
     */
    @PutMapping
    public AjaxResult edit(@RequestBody Guide guide) {
        guide.setUpdateTime(DateUtils.getNowDate());
        return toAjax(guideService.updateGuide(guide));
    }

    /**
     * 批量删除导游员
     */
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable int[] ids) {
        return toAjax(guideService.deleteGuideByIds(ids));
    }
}