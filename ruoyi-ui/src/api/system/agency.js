import request from '@/utils/request'
import service from "@/utils/request";

// 查询旅游社列表
export function listAgency(query) {
  return request({
    url: '/system/agency/list',
    method: 'get',
    params: query
  })
}
// 查询旅行社详细
export function getAgency(id) {
  return request({
    url: '/system/agency/' + id,
    method: 'get'
  })
}
// 新增
export function addAgency(data) {
  return request({
    url: '/system/agency',
    method: 'post',
    data: data
  })
}
// 修改
export function updateAgency(id, review) {
  return service.request({
    url: `/system/agency/${id}`,
    method: 'put',
    data: review
  });
}
// 删除
export function delAgency(id) {
  return request({
    url: '/system/agency/' + id,
    method: 'delete'
  })
}
