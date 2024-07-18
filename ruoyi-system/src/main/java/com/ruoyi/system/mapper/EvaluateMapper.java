package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Evaluate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 景点评价Mapper接口
 * 
 * @author ...
 * @date 2022-03-13
 */
public interface EvaluateMapper 
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
     * 删除景点评价
     * 
     * @param id 景点评价主键
     * @return 结果
     */
    public int deleteEvaluateById(Integer id);

    /**
     * 批量删除景点评价
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteEvaluateByIds(Integer[] ids);

    /**
     * 获取评论
     * @param sid
     * @return
     */
    List<Evaluate> getList(@Param("sid") Integer sid);

    /**
     * 我的评论
     * @param userId
     * @return
     */
    List<Evaluate> getMyEvaluate(@Param("userId") Integer userId);
}
