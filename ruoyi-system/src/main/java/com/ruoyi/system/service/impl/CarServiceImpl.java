package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.system.mapper.AgencyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CarMapper;
import com.ruoyi.system.domain.Car;
import com.ruoyi.system.service.ICarService;

@Service
public class CarServiceImpl implements ICarService
{
    @Autowired
    private CarMapper carMapper;
    /**
     * 查询车辆
     *
     * @param licensePlate 车牌号
     * @return 车辆
     */
    public Car selectCarByLicensePlate(String licensePlate){
        return carMapper.selectCarByLicensePlate(licensePlate);
    }

    /**
     * 查询车辆列表
     *
     * @param car 车辆
     * @return 车辆集合
     */
    public List<Car> selectCarList(){
        return carMapper.selectCarList();
    }

    /**
     * 新增车辆
     *
     * @param car 车辆
     * @return 结果
     */
    public int insertCar(Car car){
        return carMapper.insertCar(car);
    }

    /**
     * 修改车辆
     *
     * @param car 车辆
     * @return 结果
     */
    public int updateCar(Car car){
        return carMapper.updateCar(car);
    }

    /**
     * 删除车辆
     *
     * @param licensePlate 车牌号
     * @return 结果
     */
    public int deleteCarByLicensePlate(String licensePlate){
        return carMapper.deleteCarByLicensePlate(licensePlate);
    }

    /**
     * 批量删除车辆
     *
     * @param licensePlates 需要删除的车牌号集合
     * @return 结果
     */
    public int deleteCarByLicensePlates(String[] licensePlates){
        return carMapper.deleteCarByLicensePlates(licensePlates);
    }
}
