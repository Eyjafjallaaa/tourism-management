package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Restaurant;

import java.util.List;

/**
 * 景点Mapper接口
 *
 * @author ...
 * @date 2022-03-13
 */
public interface    RestaurantMapper
{
    /**
     * 查询景点
     *
     * @param id 景点主键
     * @return 景点
     */
    public Restaurant selectRestaurantById(Integer id);

    /**
     * 查询景点列表
     *
     * @param Restaurant 景点
     * @return 景点集合
     */
    public List<Restaurant> selectRestaurantList(Restaurant Restaurant);

    /**
     * 新增景点
     *
     * @param Restaurant 景点
     * @return 结果
     */
    public int insertRestaurant(Restaurant Restaurant);

    /**
     * 修改景点
     *
     * @param Restaurant 景点
     * @return 结果
     */
    public int updateRestaurant(Restaurant Restaurant);

    /**
     * 删除景点
     *
     * @param id 景点主键
     * @return 结果
     */
    public int deleteRestaurantById(Integer id);

    /**
     * 批量删除景点
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRestaurantByIds(Integer[] ids);

    /**
     * 查询所有景点
     * @return
     */
    List<Restaurant> getAll();
}
