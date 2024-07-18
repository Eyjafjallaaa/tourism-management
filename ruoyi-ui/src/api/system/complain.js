import request from '@/utils/request'

// 查询小吃列表
export function listComplain(query) {
  return request({
    url: '/system/complain/list',
    method: 'get',
    params: query
  })
}

// 查询小吃详细
export function getComplain(id) {
  return request({
    url: '/system/complain/' + id,
    method: 'get'
  })
}

// 新增小吃
export function addComplain(data) {
  return request({
    url: '/system/complain',
    method: 'post',
    data: data
  })
}

// 修改小吃
export function updateComplain(data) {
  return request({
    url: '/system/complain',
    method: 'put',
    data: data
  })
}

// 删除小吃
export function delComplain(id) {
  return request({
    url: '/system/complain/' + id,
    method: 'delete'
  })
}
