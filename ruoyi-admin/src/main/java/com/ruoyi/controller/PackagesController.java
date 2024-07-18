package com.ruoyi.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Packages;
import com.ruoyi.system.domain.Scenic;
import com.ruoyi.system.service.IPackagesService;
import com.ruoyi.system.service.IScenicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 旅游套餐Controller
 * 
 * @author ...
 * @date 2022-03-13
 */
@RestController
@RequestMapping("/system/packages")
public class PackagesController extends BaseController
{
    @Autowired
    private IPackagesService packagesService;
    @Autowired
    private IScenicService scenicService;
    /**
     * 查询旅游套餐列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Packages packages)
    {
        startPage();
        List<Packages> list = packagesService.selectPackagesList(packages);
        return getDataTable(list);
    }

    /**
     * 获取旅游套餐详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(packagesService.selectPackagesById(id));
    }

    /**
     * 新增旅游套餐
     */
    @PostMapping
    public AjaxResult add(@RequestBody Packages packages)
    {
        packages.setCreateTime(DateUtils.getNowDate());
        packages.setCreateUser(SecurityUtils.getUserId().intValue());
        String[] split = packages.getSid().split(",");
        String name= "";
        for (String s : split) {
            Scenic scenic = scenicService.selectScenicById(Integer.parseInt(s));
            name=name+scenic.getName()+"、";
        }
        packages.setSname(name);
        return toAjax(packagesService.insertPackages(packages));
    }

    /**
     * 修改旅游套餐
     */
    @PutMapping
    public AjaxResult edit(@RequestBody Packages packages)
    {
        packages.setCreateTime(DateUtils.getNowDate());
        packages.setCreateUser(SecurityUtils.getUserId().intValue());
        return toAjax(packagesService.updatePackages(packages));
    }

    /**
     * 删除旅游套餐
     */
    @Log(title = "旅游套餐", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(packagesService.deletePackagesByIds(ids));
    }
}
