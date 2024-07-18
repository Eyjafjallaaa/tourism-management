package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.PackagesMapper;
import com.ruoyi.system.domain.Packages;
import com.ruoyi.system.service.IPackagesService;

/**
 * 旅游套餐Service业务层处理
 * 
 * @author ...
 * @date 2022-03-13
 */
@Service
public class PackagesServiceImpl implements IPackagesService 
{
    @Autowired
    private PackagesMapper packagesMapper;

    /**
     * 查询旅游套餐
     * 
     * @param id 旅游套餐主键
     * @return 旅游套餐
     */
    @Override
    public Packages selectPackagesById(Integer id)
    {
        return packagesMapper.selectPackagesById(id);
    }

    /**
     * 查询旅游套餐列表
     * 
     * @param packages 旅游套餐
     * @return 旅游套餐
     */
    @Override
    public List<Packages> selectPackagesList(Packages packages)
    {
        return packagesMapper.selectPackagesList(packages);
    }

    /**
     * 新增旅游套餐
     * 
     * @param packages 旅游套餐
     * @return 结果
     */
    @Override
    public int insertPackages(Packages packages)
    {
        packages.setCreateTime(DateUtils.getNowDate());
        return packagesMapper.insertPackages(packages);
    }

    /**
     * 修改旅游套餐
     * 
     * @param packages 旅游套餐
     * @return 结果
     */
    @Override
    public int updatePackages(Packages packages)
    {
        packages.setUpdateTime(DateUtils.getNowDate());
        return packagesMapper.updatePackages(packages);
    }

    /**
     * 批量删除旅游套餐
     * 
     * @param ids 需要删除的旅游套餐主键
     * @return 结果
     */
    @Override
    public int deletePackagesByIds(Integer[] ids)
    {
        return packagesMapper.deletePackagesByIds(ids);
    }

    /**
     * 删除旅游套餐信息
     * 
     * @param id 旅游套餐主键
     * @return 结果
     */
    @Override
    public int deletePackagesById(Integer id)
    {
        return packagesMapper.deletePackagesById(id);
    }
}
