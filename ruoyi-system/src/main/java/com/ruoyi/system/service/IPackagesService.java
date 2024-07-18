package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Packages;

/**
 * 旅游套餐Service接口
 * 
 * @author ...
 * @date 2022-03-13
 */
public interface IPackagesService 
{
    /**
     * 查询旅游套餐
     * 
     * @param id 旅游套餐主键
     * @return 旅游套餐
     */
    public Packages selectPackagesById(Integer id);

    /**
     * 查询旅游套餐列表
     * 
     * @param packages 旅游套餐
     * @return 旅游套餐集合
     */
    public List<Packages> selectPackagesList(Packages packages);

    /**
     * 新增旅游套餐
     * 
     * @param packages 旅游套餐
     * @return 结果
     */
    public int insertPackages(Packages packages);

    /**
     * 修改旅游套餐
     * 
     * @param packages 旅游套餐
     * @return 结果
     */
    public int updatePackages(Packages packages);

    /**
     * 批量删除旅游套餐
     * 
     * @param ids 需要删除的旅游套餐主键集合
     * @return 结果
     */
    public int deletePackagesByIds(Integer[] ids);

    /**
     * 删除旅游套餐信息
     * 
     * @param id 旅游套餐主键
     * @return 结果
     */
    public int deletePackagesById(Integer id);
}
