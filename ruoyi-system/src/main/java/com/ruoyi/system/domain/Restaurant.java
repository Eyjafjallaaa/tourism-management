package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.springframework.data.annotation.Transient;

public class Restaurant extends BaseEntity {
    private static final long serialVersionUID = 1L;
    /** ID */
    private Integer id;
    /** 名称 */
    private String name;
    /** 图片 */
    private String picture;
    /** 地址 */
    private String location;
    private String score;
    private String description;
    private float avg_price;
    private Integer isDeleted;
    @Transient
    private String pic;
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getId() {
        return id;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getAvg_price() {
        return avg_price;
    }

    public void setAvg_price(float avg_price) {
        this.avg_price = avg_price;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public String getPic(){
        if(picture != null){
            pic = "http://localhost:8080" + picture;
        }
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    @Override
    public String toString() {
        return "Restaurant{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", picture='" + picture + '\'' +
                ", location='" + location + '\'' +
                ", score='" + score + '\'' +
                ", description='" + description + '\'' +
                ", avg_price=" + avg_price +
                ", pic='" + pic + '\'' +
                '}';
    }
}
