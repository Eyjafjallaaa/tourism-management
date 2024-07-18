package com.ruoyi.system.service;

import com.ruoyi.system.domain.Member;
import com.ruoyi.system.domain.Viper;

import java.util.List;

/**
 * 会员Service接口
 * 
 * @author ...
 * @date 2022-03-13
 */
public interface IMemberService 
{
    /**
     * 查询会员
     * 
     * @param id 会员主键
     * @return 会员
     */
    public Member selectMemberById(Integer id);

    /**
     * 查询会员列表
     * 
     * @param member 会员
     * @return 会员集合
     */
    public List<Member> selectMemberList(Member member);

    /**
     * 新增会员
     * 
     * @param member 会员
     * @return 结果
     */
    public int insertMember(Member member);

    /**
     * 修改会员
     * 
     * @param member 会员
     * @return 结果
     */
    public int updateMember(Member member);

    /**
     * 批量删除会员
     * 
     * @param ids 需要删除的会员主键集合
     * @return 结果
     */
    public int deleteMemberByIds(Integer[] ids);

    /**
     * 删除会员信息
     * 
     * @param id 会员主键
     * @return 结果
     */
    public int deleteMemberById(Integer id);
}
