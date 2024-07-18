package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Guide;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 导游员Mapper接口
 *
 * @author ...
 * @date 2022-03-13
 */
public interface GuideMapper {
    /**
     * 根据ID查询导游员信息
     *
     * @param id 导游员主键
     * @return 导游员信息
     */
    Guide selectGuideById(@Param("id") int id);

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
     * 删除导游员信息
     *
     * @param id 导游员主键
     * @return 结果
     */
    int deleteGuideById(@Param("id") int id);

    /**
     * 批量删除导游员信息
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    int deleteGuideByIds(@Param("ids") int[] ids);

    // 可以添加更多自定义的查询方法，例如根据导游姓名查询等
    /**
     * 根据导游姓名查询导游员信息
     *
     * @param name 导游姓名
     * @return 导游员信息
     */
    Guide selectGuideByName(@Param("name") String name);
    Guide selectGuideByAddress(@Param("address") String address);
    Guide selectGuideByScenic(@Param("scenic") String scenic);


    // 根据资格审验信息查询导游员列表
    List<Guide> selectGuideListByAddress(@Param("address") String address);

    // 根据导游行程单申领状态查询导游员列表
    List<Guide> selectGuideListByScenic(@Param("scenic") String scenic);

    List<Guide> getAll();
    // 更多自定义查询...
}