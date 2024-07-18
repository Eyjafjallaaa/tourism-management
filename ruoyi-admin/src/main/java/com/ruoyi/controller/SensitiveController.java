package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.domain.Sensitive;
import com.ruoyi.system.service.ISensitiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 敏感词Controller
 * 
 * @author ...
 * @date 2022-05-22
 */
@RestController
@RequestMapping("/system/sensitive")
public class SensitiveController extends BaseController
{
    @Autowired
    private ISensitiveService sensitiveService;

    /**
     * 查询敏感词列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Sensitive sensitive)
    {
        startPage();
        List<Sensitive> list = sensitiveService.selectSensitiveList(sensitive);
        return getDataTable(list);
    }
    /**
     * 获取敏感词详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(sensitiveService.selectSensitiveById(id));
    }

    /**
     * 新增敏感词
     */
    @PostMapping
    public AjaxResult add(@RequestBody Sensitive sensitive)
    {
        return toAjax(sensitiveService.insertSensitive(sensitive));
    }

    /**
     * 修改敏感词
     */
    @PutMapping
    public AjaxResult edit(@RequestBody Sensitive sensitive)
    {
        return toAjax(sensitiveService.updateSensitive(sensitive));
    }

    /**
     * 删除敏感词
     */
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(sensitiveService.deleteSensitiveByIds(ids));
    }
}
