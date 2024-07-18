package com.ruoyi.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AgencyMapper;
import com.ruoyi.system.domain.Agency;
import com.ruoyi.system.service.IAgencyService;

/**
 * 旅游社Service业务层处理
 *
 * @author ...
 * @date 2024-07-11
 */
@Service
public class AgencyServiceImpl implements IAgencyService{

    @Autowired
    private AgencyMapper agencyMapper;

    /**
     * 查询旅行社
     *
     * @param id 旅行社编号
     * @return 旅行社
     */
    @Override
    public Agency selectAgencyById(int id)
    {
        return agencyMapper.selectAgencyById(id);
    }

    @Override
    public Agency selectAgencyByName(String name) {
        return agencyMapper.selectAgencyByName(name);
    }

    /**
     * 查询旅行社列表
     *
     * @param agency 旅行社
     * @return 旅行社集合
     */
    @Override
    public List<Agency> selectAgencyList(Agency agency){

        return agencyMapper.selectAgencyList(agency);
    }

    /**
     * 新增旅行社
     *
     * @param agency 旅行社
     * @return 结果
     */
    @Override
    public int insertAgency(Agency agency){

        return  agencyMapper.insertAgency(agency);
    }

    /**
     * 修改旅行社
     *
     * @param agency 旅行社
     * @return 结果
     */
    @Override
    public int
    updateAgency(Agency agency){

        return agencyMapper.updateAgency(agency);
    }

    /**
     * 删除旅行社
     *
     * @param id 旅行社编号
     * @return 结果
     */
    @Override
    public int deleteAgencyById(int id){

        return agencyMapper.deleteAgencyById(id);
    }

    /**
     * 批量删除旅行社
     *
     * @param ids 需要删除的旅行社编号集合
     * @return 结果
     */
    @Override
    public int deleteAgencyByIds(int[] ids){
        return agencyMapper.deleteAgencyByIds(ids);
    }
}
