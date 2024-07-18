package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.springframework.data.annotation.Transient;

public class Guide extends BaseEntity{
    private static final long serialVersionUID = 1L;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getScenic() {
        return scenic;
    }

    public void setScenic(String scenic) {
        this.scenic = scenic;
    }
    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("name", getName())
                .append("age", getPhone())
                .append("address", getAddress())
                .append("createTime", getCreateTime())
                .append("info", getInfo())
                .append("updateTime", getUpdateTime())
                .append("scenic", getScenic())
                .append("picture", getPicture())
                .append("qualification",getQualification())
                .append("age",getAge())
                .toString();
    }
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
    /**  导游id */
    private int id;
    /** 导游姓名 */
    private String name;
    /** 导游年龄 */
    private String phone;
    /** 资格审验信息 */
    private String address;
    /** 导游行程单申领状态 */
    private String info;
    /** 导游所属景区 */
    private String scenic;
    private String picture;


    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    private String qualification;

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    private int age;
}
