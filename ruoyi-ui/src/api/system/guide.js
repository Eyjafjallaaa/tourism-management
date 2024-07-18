import request from '@/utils/request';

// 查询导游列表
export function listGuide(query) {
  return request({
    url: '/system/guide/list',
    method: 'get',
    params: query
  })
}
export function getGuide(id) {
  return request({
    url: '/system/guide/' + id,
    method: 'get'
  })
}
export function addGuide(data) {
  return request({
    url: '/system/guide',
    method: 'post',
    data: data
  })
}
export function updateGuide(data) {
  return request({
    url: '/system/guide',
    method: 'put',
    data: data
  })
}
export function delGuide(id) {
  return request({
    url: '/system/guide/' + id,
    method: 'delete'
  })
}
