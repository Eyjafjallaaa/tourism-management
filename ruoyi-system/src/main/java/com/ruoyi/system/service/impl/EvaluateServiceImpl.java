package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Evaluate;
import com.ruoyi.system.mapper.EvaluateMapper;
import com.ruoyi.system.service.IEvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 景点评价Service业务层处理
 * 
 * @author ...
 * @date 2022-03-13
 */
@Service
public class EvaluateServiceImpl implements IEvaluateService 
{
    @Autowired
    private EvaluateMapper evaluateMapper;

    /**
     * 查询景点评价
     * 
     * @param id 景点评价主键
     * @return 景点评价
     */
    @Override
    public Evaluate selectEvaluateById(Integer id)
    {
        return evaluateMapper.selectEvaluateById(id);
    }

    /**
     * 查询景点评价列表
     * 
     * @param evaluate 景点评价
     * @return 景点评价
     */
    @Override
    public List<Evaluate> selectEvaluateList(Evaluate evaluate)
    {
        return evaluateMapper.selectEvaluateList(evaluate);
    }

    /**
     * 新增景点评价
     * 
     * @param evaluate 景点评价
     * @return 结果
     */
    @Override
    public int insertEvaluate(Evaluate evaluate)
    {
        evaluate.setCreateTime(DateUtils.getNowDate());
        return evaluateMapper.insertEvaluate(evaluate);
    }

    /**
     * 修改景点评价
     * 
     * @param evaluate 景点评价
     * @return 结果
     */
    @Override
    public int updateEvaluate(Evaluate evaluate)
    {
        evaluate.setUpdateTime(DateUtils.getNowDate());
        return evaluateMapper.updateEvaluate(evaluate);
    }

    /**
     * 批量删除景点评价
     * 
     * @param ids 需要删除的景点评价主键
     * @return 结果
     */
    @Override
    public int deleteEvaluateByIds(Integer[] ids)
    {
        return evaluateMapper.deleteEvaluateByIds(ids);
    }

    /**
     * 删除景点评价信息
     * 
     * @param id 景点评价主键
     * @return 结果
     */
    @Override
    public int deleteEvaluateById(Integer id)
    {
        return evaluateMapper.deleteEvaluateById(id);
    }

    @Override
    public List<Evaluate> getList(Integer sid) {
        return evaluateMapper.getList(sid);
    }

    @Override
    public List<Evaluate> getMyEvaluate() {
        int userId = SecurityUtils.getUserId().intValue();
        return evaluateMapper.getMyEvaluate(userId);
    }
}
