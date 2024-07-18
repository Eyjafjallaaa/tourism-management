package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 会员对象 viper
 * 
 * @author ...
 * @date 2022-03-13
 */
public class Viper extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Integer id;

    /** 用户id */
    @Excel(name = "用户id")
    private Integer uid;

    /** 用户名 */
    @Excel(name = "用户名")
    private String uname;

    /** 积分 */
    @Excel(name = "积分")
    private String integral;

    /** 创建人 */
    @Excel(name = "创建人")
    private Integer createUser;

    /** 修改人 */
    @Excel(name = "修改人")
    private Integer updateUser;

    /** 是否已删除 */
    @Excel(name = "是否已删除")
    private Integer isDeleted;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setUid(Integer uid) 
    {
        this.uid = uid;
    }

    public Integer getUid() 
    {
        return uid;
    }
    public void setUname(String uname) 
    {
        this.uname = uname;
    }

    public String getUname() 
    {
        return uname;
    }
    public void setIntegral(String integral) 
    {
        this.integral = integral;
    }

    public String getIntegral() 
    {
        return integral;
    }
    public void setCreateUser(Integer createUser) 
    {
        this.createUser = createUser;
    }

    public Integer getCreateUser() 
    {
        return createUser;
    }
    public void setUpdateUser(Integer updateUser) 
    {
        this.updateUser = updateUser;
    }

    public Integer getUpdateUser() 
    {
        return updateUser;
    }
    public void setIsDeleted(Integer isDeleted) 
    {
        this.isDeleted = isDeleted;
    }

    public Integer getIsDeleted() 
    {
        return isDeleted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("uid", getUid())
            .append("uname", getUname())
            .append("integral", getIntegral())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .append("isDeleted", getIsDeleted())
            .toString();
    }
}
