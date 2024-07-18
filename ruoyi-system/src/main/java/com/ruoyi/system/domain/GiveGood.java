package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 点赞对象 give_good
 * 
 * @author ...
 * @date 2022-03-27
 */
public class GiveGood extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Integer id;

    /** 游记id */
    @Excel(name = "游记id")
    private Integer tid;

    /** 游记名字 */
    @Excel(name = "游记名字")
    private String tname;

    /** 点赞人 */
    @Excel(name = "点赞人")
    private String userName;

    /** 创建人 */
    @Excel(name = "创建人")
    private Integer createUser;

    /** 修改时间 */
    @Excel(name = "修改时间")
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
    public void setTid(Integer tid) 
    {
        this.tid = tid;
    }

    public Integer getTid() 
    {
        return tid;
    }
    public void setTname(String tname) 
    {
        this.tname = tname;
    }

    public String getTname() 
    {
        return tname;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
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
            .append("tid", getTid())
            .append("tname", getTname())
            .append("userName", getUserName())
            .append("createUser", getCreateUser())
            .append("createTime", getCreateTime())
            .append("updateUser", getUpdateUser())
            .append("updateTime", getUpdateTime())
            .append("isDeleted", getIsDeleted())
            .toString();
    }
}
