package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.GiveGood;

import java.util.List;

/**
 * 点赞Mapper接口
 * 
 * @author ...
 * @date 2022-03-27
 */
public interface GiveGoodMapper 
{
    /**
     * 查询点赞
     * 
     * @param id 点赞主键
     * @return 点赞
     */
    public GiveGood selectGiveGoodById(Integer id);

    /**
     * 查询点赞列表
     * 
     * @param giveGood 点赞
     * @return 点赞集合
     */
    public List<GiveGood> selectGiveGoodList(GiveGood giveGood);

    /**
     * 新增点赞
     * 
     * @param giveGood 点赞
     * @return 结果
     */
    public int insertGiveGood(GiveGood giveGood);

    /**
     * 修改点赞
     * 
     * @param giveGood 点赞
     * @return 结果
     */
    public int updateGiveGood(GiveGood giveGood);

    /**
     * 删除点赞
     * 
     * @param id 点赞主键
     * @return 结果
     */
    public int deleteGiveGoodById(Integer id);

    /**
     * 批量删除点赞
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGiveGoodByIds(Integer[] ids);
}
