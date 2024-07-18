import request from '@/utils/request'

// 查询旅游套餐列表
export function listPackages(query) {
  return request({
    url: '/system/packages/list',
    method: 'get',
    params: query
  })
}

// 查询旅游套餐详细
export function getPackages(id) {
  return request({
    url: '/system/packages/' + id,
    method: 'get'
  })
}

// 新增旅游套餐
export function addPackages(data) {
  return request({
    url: '/system/packages',
    method: 'post',
    data: data
  })
}

// 修改旅游套餐
export function updatePackages(data) {
  return request({
    url: '/system/packages',
    method: 'put',
    data: data
  })
}

// 删除旅游套餐
export function delPackages(id) {
  return request({
    url: '/system/packages/' + id,
    method: 'delete'
  })
}

// 查询景点列表
export function getScenic() {
  return request({
    url: '/system/scenic/all',
    method: 'get',
  })
}
