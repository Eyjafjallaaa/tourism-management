import request from '@/utils/request'



// 数据统计
export function revenue() {
  return request({
    url: '/system/order/revenue',
    method: 'get'
  })
}

// 数据统计
export function getNum() {
  return request({
    url: '/system/order/number',
    method: 'get'
  })
}
