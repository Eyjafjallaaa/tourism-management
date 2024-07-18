import request from '@/utils/request'

// 查询景点列表
export function listRestaurant(query) {
  return request({
    url: '/system/restaurant/list',
    method: 'get',
    params: query
  })
}

// 查询景点详细
export function getRestaurant(id) {
  return request({
    url: '/system/restaurant/' + id,
    method: 'get'
  })
}

// 新增景点
export function addRestaurant(data) {
  return request({
    url: '/system/restaurant',
    method: 'post',
    data: data
  })
}

// 修改景点
export function updateRestaurant(data) {
  return request({
    url: '/system/restaurant',
    method: 'put',
    data: data
  })
}

// 删除景点
export function delRestaurant(id) {
  return request({
    url: '/system/restaurant/' + id,
    method: 'delete'
  })
}
