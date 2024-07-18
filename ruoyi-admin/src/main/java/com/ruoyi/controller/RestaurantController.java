package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.system.domain.Restaurant;
import com.ruoyi.system.service.IRestaurantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/system/restaurant")
public class RestaurantController extends BaseController {
    @Autowired
    IRestaurantService restaurantService;
    @GetMapping("/list")
    public TableDataInfo list(Restaurant restaurant) {
       startPage();
        List<Restaurant> list = restaurantService.selectRestaurantList(restaurant);
        return getDataTable(list);
    }
    @GetMapping("/all")
    public List<Restaurant> getAll() {
        return restaurantService.getAll();
    }
    @GetMapping(value = "/{id}")
    public AjaxResult getRestaurantById(@PathVariable("id") Integer id) {
        return AjaxResult.success(restaurantService.selectRestaurantById(id));
    }

    @PostMapping
    public AjaxResult add(@RequestBody Restaurant restaurant) {
        return toAjax(restaurantService.insertRestaurant(restaurant));
    }
    @PutMapping
    public AjaxResult update(@RequestBody Restaurant restaurant) {
        return toAjax(restaurantService.updateRestaurant(restaurant));
    }
    @DeleteMapping("/{ids}")
    public AjaxResult delete(@PathVariable("ids") Integer[] ids) {
        return toAjax(restaurantService.deleteRestaurantByIds(ids));
    }
}
