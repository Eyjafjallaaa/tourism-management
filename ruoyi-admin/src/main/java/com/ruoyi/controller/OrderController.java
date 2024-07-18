package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Order;
import com.ruoyi.system.domain.Viper;
import com.ruoyi.system.service.IOrderService;
import com.ruoyi.system.service.IViperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * 订单Controller
 * 
 * @author ...
 * @date 2022-03-13
 */
@RestController
@RequestMapping("/system/order")
public class OrderController extends BaseController
{
    @Autowired
    private IOrderService orderService;
    @Autowired
    private IViperService viperService;
    /**
     * 查询订单列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Order order)
    {
        startPage();
        List<Order> list = orderService.selectOrderList(order);
        return getDataTable(list);
    }

    /**
     * 获取订单详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Integer id)
    {
        return AjaxResult.success(orderService.selectOrderById(id));
    }

    /**
     * 新增订单
     */
    @PostMapping
    public AjaxResult add(@RequestBody Order order)
    {
        order.setStatus("未出行");
        int total = Integer.parseInt(order.getPrice()) * order.getNum();
        order.setPrice(String.valueOf(total));
        order.setCreateTime(DateUtils.getNowDate());
        order.setCreateUser(SecurityUtils.getUserId().intValue());
        Viper viper =new Viper();
        viper.setUid(SecurityUtils.getUserId().intValue());
        List<Viper> vipers = viperService.selectViperList(viper);
        if (vipers.size()==1){
            Viper viper1 = vipers.get(0);
            int integral = Integer.parseInt(viper1.getIntegral());
            integral= integral+total;
            viper1.setIntegral(String.valueOf(integral));
            viperService.updateViper(viper1);
        }
        int i = orderService.insertOrder(order);
        order.setDanjia(Integer.parseInt(order.getPrice())/order.getNum());
        List<Order> list =new ArrayList<>();
        list.add(order);
        if (i>0){
            return AjaxResult.success(list);
        } else {
            return AjaxResult.error();
        }
    }

    /**
     * 新增订单
     */
    @PostMapping("/score")
    public AjaxResult score(@RequestBody Order order)
    {
        Viper viper =new Viper();
        viper.setUid(SecurityUtils.getUserId().intValue());
        List<Viper> vipers = viperService.selectViperList(viper);
        Assert.isTrue(vipers.size()==1,"你当前还不是会员");
        Viper viper1 = vipers.get(0);
        int res = Integer.parseInt(viper1.getIntegral());
        int integral = Integer.parseInt(order.getIntegral());
        Assert.isTrue(integral>=1000,"积分不足");
        int flag = integral/1000;
        order.setStatus("未出行");
        int total = Integer.parseInt(order.getPrice()) * order.getNum()-10*flag;
        order.setPrice(String.valueOf(total));
        order.setCreateTime(DateUtils.getNowDate());
        order.setCreateUser(SecurityUtils.getUserId().intValue());
        res=res-1000*flag+total;
        viper1.setIntegral(String.valueOf(res));
        viperService.updateViper(viper1);
        int i = orderService.insertOrder(order);
        order.setDanjia(Integer.parseInt(order.getPrice())/order.getNum());
        List<Order> list =new ArrayList<>();
        list.add(order);
        if (i>0){
            return AjaxResult.success(list);
        } else {
            return AjaxResult.error();
        }
    }

    /**
     * 订单
     * @return
     */
    @GetMapping("/orderInfo")
    public AjaxResult orderInfo() {
        List<Order> data = orderService.selectOrderInfoList();
        return AjaxResult.success(data);
    }

    /**
     * 营业数量统计
     * @return
     */
    @GetMapping("/number")
    public AjaxResult number(){
        return AjaxResult.success(orderService.number());
    }

    /**
     * 营业额统计
     * @return
     */
    @GetMapping("/revenue")
    public AjaxResult revenue(){
        return AjaxResult.success(orderService.revenue());
    }

    @PostMapping("/status")
    public AjaxResult status(@RequestBody Order order)
    {
        order.setStatus("已出行");
        order.setUpdateTime(DateUtils.getNowDate());
        order.setUpdateUser(SecurityUtils.getUserId().intValue());
        return toAjax(orderService.updateOrder(order));
    }

    @PostMapping("/cancel")
    public AjaxResult cancel(@RequestBody Order order)
    {
        order.setStatus("已取消");
        order.setUpdateTime(DateUtils.getNowDate());
        order.setUpdateUser(SecurityUtils.getUserId().intValue());
        int i = orderService.updateOrder(order);
        if(i>0){
            List<Order> list = new ArrayList<>();
            Order order1 = orderService.selectOrderById(order.getId());
            if ("会员".equals(SecurityUtils.getLoginUser().getUser().getRemark())){
                order1.setCancelMoney(order1.getPrice());
             list.add(order1);
             return AjaxResult.success(list);
         }else {
                double v1 = Integer.parseInt(order1.getPrice()) * 0.8;
                order1.setCancelMoney(String.format("%.2f", v1));
                list.add(order1);
             return AjaxResult.success(list);
         }
        }else {
            return AjaxResult.error();
        }
    }
    /**
     * 修改订单
     */
    @PutMapping
    public AjaxResult edit(@RequestBody Order order)
    {
        order.setUpdateTime(DateUtils.getNowDate());
        order.setUpdateUser(SecurityUtils.getUserId().intValue());
        return toAjax(orderService.updateOrder(order));
    }

    /**
     * 删除订单
     */
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Integer[] ids)
    {
        return toAjax(orderService.deleteOrderByIds(ids));
    }
}
