package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Agency;

import java.util.List;

public interface AgencyMapper
{
    /**
     * 查询旅行社
     *
     * @param id 旅行社编号
     * @return 旅行社
     */
    public Agency selectAgencyById(int id);
    public Agency selectAgencyByName(String name);

    /**
     * 查询旅行社列表
     *
     * @param agency 旅行社
     * @return 旅行社集合
     */
    public List<Agency> selectAgencyList(Agency agency);

    /**
     * 新增旅行社
     *
     * @param agency 旅行社
     * @return 结果
     */
    public int insertAgency(Agency agency);

    /**
     * 修改旅行社
     *
     * @param agency 旅行社
     * @return 结果
     */
    public int updateAgency(Agency agency);

    /**
     * 删除旅行社
     *
     * @param id 旅行社编号
     * @return 结果
     */
    public int deleteAgencyById(int id);

    /**
     * 批量删除旅行社
     *
     * @param ids 需要删除的旅行社编号集合
     * @return 结果
     */
    public int deleteAgencyByIds(int[] ids);
}
