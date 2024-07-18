package com.ruoyi.common.core.domain.model;

/**
 * 用户注册对象
 *
 * @author ...
 */
public class RegisterBody extends LoginBody {
    private String phone;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
