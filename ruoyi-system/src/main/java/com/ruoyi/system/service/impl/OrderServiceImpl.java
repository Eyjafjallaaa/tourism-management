package com.ruoyi.system.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.Order;
import com.ruoyi.system.mapper.OrderMapper;
import com.ruoyi.system.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 订单Service业务层处理
 * 
 * @author ...
 * @date 2022-03-13
 */
@Service
public class OrderServiceImpl implements IOrderService 
{
    @Autowired
    private OrderMapper orderMapper;

    /**
     * 查询订单
     * 
     * @param id 订单主键
     * @return 订单
     */
    @Override
    public Order selectOrderById(Integer id)
    {
        return orderMapper.selectOrderById(id);
    }

    /**
     * 查询订单列表
     * 
     * @param order 订单
     * @return 订单
     */
    @Override
    public List<Order> selectOrderList(Order order)
    {
        return orderMapper.selectOrderList(order);
    }

    /**
     * 新增订单
     * 
     * @param order 订单
     * @return 结果
     */
    @Override
    public int insertOrder(Order order)
    {
        order.setCreateTime(DateUtils.getNowDate());
        return orderMapper.insertOrder(order);
    }

    /**
     * 修改订单
     * 
     * @param order 订单
     * @return 结果
     */
    @Override
    public int updateOrder(Order order)
    {
        order.setUpdateTime(DateUtils.getNowDate());
        return orderMapper.updateOrder(order);
    }

    /**
     * 批量删除订单
     * 
     * @param ids 需要删除的订单主键
     * @return 结果
     */
    @Override
    public int deleteOrderByIds(Integer[] ids)
    {
        return orderMapper.deleteOrderByIds(ids);
    }

    /**
     * 删除订单信息
     * 
     * @param id 订单主键
     * @return 结果
     */
    @Override
    public int deleteOrderById(Integer id)
    {
        return orderMapper.deleteOrderById(id);
    }

    @Override
    public List<Order> selectOrderInfoList() {
        Long userId = SecurityUtils.getLoginUser().getUserId();
        return orderMapper.selectOrderInfoList(userId);
    }

    @Override
    public Map<String, Integer> revenue() {
        List<Order> orderList = orderMapper.selectOrderList(new Order());
        Map<String, Integer> map = new HashMap<>();
        map.put("01",0);map.put("02",0);map.put("03",0);map.put("04",0);map.put("05",0);map.put("06",0);
        map.put("07",0);map.put("08",0);map.put("09",0);map.put("10",0);map.put("11",0);map.put("12",0);
        if (orderList.size() > 0) {
            Map<String, List<Order>> listMap = orderList.stream().collect(Collectors.groupingBy(item -> new SimpleDateFormat("MM").format(item.getCreateTime())));
            for (Map.Entry<String, List<Order>> entry : listMap.entrySet()) {
                if (map.containsKey(entry.getKey())){
                    List<Order> value = entry.getValue();
                    int sum = value.stream().mapToInt(item -> Integer.parseInt(item.getPrice())).sum();
                    map.replace(entry.getKey(), sum);
                }
            }
        }
        return map;
    }

    @Override
    public Map<String, Integer> number() {
        List<Order> orderList = orderMapper.selectOrderList(new Order());
        Map<String, Integer> map = new HashMap<>();
        map.put("01",0);map.put("02",0);map.put("03",0);map.put("04",0);map.put("05",0);map.put("06",0);
        map.put("07",0);map.put("08",0);map.put("09",0);map.put("10",0);map.put("11",0);map.put("12",0);
        if (orderList.size() > 0) {
            Map<String, List<Order>> listMap = orderList.stream().collect(Collectors.groupingBy(item -> new SimpleDateFormat("MM").format(item.getCreateTime())));
            for (Map.Entry<String, List<Order>> entry : listMap.entrySet()) {
                if (map.containsKey(entry.getKey())){
                    map.replace(entry.getKey(), entry.getValue().size());
                }
            }
        }
        return map;
    }
}
