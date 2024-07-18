package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.data.annotation.Transient;

/**
 * 游记对象 travels
 * 
 * @author ...
 * @date 2022-03-27
 */
public class Travels extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Integer id;

    /** 游记名 */
    @Excel(name = "游记名")
    private String name;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 照片 */
    @Excel(name = "照片")
    private String picture;

    /** 点赞数 */
    @Excel(name = "点赞数")
    private Integer goodNum;

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
        if (picture != null && !picture.contains("http")) {
            pic = "http://localhost:8080" + picture;
        }else {
            pic = picture;
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
    public void setPicture(String picture) 
    {
        this.picture = picture;
    }

    public String getPicture() 
    {
        return picture;
    }
    public void setGoodNum(Integer goodNum)
    {
        this.goodNum = goodNum;
    }

    public Integer getGoodNum()
    {
        return goodNum;
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
            .append("picture", getPicture())
            .append("goodNum", getGoodNum())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .append("isDeleted", getIsDeleted())
            .toString();
    }
}
