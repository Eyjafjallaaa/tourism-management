import request from '@/utils/request'

// 查询会员列表
export function listViper(query) {
  return request({
    url: '/system/viper/list',
    method: 'get',
    params: query
  })
}

// 查询会员详细
export function getViper(id) {
  return request({
    url: '/system/viper/' + id,
    method: 'get'
  })
}

// 新增会员
export function addViper(data) {
  return request({
    url: '/system/viper',
    method: 'post',
    data: data
  })
}

// 修改会员
export function updateViper(data) {
  return request({
    url: '/system/viper',
    method: 'put',
    data: data
  })
}

// 删除会员
export function delViper(id) {
  return request({
    url: '/system/viper/' + id,
    method: 'delete'
  })
}
