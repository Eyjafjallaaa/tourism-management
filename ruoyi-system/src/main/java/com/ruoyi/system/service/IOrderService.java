package com.ruoyi.system.service;

import com.ruoyi.system.domain.Order;

import java.util.List;
import java.util.Map;

/**
 * 订单Service接口
 * 
 * @author ...
 * @date 2022-03-13
 */
public interface IOrderService 
{
    /**
     * 查询订单
     * 
     * @param id 订单主键
     * @return 订单
     */
    public Order selectOrderById(Integer id);

    /**
     * 查询订单列表
     * 
     * @param order 订单
     * @return 订单集合
     */
    public List<Order> selectOrderList(Order order);

    /**
     * 新增订单
     * 
     * @param order 订单
     * @return 结果
     */
    public int insertOrder(Order order);

    /**
     * 修改订单
     * 
     * @param order 订单
     * @return 结果
     */
    public int updateOrder(Order order);

    /**
     * 批量删除订单
     * 
     * @param ids 需要删除的订单主键集合
     * @return 结果
     */
    public int deleteOrderByIds(Integer[] ids);

    /**
     * 删除订单信息
     * 
     * @param id 订单主键
     * @return 结果
     */
    public int deleteOrderById(Integer id);

    /**
     * 订单
     * @return
     */
    List<Order> selectOrderInfoList();

    /**
     * 营业额
     * @return
     */
    Map<String,Integer> revenue();

    /**
     * 营业额数量
     * @return
     */
    Map<String,Integer> number();
}
