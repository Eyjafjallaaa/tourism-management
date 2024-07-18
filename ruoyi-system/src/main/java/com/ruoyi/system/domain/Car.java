package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 车辆对象 Car
 *
 * @author ...
 * @date 2022-03-13
 */
public class Car extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 车牌号（主键） */
    private String licensePlate;

    /** 车型 */
    @Excel(name = "车型")
    private String model;

    /** 颜色 */
    @Excel(name = "颜色")
    private String color;

    /** 制造商 */
    @Excel(name = "制造商")
    private String manufacturer;

    /** 创建人 */
    @Excel(name = "创建人")
    private Integer createUser;

    /** 修改人 */
    @Excel(name = "修改人")
    private Integer updateUser;

    /** 是否已删除 */
    @Excel(name = "是否已删除")
    private Integer isDeleted;

    public void setLicensePlate(String licensePlate) {
        this.licensePlate = licensePlate;
    }

    public String getLicensePlate() {
        return licensePlate;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getModel() {
        return model;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getColor() {
        return color;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getManufacturer() {
        return manufacturer;
    }


    public void setCreateUser(Integer createUser) {
        this.createUser = createUser;
    }

    public Integer getCreateUser() {
        return createUser;
    }

    public void setUpdateUser(Integer updateUser) {
        this.updateUser = updateUser;
    }

    public Integer getUpdateUser() {
        return updateUser;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("licensePlate", getLicensePlate())
                .append("model", getModel())
                .append("color", getColor())
                .append("manufacturer", getManufacturer())
                .append("createTime", getCreateTime())
                .append("createUser", getCreateUser())
                .append("updateTime", getUpdateTime())
                .append("updateUser", getUpdateUser())
                .append("isDeleted", getIsDeleted())
                .toString();
    }
}