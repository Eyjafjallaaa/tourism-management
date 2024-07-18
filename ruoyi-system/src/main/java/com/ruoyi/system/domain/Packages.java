package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.springframework.data.annotation.Transient;

/**
 * 旅游套餐对象 packages
 * 
 * @author ...
 * @date 2022-03-14
 */
public class Packages extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Integer id;

    /** 景点id */
    @Excel(name = "景点id")
    private String sid;

    /** 景点名 */
    @Excel(name = "景点名")
    private String sname;

    /** 套餐名 */
    @Excel(name = "套餐名")
    private String name;

    /** 套餐类型 */
    @Excel(name = "套餐类型")
    private String type;

    /** 套餐详情 */
    @Excel(name = "套餐详情")
    private String content;

    /** 照片 */
    @Excel(name = "照片")
    private String picture;

    /** 套餐价格 */
    @Excel(name = "套餐价格")
    private String price;

    /** 创建人 */
    @Excel(name = "创建人")
    private Integer createUser;

    /** 修改人 */
    @Excel(name = "修改人")
    private Integer updateUser;

    /** 是否已删除 */
    @Excel(name = "是否已删除")
    private Integer isDeleted;

    @Transient
    private String pic;

    public String getPic() {
        if (picture != null) {
            pic = "http://localhost:8080" + picture;
        }
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId()
    {
        return id;
    }
    public void setSid(String sid)
    {
        this.sid = sid;
    }

    public String getSid()
    {
        return sid;
    }
    public void setSname(String sname) 
    {
        this.sname = sname;
    }

    public String getSname() 
    {
        return sname;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setPicture(String picture) 
    {
        this.picture = picture;
    }

    public String getPicture() 
    {
        return picture;
    }
    public void setPrice(String price) 
    {
        this.price = price;
    }

    public String getPrice() 
    {
        return price;
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
            .append("sid", getSid())
            .append("sname", getSname())
            .append("name", getName())
            .append("type", getType())
            .append("content", getContent())
            .append("picture", getPicture())
            .append("price", getPrice())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .append("isDeleted", getIsDeleted())
            .toString();
    }
}
