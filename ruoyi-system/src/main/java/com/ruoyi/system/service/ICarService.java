package com.ruoyi.system.service;

import com.ruoyi.system.domain.Car;

import java.util.List;

public interface ICarService
{
    /**
     * 查询车辆
     *
     * @param licensePlate 车牌号
     * @return 车辆
     */
    public Car selectCarByLicensePlate(String licensePlate);

    /**
     * 查询车辆列表
     *
     * @param car 车辆
     * @return 车辆集合
     */
    public List<Car> selectCarList();

    /**
     * 新增车辆
     *
     * @param car 车辆
     * @return 结果
     */
    public int insertCar(Car car);

    /**
     * 修改车辆
     *
     * @param car 车辆
     * @return 结果
     */
    public int updateCar(Car car);

    /**
     * 删除车辆
     *
     * @param licensePlate 车牌号
     * @return 结果
     */
    public int deleteCarByLicensePlate(String licensePlate);

    /**
     * 批量删除车辆
     *
     * @param licensePlates 需要删除的车牌号集合
     * @return 结果
     */
    public int deleteCarByLicensePlates(String[] licensePlates);

}
