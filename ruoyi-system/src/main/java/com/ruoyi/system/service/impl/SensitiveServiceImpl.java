package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Sensitive;
import com.ruoyi.system.mapper.SensitiveMapper;
import com.ruoyi.system.service.ISensitiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 敏感词Service业务层处理
 * 
 * @author ...
 * @date 2022-05-22
 */
@Service
public class SensitiveServiceImpl implements ISensitiveService 
{
    @Autowired
    private SensitiveMapper sensitiveMapper;

    /**
     * 查询敏感词
     * 
     * @param id 敏感词主键
     * @return 敏感词
     */
    @Override
    public Sensitive selectSensitiveById(Integer id)
    {
        return sensitiveMapper.selectSensitiveById(id);
    }

    /**
     * 查询敏感词列表
     * 
     * @param sensitive 敏感词
     * @return 敏感词
     */
    @Override
    public List<Sensitive> selectSensitiveList(Sensitive sensitive)
    {
        return sensitiveMapper.selectSensitiveList(sensitive);
    }

    /**
     * 新增敏感词
     * 
     * @param sensitive 敏感词
     * @return 结果
     */
    @Override
    public int insertSensitive(Sensitive sensitive)
    {
        sensitive.setCreateTime(DateUtils.getNowDate());
        sensitive.setCreateUser(SecurityUtils.getUserId().intValue());
        return sensitiveMapper.insertSensitive(sensitive);
    }

    /**
     * 修改敏感词
     * 
     * @param sensitive 敏感词
     * @return 结果
     */
    @Override
    public int updateSensitive(Sensitive sensitive)
    {
        sensitive.setUpdateTime(DateUtils.getNowDate());
        sensitive.setUpdateUser(SecurityUtils.getUserId().intValue());
        return sensitiveMapper.updateSensitive(sensitive);
    }

    /**
     * 批量删除敏感词
     * 
     * @param ids 需要删除的敏感词主键
     * @return 结果
     */
    @Override
    public int deleteSensitiveByIds(Integer[] ids)
    {
        return sensitiveMapper.deleteSensitiveByIds(ids);
    }

    /**
     * 删除敏感词信息
     * 
     * @param id 敏感词主键
     * @return 结果
     */
    @Override
    public int deleteSensitiveById(Integer id)
    {
        return sensitiveMapper.deleteSensitiveById(id);
    }
}
