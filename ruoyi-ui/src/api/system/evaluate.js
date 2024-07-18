import request from '@/utils/request'

// 查询景点评价列表
export function listEvaluate(query) {
  return request({
    url: '/system/evaluate/list',
    method: 'get',
    params: query
  })
}

// 查询景点评价详细
export function getEvaluate(id) {
  return request({
    url: '/system/evaluate/' + id,
    method: 'get'
  })
}

// 新增景点评价
export function addEvaluate(data) {
  return request({
    url: '/system/evaluate',
    method: 'post',
    data: data
  })
}

// 修改景点评价
export function updateEvaluate(data) {
  return request({
    url: '/system/evaluate',
    method: 'put',
    data: data
  })
}

// 删除景点评价
export function delEvaluate(id) {
  return request({
    url: '/system/evaluate/' + id,
    method: 'delete'
  })
}
