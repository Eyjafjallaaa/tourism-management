import request from '@/utils/request'

// 查询景点列表
export function listScenic(query) {
  return request({
    url: '/system/scenic/list',
    method: 'get',
    params: query
  })
}

// 查询景点详细
export function getScenic(id) {
  return request({
    url: '/system/scenic/' + id,
    method: 'get'
  })
}


// 新增景点
export function addScenic(data) {
  return request({
    url: '/system/scenic',
    method: 'post',
    data: data
  })
}

// 修改景点
export function updateScenic(data) {
  return request({
    url: '/system/scenic',
    method: 'put',
    data: data
  })
}

// 删除景点
export function delScenic(id) {
  return request({
    url: '/system/scenic/' + id,
    method: 'delete'
  })
}
