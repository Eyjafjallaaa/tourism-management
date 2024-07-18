package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.GiveGood;
import com.ruoyi.system.mapper.GiveGoodMapper;
import com.ruoyi.system.service.IGiveGoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 点赞Service业务层处理
 * 
 * @author ...
 * @date 2022-03-27
 */
@Service
public class GiveGoodServiceImpl implements IGiveGoodService 
{
    @Autowired
    private GiveGoodMapper giveGoodMapper;

    /**
     * 查询点赞
     * 
     * @param id 点赞主键
     * @return 点赞
     */
    @Override
    public GiveGood selectGiveGoodById(Integer id)
    {
        return giveGoodMapper.selectGiveGoodById(id);
    }

    /**
     * 查询点赞列表
     * 
     * @param giveGood 点赞
     * @return 点赞
     */
    @Override
    public List<GiveGood> selectGiveGoodList(GiveGood giveGood)
    {
        return giveGoodMapper.selectGiveGoodList(giveGood);
    }

    /**
     * 新增点赞
     * 
     * @param giveGood 点赞
     * @return 结果
     */
    @Override
    public int insertGiveGood(GiveGood giveGood)
    {
        giveGood.setCreateTime(DateUtils.getNowDate());
        return giveGoodMapper.insertGiveGood(giveGood);
    }

    /**
     * 修改点赞
     * 
     * @param giveGood 点赞
     * @return 结果
     */
    @Override
    public int updateGiveGood(GiveGood giveGood)
    {
        giveGood.setUpdateTime(DateUtils.getNowDate());
        return giveGoodMapper.updateGiveGood(giveGood);
    }

    /**
     * 批量删除点赞
     * 
     * @param ids 需要删除的点赞主键
     * @return 结果
     */
    @Override
    public int deleteGiveGoodByIds(Integer[] ids)
    {
        return giveGoodMapper.deleteGiveGoodByIds(ids);
    }

    /**
     * 删除点赞信息
     * 
     * @param id 点赞主键
     * @return 结果
     */
    @Override
    public int deleteGiveGoodById(Integer id)
    {
        return giveGoodMapper.deleteGiveGoodById(id);
    }
}
