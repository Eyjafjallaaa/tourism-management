package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 会员对象 member
 * 
 * @author ...
 * @date 2022-03-13
 */
public class Member extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Integer id;

    /** 会员 */
    private String name;

    /** 内容 */
    private String content;

    /** 创建人 */
    private Integer createUser;

    /** 修改人 */
    private Integer updateUser;

    /** 是否已删除 */
    private Integer isDeleted;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
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
            .append("name", getName())
            .append("content", getContent())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .append("isDeleted", getIsDeleted())
            .toString();
    }
}
