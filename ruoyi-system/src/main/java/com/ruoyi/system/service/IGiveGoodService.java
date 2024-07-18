package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.GiveGood;

/**
 * 点赞Service接口
 * 
 * @author ...
 * @date 2022-03-27
 */
public interface IGiveGoodService 
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
     * 批量删除点赞
     * 
     * @param ids 需要删除的点赞主键集合
     * @return 结果
     */
    public int deleteGiveGoodByIds(Integer[] ids);

    /**
     * 删除点赞信息
     * 
     * @param id 点赞主键
     * @return 结果
     */
    public int deleteGiveGoodById(Integer id);
}
