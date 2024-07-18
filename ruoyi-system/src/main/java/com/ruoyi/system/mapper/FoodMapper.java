package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Food;

/**
 * 小吃Mapper接口
 * 
 * @author ...
 * @date 2022-03-13
 */
public interface FoodMapper 
{
    /**
     * 查询小吃
     * 
     * @param id 小吃主键
     * @return 小吃
     */
    public Food selectFoodById(Integer id);
    public List<Food> getAll();
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
    public int insertFood(Food food);

    /**
     * 修改小吃packages
     * 
     * @param food 小吃
     * @return 结果
     */
    public int updateFood(Food food);

    /**
     * 删除小吃
     * 
     * @param id 小吃主键
     * @return 结果
     */
    public int deleteFoodById(Integer id);

    /**
     * 批量删除小吃
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFoodByIds(Integer[] ids);}


