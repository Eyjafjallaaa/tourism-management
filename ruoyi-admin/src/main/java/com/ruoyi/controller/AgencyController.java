package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Agency;
import com.ruoyi.system.service.IAgencyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;
@RestController
@RequestMapping("/system/agency")
public class AgencyController extends BaseController{
    @Autowired
    private IAgencyService agencyService;

    /**
     * 查询旅游社列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Agency agency)
    {
        startPage();
        List<Agency> list = agencyService.selectAgencyList(agency);
        return getDataTable(list);
    }


    /**
     * 获取旅游社详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") int id)
    {
        Agency agency = agencyService.selectAgencyById(id);
        return AjaxResult.success(agency);
    }

    /**
     * 新增旅游社
     */
    @PostMapping
    public AjaxResult add(@RequestBody Agency agency)
    {
        agency.setCreateTime(DateUtils.getNowDate());
        return toAjax(agencyService.insertAgency(agency));
    }

    /**
     * 修改旅游社
     */
    @PutMapping("/{id}")
    public AjaxResult edit(@PathVariable("id") int id, @RequestBody Agency agency) {
        Agency existingAgency = agencyService.selectAgencyById(id);
        if (existingAgency == null) {
            return AjaxResult.error("Agency not found");
        }
        agency.setId(id);
        agency.setUpdateTime(DateUtils.getNowDate());
        return toAjax(agencyService.updateAgency(agency));
    }

    /**
     * 删除旅游社
     */
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable int[] ids)
    {
        return toAjax(agencyService.deleteAgencyByIds(ids));
    }
}
