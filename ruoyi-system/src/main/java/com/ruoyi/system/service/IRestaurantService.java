package com.ruoyi.system.service;

import com.ruoyi.system.domain.Restaurant;

import java.util.List;

public interface IRestaurantService {
    public Restaurant selectRestaurantById(Integer id);

    public List<Restaurant>selectRestaurantList(Restaurant restaurant);
    public int insertRestaurant(Restaurant restaurant);
    public int updateRestaurant(Restaurant restaurant);
    public int deleteRestaurantByIds(Integer[] ids);
    List<Restaurant>getAll();
}
