package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Travels;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 游记Mapper接口
 * 
 * @author ...
 * @date 2022-03-13
 */
public interface TravelsMapper 
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
     * 删除游记
     * 
     * @param id 游记主键
     * @return 结果
     */
    public int deleteTravelsById(Integer id);

    /**
     * 批量删除游记
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTravelsByIds(Integer[] ids);

    /**
     * 我的游记
     * @param userId
     * @return
     */
    List<Travels> getMyTravels(@Param("userId") Integer userId);

    /**
     * 热门
     * @return
     */
    List<Travels> getHot();
}
