import request from '@/utils/request'

// 查询游记列表
export function listTravels(query) {
  return request({
    url: '/system/travels/list',
    method: 'get',
    params: query
  })
}

// 查询游记详细
export function getTravels(id) {
  return request({
    url: '/system/travels/' + id,
    method: 'get'
  })
}

// 新增游记
export function addTravels(data) {
  return request({
    url: '/system/travels',
    method: 'post',
    data: data
  })
}

// 修改游记
export function updateTravels(data) {
  return request({
    url: '/system/travels',
    method: 'put',
    data: data
  })
}

// 删除游记
export function delTravels(id) {
  return request({
    url: '/system/travels/' + id,
    method: 'delete'
  })
}
