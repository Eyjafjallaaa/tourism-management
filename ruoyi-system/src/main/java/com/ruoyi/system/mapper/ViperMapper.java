package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Viper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 会员Mapper接口
 * 
 * @author ...
 * @date 2022-03-13
 */
public interface ViperMapper 
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
     * 删除会员
     * 
     * @param id 会员主键
     * @return 结果
     */
    public int deleteViperById(Integer id);

    /**
     * 批量删除会员
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteViperByIds(Integer[] ids);

    /**
     * 获取积分
     * @param userId
     * @return
     */
    Viper getIntegral(@Param("userId") Integer userId);
}
