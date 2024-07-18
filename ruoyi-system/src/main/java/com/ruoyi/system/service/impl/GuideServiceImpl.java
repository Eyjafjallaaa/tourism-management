package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.Guide;
import com.ruoyi.system.domain.Scenic;
import com.ruoyi.system.mapper.GuideMapper;
import com.ruoyi.system.service.IGuideService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 导游员Service业务层处理
 *
 * @author ...
 * @date 2022-03-13
 */
@Service
public class GuideServiceImpl implements IGuideService {
    @Autowired
    private GuideMapper guideMapper;

    /**
     * 根据ID查询导游员信息
     *
     * @param id 导游员主键
     * @return 导游员信息
     */
    @Override
    public Guide selectGuideById(Integer id) {
        return guideMapper.selectGuideById(id);
    }

    /**
     * 查询导游员列表
     *
     * @param guide 导游员条件
     * @return 导游员集合
     */
    @Override
    public List<Guide> selectGuideList(Guide guide) {
        return guideMapper.selectGuideList(guide);
    }

    /**
     * 新增导游员信息
     *
     * @param guide 导游员信息
     * @return 结果
     */
    @Override
    public int insertGuide(Guide guide) {
        guide.setCreateTime(DateUtils.getNowDate());
        guide.setUpdateTime(DateUtils.getNowDate());
        return guideMapper.insertGuide(guide);
    }

    /**
     * 修改导游员信息
     *
     * @param guide 导游员信息
     * @return 结果
     */
    @Override
    public int updateGuide(Guide guide) {
        guide.setUpdateTime(DateUtils.getNowDate());
        return guideMapper.updateGuide(guide);
    }

    /**
     * 批量删除导游员信息
     *
     * @param ids 需要删除的导游员主键
     * @return 结果
     */
    @Override
    public int deleteGuideByIds(int[] ids) {
        return guideMapper.deleteGuideByIds(ids);
    }

    /**
     * 删除导游员信息
     *
     * @param id 导游员主键
     * @return 结果
     */
    @Override
    public int deleteGuideById(Integer id) {
        return guideMapper.deleteGuideById(id);
    }

    // 可以添加更多自定义的业务方法，例如根据导游姓名查询等
    /**
     * 根据导游姓名查询导游员信息
     *
     * @param name 导游姓名
     * @return 导游员信息
     */
    @Override
    public Guide selectGuideByName(String name) {
        return guideMapper.selectGuideByName(name);
    }
    public Guide selectGuideByAddress(String address) {
        return guideMapper.selectGuideByAddress(address);
    }
    public Guide selectGuideByScenic(String scenic) {
        return guideMapper.selectGuideByScenic(scenic);
    }
    @Override
    public List<Guide> selectGuideListByAddress(String address) {
        return null;
    }

    @Override
    public List<Guide> selectGuideListByScenic(String scenic) {
        return null;
    }

    public List<Guide> getAll() {
        return guideMapper.getAll();
    }
    // 更多自定义业务方法...
}