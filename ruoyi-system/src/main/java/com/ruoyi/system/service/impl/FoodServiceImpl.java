package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.FoodMapper;
import com.ruoyi.system.domain.Food;
import com.ruoyi.system.service.IFoodService;

/**
 * 小吃Service业务层处理
 * 
 * @author ...
 * @date 2022-03-13
 */
@Service
public class FoodServiceImpl implements IFoodService 
{
    @Autowired
    private FoodMapper foodMapper;

    /**
     * 查询小吃
     * 
     * @param id 小吃主键
     * @return 小吃
     */
    @Override
    public Food selectFoodById(Integer id)
    {
        return foodMapper.selectFoodById(id);
    }


    /**
     * 查询小吃列表
     * 
     * @param food 小吃
     * @return 小吃
     */
    @Override
    public List<Food> selectFoodList(Food food)
    {
        return foodMapper.selectFoodList(food);
    }

    /**
     * 新增小吃
     * 
     * @param food 小吃
     * @return 结果
     */@Override
    public List<Food> getAll(){
         return foodMapper.getAll();
    }
    @Override
    public int insertFood(Food food)
    {
        food.setCreateTime(DateUtils.getNowDate());
        return foodMapper.insertFood(food);
    }

    /**
     * 修改小吃
     * 
     * @param food 小吃
     * @return 结果
     */
    @Override
    public int updateFood(Food food)
    {
        food.setUpdateTime(DateUtils.getNowDate());
        return foodMapper.updateFood(food);
    }

    /**
     * 批量删除小吃
     * 
     * @param ids 需要删除的小吃主键
     * @return 结果
     */
    @Override
    public int deleteFoodByIds(Integer[] ids)
    {
        return foodMapper.deleteFoodByIds(ids);
    }

    /**
     * 删除小吃信息
     * 
     * @param id 小吃主键
     * @return 结果
     */
    @Override
    public int deleteFoodById(Integer id)
    {
        return foodMapper.deleteFoodById(id);
    }
}
