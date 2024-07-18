package com.ruoyi.system.service;

import com.ruoyi.system.domain.Evaluate;

import java.util.List;

/**
 * 景点评价Service接口
 * 
 * @author ...
 * @date 2022-03-13
 */
public interface IEvaluateService 
{
    /**
     * 查询景点评价
     * 
     * @param id 景点评价主键
     * @return 景点评价
     */
    public Evaluate selectEvaluateById(Integer id);

    /**
     * 查询景点评价列表
     * 
     * @param evaluate 景点评价
     * @return 景点评价集合
     */
    public List<Evaluate> selectEvaluateList(Evaluate evaluate);

    /**
     * 新增景点评价
     * 
     * @param evaluate 景点评价
     * @return 结果
     */
    public int insertEvaluate(Evaluate evaluate);

    /**
     * 修改景点评价
     * 
     * @param evaluate 景点评价
     * @return 结果
     */
    public int updateEvaluate(Evaluate evaluate);

    /**
     * 批量删除景点评价
     * 
     * @param ids 需要删除的景点评价主键集合
     * @return 结果
     */
    public int deleteEvaluateByIds(Integer[] ids);

    /**
     * 删除景点评价信息
     * 
     * @param id 景点评价主键
     * @return 结果
     */
    public int deleteEvaluateById(Integer id);

    /**
     * 获取评论
     * @param sid
     * @return
     */
    List<Evaluate> getList(Integer sid);

    /**
     * 我的评论
     * @return
     */
    List<Evaluate> getMyEvaluate();
}
