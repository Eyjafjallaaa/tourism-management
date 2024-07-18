package com.ruoyi.system.service.impl;

import com.ruoyi.system.domain.Restaurant;
import com.ruoyi.system.mapper.RestaurantMapper;
import com.ruoyi.system.service.IRestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RestaurantServiceImpl implements IRestaurantService {
    @Autowired
    RestaurantMapper restaurantMapper;
    @Override
    public Restaurant selectRestaurantById(Integer id) {

        return restaurantMapper.selectRestaurantById(id);
    }

    @Override
    public List<Restaurant> selectRestaurantList(Restaurant restaurant) {
        return restaurantMapper.selectRestaurantList(restaurant);
    }

    @Override
    public int insertRestaurant(Restaurant restaurant) {
        return restaurantMapper.insertRestaurant(restaurant);
    }

    @Override
    public int updateRestaurant(Restaurant restaurant) {
        return restaurantMapper.updateRestaurant(restaurant);
    }

    @Override
    public int deleteRestaurantByIds(Integer[] ids) {
        return restaurantMapper.deleteRestaurantByIds(ids);
    }

    @Override
    public List<Restaurant> getAll() {
        return restaurantMapper.getAll();
    }
}
