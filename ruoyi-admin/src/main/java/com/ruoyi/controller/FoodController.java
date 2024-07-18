package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.web.domain.server.Sys;
import com.ruoyi.system.domain.Food;
import com.ruoyi.system.service.IFoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 小吃Controller
 * 
 * @author ...
 * @date 2022-03-13
 */
@RestController
@RequestMapping("/system/food")
public class FoodController extends BaseController
{
    @Autowired
    private IFoodService foodService;

    /**
     * 查询小吃列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Food food)
    {
        startPage();
        List<Food> list = foodService.selectFoodList(food);
        return getDataTable(list);
    }
    @GetMapping("/all")
    public List<Food> all(){
        List<Food> list = foodService.getAll();
        return list;
    }

    /**
     * 推荐食物
     * @param food
     * @return
     */
    @GetMapping("/tuijian")
    public AjaxResult tuijian(Food food){
        List<Food> list = foodService.selectFoodList(food);
        List<Food> collect = list.stream().limit(5).collect(Collectors.toList());
        return AjaxResult.success(collect);
    }

    /**
     * 获取小吃详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        Food food = foodService.selectFoodById(id);
        if (food != null) {
        String restaurant = food.getRestaurant();
        String[] split = restaurant.split(",");
        List<String> list = new ArrayList<>();
        for (String s : split) {
            list.add(s);
        }
        food.setList(list);
        return AjaxResult.success(food);}
        else return AjaxResult.error("获取失败");
    }

    /**
     * 新增小吃
     */
    @PostMapping
    public AjaxResult add(@RequestBody Food food)
    {
        food.setCreateTime(DateUtils.getNowDate());
        food.setCreateUser(SecurityUtils.getUserId().intValue());
        return toAjax(foodService.insertFood(food));
    }

    /**
     * 修改小吃
     */
    @PutMapping
    public AjaxResult edit(@RequestBody Food food)
    {
        food.setUpdateTime(DateUtils.getNowDate());
        food.setUpdateUser(SecurityUtils.getUserId().intValue());
        return toAjax(foodService.updateFood(food));
    }

    /**
     * 删除小吃
     */
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(foodService.deleteFoodByIds(ids));
    }
}
