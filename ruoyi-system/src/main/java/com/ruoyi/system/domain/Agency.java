package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
public class Agency extends BaseEntity {

    private static final long serialVersionUID = 1L;
    /** 旅行社编号（主键） */
    private int id;
    private String phone;
    private String name;
    private String location;
    private int finishedWorkNumber;
    private int positive;
    private String integrity;
    private int evaluations;
    private int managerId;
    private int doctorId;
    private String itineraryInfo;
    private String picture;
    private String creatTime;
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

    public String getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(String creatTime) {
        this.creatTime = creatTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getFinishedWorkNumber() {
        return finishedWorkNumber;
    }

    public void setFinishedWordNumber(int finishedWordNumber) {
        this.finishedWorkNumber = finishedWordNumber;
    }

    public int getPositive() {
        return positive;
    }

    public void setPositive(int positive) {
        this.positive = positive;
    }

    public String getIntegrity() {
        return integrity;
    }

    public void setIntegrityStatus(String integrityStatus) {
        this.integrity = integrityStatus;
    }

    public int getEvaluations() {
        return evaluations;
    }

    public void setEvaluations(int evaluations) {
        this.evaluations = evaluations;
    }

    public void setIntegrity(String integrity) {
        this.integrity = integrity;
    }

    public int getManagerId() {
        return managerId;
    }

    public void setManagerId(int managerId) {
        this.managerId = managerId;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public String getItineraryInfo() {
        return itineraryInfo;
    }

    public void setItineraryInfo(String itineraryInfo) {
        this.itineraryInfo = itineraryInfo;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }
}