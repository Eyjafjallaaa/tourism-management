package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Scenic;

import java.util.List;

/**
 * 景点Mapper接口
 * 
 * @author ...
 * @date 2022-03-13
 */
public interface ScenicMapper 
{
    /**
     * 查询景点
     * 
     * @param id 景点主键
     * @return 景点
     */
    public Scenic selectScenicById(Integer id);

    /**
     * 查询景点列表
     * 
     * @param scenic 景点
     * @return 景点集合
     */
    public List<Scenic> selectScenicList(Scenic scenic);

    /**
     * 新增景点
     * 
     * @param scenic 景点
     * @return 结果
     */
    public int insertScenic(Scenic scenic);

    /**
     * 修改景点
     * 
     * @param scenic 景点
     * @return 结果
     */
    public int updateScenic(Scenic scenic);

    /**
     * 删除景点
     * 
     * @param id 景点主键
     * @return 结果
     */
    public int deleteScenicById(Integer id);

    /**
     * 批量删除景点
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteScenicByIds(Integer[] ids);

    /**
     * 查询所有景点
     * @return
     */
    List<Scenic> getAll();
}
