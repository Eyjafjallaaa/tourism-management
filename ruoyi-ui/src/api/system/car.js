import request from '@/utils/request'

// 查询小吃列表
export function listCar(query) {
  return request({
    url: '/system/car/list',
    method: 'get',
    params: query
  })
}

// 查询小吃详细
export function getCar(id) {
  return request({
    url: '/system/Car/' + id,
    method: 'get'
  })
}

// 新增小吃
export function addCar(data) {
  return request({
    url: '/system/Car',
    method: 'post',
    data: data
  })
}

// 修改小吃
export function updateCar(data) {
  return request({
    url: '/system/Car',
    method: 'put',
    data: data
  })
}

// 删除小吃
export function delCar(id) {
  return request({
    url: '/system/Car/' + id,
    method: 'delete'
  })
}
