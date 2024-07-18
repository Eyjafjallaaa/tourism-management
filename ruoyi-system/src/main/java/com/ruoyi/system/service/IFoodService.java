package com.ruoyi.system.service;

import com.ruoyi.system.domain.Food;

import java.util.List;

/**
 * 小吃Service接口
 * 
 * @author ...
 * @date 2022-03-13
 */
public interface    IFoodService
{
    /**
     * 查询小吃
     * 
     * @param id 小吃主键
     * @return 小吃
     */
    public Food selectFoodById(Integer id);

    /**
     * 查询小吃列表
     * 
     * @param food 小吃
     * @return 小吃集合
     */
    public List<Food> selectFoodList(Food food);

    /**
     * 新增小吃
     * 
     * @param food 小吃
     * @return 结果
     */
    public List<Food>getAll();
    public int insertFood(Food food);

    /**
     * 修改小吃
     * 
     * @param food 小吃
     * @return 结果
     */
    public int updateFood(Food food);

    /**
     * 批量删除小吃
     * 
     * @param ids 需要删除的小吃主键集合
     * @return 结果
     */
    public int deleteFoodByIds(Integer[] ids);

    /**
     * 删除小吃信息
     * 
     * @param id 小吃主键
     * @return 结果
     */
    public int deleteFoodById(Integer id);
}
