package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Sensitive;

import java.util.List;

/**
 * 敏感词Mapper接口
 * 
 * @author ...
 * @date 2022-05-22
 */
public interface SensitiveMapper 
{
    /**
     * 查询敏感词
     * 
     * @param id 敏感词主键
     * @return 敏感词
     */
    public Sensitive selectSensitiveById(Integer id);

    /**
     * 查询敏感词列表
     * 
     * @param sensitive 敏感词
     * @return 敏感词集合
     */
    public List<Sensitive> selectSensitiveList(Sensitive sensitive);

    /**
     * 新增敏感词
     * 
     * @param sensitive 敏感词
     * @return 结果
     */
    public int insertSensitive(Sensitive sensitive);

    /**
     * 修改敏感词
     * 
     * @param sensitive 敏感词
     * @return 结果
     */
    public int updateSensitive(Sensitive sensitive);

    /**
     * 删除敏感词
     * 
     * @param id 敏感词主键
     * @return 结果
     */
    public int deleteSensitiveById(Integer id);

    /**
     * 批量删除敏感词
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSensitiveByIds(Integer[] ids);
}
