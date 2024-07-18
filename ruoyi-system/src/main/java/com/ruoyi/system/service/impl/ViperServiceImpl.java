package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Viper;
import com.ruoyi.system.mapper.ViperMapper;
import com.ruoyi.system.service.IViperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 会员Service业务层处理
 * 
 * @author ...
 * @date 2022-03-13
 */
@Service
public class ViperServiceImpl implements IViperService 
{
    @Autowired
    private ViperMapper viperMapper;

    /**
     * 查询会员
     * 
     * @param id 会员主键
     * @return 会员
     */
    @Override
    public Viper selectViperById(Integer id)
    {
        return viperMapper.selectViperById(id);
    }

    /**
     * 查询会员列表
     * 
     * @param viper 会员
     * @return 会员
     */
    @Override
    public List<Viper> selectViperList(Viper viper)
    {
        return viperMapper.selectViperList(viper);
    }

    /**
     * 新增会员
     * 
     * @param viper 会员
     * @return 结果
     */
    @Override
    public int insertViper(Viper viper)
    {
        viper.setCreateTime(DateUtils.getNowDate());
        return viperMapper.insertViper(viper);
    }

    /**
     * 修改会员
     * 
     * @param viper 会员
     * @return 结果
     */
    @Override
    public int updateViper(Viper viper)
    {
        viper.setUpdateTime(DateUtils.getNowDate());
        return viperMapper.updateViper(viper);
    }

    /**
     * 批量删除会员
     * 
     * @param ids 需要删除的会员主键
     * @return 结果
     */
    @Override
    public int deleteViperByIds(Integer[] ids)
    {
        return viperMapper.deleteViperByIds(ids);
    }

    /**
     * 删除会员信息
     * 
     * @param id 会员主键
     * @return 结果
     */
    @Override
    public int deleteViperById(Integer id)
    {
        return viperMapper.deleteViperById(id);
    }

    @Override
    public Viper getIntegral() {
        int userId = SecurityUtils.getUserId().intValue();
        return viperMapper.getIntegral(userId);
    }
}
