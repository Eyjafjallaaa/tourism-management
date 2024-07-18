package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.data.annotation.Transient;

/**
 * 景点对象 scenic
 * 
 * @author ...
 * @date 2022-03-13
 */
public class  Scenic extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Integer id;

    /** 景点名 */
    private String name;

    /** 景点图片 */
    private String picture;

    /** 评分 */
    private String score;

    /** 景点简介 */
    private String introduction;

    /** 票价 */
    private String price;

    /** 建议游玩时间 */
    private String playTime;

    /** 城市 */
    private String city;

    /** 景点位置 */
    private String address;

    /** 创建人 */
    private Integer createUser;

    /** 更新人 */
    private Integer updateUser;

    /** 是否已删除 */
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
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setPicture(String picture) 
    {
        this.picture = picture;
    }

    public String getPicture() 
    {
        return picture;
    }
    public void setScore(String score) 
    {
        this.score = score;
    }

    public String getScore() 
    {
        return score;
    }
    public void setIntroduction(String introduction) 
    {
        this.introduction = introduction;
    }

    public String getIntroduction() 
    {
        return introduction;
    }
    public void setPrice(String price) 
    {
        this.price = price;
    }

    public String getPrice() 
    {
        return price;
    }
    public void setPlayTime(String playTime) 
    {
        this.playTime = playTime;
    }

    public String getPlayTime() 
    {
        return playTime;
    }
    public void setCity(String city) 
    {
        this.city = city;
    }

    public String getCity() 
    {
        return city;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
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
            .append("picture", getPicture())
            .append("score", getScore())
            .append("introduction", getIntroduction())
            .append("price", getPrice())
            .append("playTime", getPlayTime())
            .append("city", getCity())
            .append("address", getAddress())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .append("isDeleted", getIsDeleted())
            .toString();
    }
}
