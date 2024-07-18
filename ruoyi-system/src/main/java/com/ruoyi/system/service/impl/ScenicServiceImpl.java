package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.domain.Scenic;
import com.ruoyi.system.mapper.ScenicMapper;
import com.ruoyi.system.service.IScenicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 景点Service业务层处理
 * 
 * @author ...
 * @date 2022-03-13
 */
@Service
public class ScenicServiceImpl implements IScenicService 
{
    @Autowired
    private ScenicMapper scenicMapper;

    /**
     * 查询景点
     * 
     * @param id 景点主键
     * @return 景点
     */
    @Override
    public Scenic selectScenicById(Integer id)
    {
        return scenicMapper.selectScenicById(id);
    }

    /**
     * 查询景点列表
     * 
     * @param scenic 景点
     * @return 景点
     */
    @Override
    public List<Scenic> selectScenicList(Scenic scenic)
    {
        return scenicMapper.selectScenicList(scenic);
    }

    /**
     * 新增景点
     * 
     * @param scenic 景点
     * @return 结果
     */
    @Override
    public int insertScenic(Scenic scenic)
    {
        scenic.setCreateTime(DateUtils.getNowDate());
        return scenicMapper.insertScenic(scenic);
    }

    /**
     * 修改景点
     * 
     * @param scenic 景点
     * @return 结果
     */
    @Override
    public int updateScenic(Scenic scenic)
    {
        scenic.setUpdateTime(DateUtils.getNowDate());
        return scenicMapper.updateScenic(scenic);
    }

    /**
     * 批量删除景点
     * 
     * @param ids 需要删除的景点主键
     * @return 结果
     */
    @Override
    public int deleteScenicByIds(Integer[] ids)
    {
        return scenicMapper.deleteScenicByIds(ids);
    }

    /**
     * 删除景点信息
     * 
     * @param id 景点主键
     * @return 结果
     */
    @Override
    public int deleteScenicById(Integer id)
    {
        return scenicMapper.deleteScenicById(id);
    }

    @Override
    public List<Scenic> getAll() {
        return scenicMapper.getAll();
    }
}
