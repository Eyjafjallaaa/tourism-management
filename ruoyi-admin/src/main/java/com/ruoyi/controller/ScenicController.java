package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Scenic;
import com.ruoyi.system.service.IScenicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 景点Controller
 * 
 * @author ...
 * @date 2022-03-13
 */
@RestController
@RequestMapping("/system/scenic")
public class ScenicController extends BaseController
{
    @Autowired
    private IScenicService scenicService;

    /**
     * 查询景点列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Scenic scenic)
    {
        startPage();
        List<Scenic> list = scenicService.selectScenicList(scenic);
        return getDataTable(list);
    }

    /**
     *
     * @return
     */
    @GetMapping("/all")
    public List<Scenic> getAll(){
        return scenicService.getAll();
    }

    /**
     * 获取景点详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(scenicService.selectScenicById(id));
    }

    /**
     * 新增景点
     */
    @PostMapping
    public AjaxResult add(@RequestBody Scenic scenic)
    {
        scenic.setCreateTime(DateUtils.getNowDate());
        scenic.setCreateUser(SecurityUtils.getUserId().intValue());
        return toAjax(scenicService.insertScenic(scenic));
    }

    /**
     * 修改景点
     */
    @PutMapping
    public AjaxResult edit(@RequestBody Scenic scenic)
    {
        scenic.setUpdateTime(DateUtils.getNowDate());
        scenic.setUpdateUser(SecurityUtils.getUserId().intValue());
        return toAjax(scenicService.updateScenic(scenic));
    }

    /**
     * 删除景点
     */
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(scenicService.deleteScenicByIds(ids));
    }
}
