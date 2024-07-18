package com.ruoyi.system.service;

import com.ruoyi.system.domain.Guide;
import com.ruoyi.system.domain.Scenic;

import java.util.List;

/**
 * 导游员Service接口
 *
 * @author ...
 * @date 2022-03-13
 */
public interface IGuideService {
    /**
     * 根据ID查询导游员信息
     *
     * @param id 导游员主键
     * @return 导游员信息
     */
    Guide selectGuideById(Integer id);

    /**
     * 查询导游员列表
     *
     * @param guide 导游员条件
     * @return 导游员集合
     */
    List<Guide> selectGuideList(Guide guide);

    /**
     * 新增导游员信息
     *
     * @param guide 导游员信息
     * @return 结果
     */
    int insertGuide(Guide guide);

    /**
     * 修改导游员信息
     *
     * @param guide 导游员信息
     * @return 结果
     */
    int updateGuide(Guide guide);

    /**
     * 批量删除导游员信息
     *
     * @param ids 需要删除的导游员主键集合
     * @return 结果
     */
    int deleteGuideByIds(int[] ids);

    /**
     * 删除导游员信息
     *
     * @param id 导游员主键
     * @return 结果
     */
    int deleteGuideById(Integer id);

    // 可以添加更多自定义的方法，例如根据导游姓名查询等
    /**
     * 根据导游姓名查询导游员信息
     *
     * @param name 导游姓名
     * @return 导游员信息
     */
    Guide selectGuideByName(String name);

    // 根据资格审验信息查询导游员列表
    List<Guide> selectGuideListByAddress(String address);

    // 根据导游行程单申领状态查询导游员列表
    List<Guide> selectGuideListByScenic(String scenic);

    List<Guide> getAll();

    // 可以添加其他自定义查询方法...
}