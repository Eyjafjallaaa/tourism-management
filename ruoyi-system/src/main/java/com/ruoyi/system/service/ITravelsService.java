package com.ruoyi.system.service;

import com.ruoyi.system.domain.Travels;

import java.util.List;

/**
 * 游记Service接口
 * 
 * @author ...
 * @date 2022-03-13
 */
public interface ITravelsService 
{
    /**
     * 查询游记
     * 
     * @param id 游记主键
     * @return 游记
     */
    public Travels selectTravelsById(Integer id);

    /**
     * 查询游记列表
     * 
     * @param travels 游记
     * @return 游记集合
     */
    public List<Travels> selectTravelsList(Travels travels);

    /**
     * 新增游记
     * 
     * @param travels 游记
     * @return 结果
     */
    public int insertTravels(Travels travels);

    /**
     * 修改游记
     * 
     * @param travels 游记
     * @return 结果
     */
    public int updateTravels(Travels travels);

    /**
     * 批量删除游记
     * 
     * @param ids 需要删除的游记主键集合
     * @return 结果
     */
    public int deleteTravelsByIds(Integer[] ids);

    /**
     * 删除游记信息
     * 
     * @param id 游记主键
     * @return 结果
     */
    public int deleteTravelsById(Integer id);

    /**
     * 我的游记
     * @return
     */
    List<Travels> getMyTravels();

    /**
     * 热门
     * @return
     */
    List<Travels> getHot();
}
