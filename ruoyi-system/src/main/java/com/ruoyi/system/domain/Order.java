package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.springframework.data.annotation.Transient;

/**
 * 订单对象 order
 * 
 * @author ...
 * @date 2022-03-13
 */
public class Order extends BaseEntity
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

    /** 订单价格 */
    @Excel(name = "订单价格")
    private String price;

    /** 出行人数 */
    @Excel(name = "出行人数")
    private Integer num;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

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
    private String integral;

    @Transient
    private Integer danjia;

    public Integer getDanjia() {
        return danjia;
    }

    @Transient
    public String cancelMoney;

    public String getCancelMoney() {
        return cancelMoney;
    }

    public void setCancelMoney(String cancelMoney) {
        this.cancelMoney = cancelMoney;
    }

    public void setDanjia(Integer danjia) {
        this.danjia = danjia;
    }

    public String getIntegral() {
        return integral;
    }

    public void setIntegral(String integral) {
        this.integral = integral;
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
    public void setPrice(String price) 
    {
        this.price = price;
    }

    public String getPrice() 
    {
        return price;
    }
    public void setNum(Integer num)
    {
        this.num = num;
    }

    public Integer getNum()
    {
        return num;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
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
            .append("price", getPrice())
            .append("number", getNum())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .append("isDeleted", getIsDeleted())
            .toString();
    }
}
