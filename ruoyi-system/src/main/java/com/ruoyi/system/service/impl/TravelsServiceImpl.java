package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Travels;
import com.ruoyi.system.mapper.TravelsMapper;
import com.ruoyi.system.service.ITravelsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 游记Service业务层处理
 * 
 * @author ...
 * @date 2022-03-13
 */
@Service
public class TravelsServiceImpl implements ITravelsService 
{
    @Autowired
    private TravelsMapper travelsMapper;

    /**
     * 查询游记
     * 
     * @param id 游记主键
     * @return 游记
     */
    @Override
    public Travels selectTravelsById(Integer id)
    {
        return travelsMapper.selectTravelsById(id);
    }

    /**
     * 查询游记列表
     * 
     * @param travels 游记
     * @return 游记
     */
    @Override
    public List<Travels> selectTravelsList(Travels travels)
    {
        return travelsMapper.selectTravelsList(travels);
    }

    /**
     * 新增游记
     * 
     * @param travels 游记
     * @return 结果
     */
    @Override
    public int insertTravels(Travels travels)
    {
        travels.setCreateTime(DateUtils.getNowDate());
        return travelsMapper.insertTravels(travels);
    }

    /**
     * 修改游记
     * 
     * @param travels 游记
     * @return 结果
     */
    @Override
    public int updateTravels(Travels travels)
    {
        travels.setUpdateTime(DateUtils.getNowDate());
        return travelsMapper.updateTravels(travels);
    }

    /**
     * 批量删除游记
     * 
     * @param ids 需要删除的游记主键
     * @return 结果
     */
    @Override
    public int deleteTravelsByIds(Integer[] ids)
    {
        return travelsMapper.deleteTravelsByIds(ids);
    }

    /**
     * 删除游记信息
     * 
     * @param id 游记主键
     * @return 结果
     */
    @Override
    public int deleteTravelsById(Integer id)
    {
        return travelsMapper.deleteTravelsById(id);
    }

    @Override
    public List<Travels> getMyTravels() {
        int userId = SecurityUtils.getUserId().intValue();
        return travelsMapper.getMyTravels(userId);
    }

    @Override
    public List<Travels> getHot() {
        return travelsMapper.getHot();
    }
}
