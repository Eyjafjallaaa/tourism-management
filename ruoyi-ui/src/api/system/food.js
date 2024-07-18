import request from '@/utils/request'

// 查询小吃列表
export function listFood(query) {
  return request({
    url: '/system/food/list',
    method: 'get',
    params: query
  })
}

// 查询小吃详细
export function getFood(id) {
  return request({
    url: '/system/food/' + id,
    method: 'get'
  })
}

// 新增小吃
export function addFood(data) {
  return request({
    url: '/system/food',
    method: 'post',
    data: data
  })
}

// 修改小吃
export function updateFood(data) {
  return request({
    url: '/system/food',
    method: 'put',
    data: data
  })
}

// 删除小吃
export function delFood(id) {
  return request({
    url: '/system/food/' + id,
    method: 'delete'
  })
}
