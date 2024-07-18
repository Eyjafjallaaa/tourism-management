package com.ruoyi.system.service;

import com.ruoyi.system.domain.Viper;

import java.util.List;

/**
 * 会员Service接口
 * 
 * @author ...
 * @date 2022-03-13
 */
public interface IViperService 
{
    /**
     * 查询会员
     * 
     * @param id 会员主键
     * @return 会员
     */
    public Viper selectViperById(Integer id);

    /**
     * 查询会员列表
     * 
     * @param viper 会员
     * @return 会员集合
     */
    public List<Viper> selectViperList(Viper viper);

    /**
     * 新增会员
     * 
     * @param viper 会员
     * @return 结果
     */
    public int insertViper(Viper viper);

    /**
     * 修改会员
     * 
     * @param viper 会员
     * @return 结果
     */
    public int updateViper(Viper viper);

    /**
     * 批量删除会员
     * 
     * @param ids 需要删除的会员主键集合
     * @return 结果
     */
    public int deleteViperByIds(Integer[] ids);

    /**
     * 删除会员信息
     * 
     * @param id 会员主键
     * @return 结果
     */
    public int deleteViperById(Integer id);

    /**
     * 获取积分
     * @return
     */
    Viper getIntegral();
}
