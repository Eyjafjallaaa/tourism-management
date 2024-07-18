import axios from 'axios'
import { Message } from 'element-ui'
import router from '@/router'
import qs from 'querystring'
import Cookies from 'js-cookie'
import agency from "@/views/agency.vue";
// create an axios instance
const service = axios.create({
  baseURL: 'http://localhost:8080',
  // baseURL:'http://127.0.0.1:8888',
  timeout: 5000 // request timeout
})

// response interceptor
service.interceptors.response.use(
  response => {
    // res就是后端返回来的结果， { status,message,data,timestamp}
    const res = response.data

    // if the custom code is not 20000, it is judged as an error.
    if (res.code !== 200) {
      // 消息弹框
      Message({ message: res.msg, type: 'error', duration: 5 * 1000 })
      if (res.code === 401) {
        logout()
      }
      // 返回承诺失败对象
      return Promise.reject(new Error(res.msg || 'Error'))
    } else {
      return res
    }
  },
  error => {
    console.log('err' + error) // for debug
    Message({
      message: error.msg,
      type: 'error',
      duration: 5 * 1000
    })
    return Promise.reject(error)
  }
)
export function get(url, params) {
  return service.get(url, {
    params, // get 请求时带的参数
    timeout: 10000,
    headers: {
      'X-Requested-With': 'XMLHttpRequest'
    }
  })
}
export function del(url, params) {
  return service.delete(url, {
    params, // get 请求时带的参数
    timeout: 10000,
    headers: {
      'X-Requested-With': 'XMLHttpRequest'
    }
  })
}

// 自定义post
export function post(url, data) {
  return service.post(url, qs.stringify(data), {
    timeout: 10000,
    headers: {
      'X-Requested-With': 'XMLHttpRequest',
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
    }
  })
}
// 获取验证码
export function getCodeImg() {
  return service.request({
    url: '/captchaImage',
    headers: {
      isToken: false
    },
    method: 'get',
    timeout: 20000
  })
}

// 注册
export function register(data) {
  return service.request({
    url: '/register',
    headers: {
      isToken: false
    },
    method: 'post',
    data: data
  })
}

// 登录方法
export function login(data) {
  return service.request({
    url: '/login',
    headers: {
      isToken: false
    },
    method: 'post',
    data: data
  })
}

// 获取用户详细信息
export function getInfo() {
  return service.request({
    url: '/getInfo',
    method: 'get',
    headers: {
      Authorization: "Bearer " + getToken(),
    },
  })
}

// 修改用户个人信息
export function updateUserProfile(data) {
  return service.request({
    url: '/system/user/profile',
    method: 'put',
    data: data,
    headers: {
      Authorization: "Bearer " + getToken(),
    },
  })
}
// 新增景点评价
export function addEvaluate(score,content,sid,sname) {
    const data = {
        score,content,sid,sname
    }
    return service.request({
        url: '/system/evaluate',
        method: 'post',
        data: data,
        headers: {
            Authorization: "Bearer " + getToken(),
        },
    })
}
export function updateUserPwd(oldPassword, newPassword) {
  const data = {
    oldPassword,
    newPassword
  }
  return service.request({
    url: '/system/user/profile/updatePwd',
    method: 'put',
    params: data,
    headers: {
      Authorization: "Bearer " + getToken(),
    },
  })
}

// 查询用户个人信息
export function getUserProfile() {
  return service.request({
    url: '/system/user/profile',
    method: 'get',
    headers: {
      Authorization: "Bearer " + getToken(),
    },
  })
}
// 新增点赞
export function addGood(data) {
    return service.request({
        url: '/system/good',
        method: 'post',
        data: data,
        headers: {
            Authorization: "Bearer " + getToken(),
        },
    })
}
// 查询点赞列表
export function listGoodSize(query) {
    return service.request({
        url: '/system/good/get',
        method: 'get',
        params: query,
        headers: {
            Authorization: "Bearer " + getToken(),
        },
    })
}
// 取消点赞
export function canGood(data) {
    return service.request({
        url: '/system/good/cancel',
        method: 'post',
        data: data,
        headers: {
            Authorization: "Bearer " + getToken(),
        },
    })
}
// 查询套餐列表
export function listPackages(query) {
  return service.request({
    url: '/system/packages/list',
    method: 'get',
    params: query
  })
}

// 查询套餐详细
export function getPackages(id) {
  return service.request({
    url: '/system/packages/' + id,
    method: 'get'
  })
}

// 查询景区详细
export function getScenicDetail(id) {
    return service.request({
        url: '/system/scenic/' + id,
        method: 'get'
    })
}
export function getGuideDetail(id) {
    return service.request({
        url: '/system/guide/' + id,
        method: 'get'
    })
}
export function getAgencyDetail(id) {
    return service.request({
        url: '/system/agency/' + id,
        method: 'get'
    })
}
// 查询景区详细
export function getList(sid) {
    return service.request({
        url: '/system/evaluate/getList',
        method: 'get',
        params:{
          sid:sid
        }
    })
}

// 查询全部景点列表
export function getScenic(query) {
    return service.request({
        url: '/system/scenic/list',
        method: 'get',
        params: query
    })

}
export function getGuide(query) {
    return service.request({
        url: '/system/guide/list',
        method: 'get',
        params: query
    })

}
// 推荐小吃列表
export function findTjFood(params) {
    return service.request({
        url: '/system/food/tuijian',
        method: 'get',
        params: params
    })
}
// 小吃列表
export function findFood(params) {
  return service.request({
    url: '/system/food/list',
    method: 'get',
    params: params
  })
}

export function updateAgencyReview(id, review) {
    return service.request({
        url: `/system/agency/${id}`,
        method: 'put',
        data: review
    });
}


export function findAgency(params) {
    return service.request({
        url: '/system/agency/list',
        method: 'get',
        params: params
    })
}
export function findComplain(params){
    return service.request({
        url: '/system/complain/list',
        method: 'get',
        params: params
    })
}

// 查询套餐详细
export function getPackage(id) {
  return service.request({
    url: '/system/packages/' + id,
    method: 'get'
  })
}

// 查询游记详细
export function getTravels(id) {
    return service.request({
        url: '/system/travels/' + id,
        method: 'get'
    })
}

// 新增套餐预定
export function addSchedule(data) {
  return service.request({
    url: '/system/order',
    method: 'post',
    data: data,
    headers: {
      Authorization: "Bearer " + getToken()
    }
  })
}
export function  addComplain(data){
    return service.request({
        url: '/system/complain',
        method: 'post',
        data: data,
        headers: {
            Authorization: "Bearer " + getToken()
        }
})}

// 新增套餐预定
export function addSchedule2(data) {
    return service.request({
        url: '/system/order/score',
        method: 'post',
        data: data,
        headers: {
            Authorization: "Bearer " + getToken()
        }
    })
}
// 查询游记列表
export function listTravels(query) {
    return service.request({
        url: '/system/travels/list',
        method: 'get',
        params: query
    })
}
export function hotTravels() {
    return service.request({
        url: '/system/travels/hot',
        method: 'get',
    })
}
// 新增游记
export function addTravels(data) {
    return service.request({
        url: '/system/travels',
        method: 'post',
        data: data,
        headers: {
            Authorization: "Bearer " + getToken()
        }
    })
}



// 修改套餐状态
export function changeStatus(id) {
    const data={
        id
    }
    return service.request({
        url: '/system/order/status',
        method: 'post',
        data: data,
        headers: {
            Authorization: "Bearer " + getToken()
        }
    })
}
// 查询小吃详细
export function getFood(id) {
    return service.request({
        url: '/system/food/' + id,
        method: 'get'
    })
}


export function cancel(id) {
    const data={
        id
    }
    return service.request({
        url: '/system/order/cancel',
        method: 'post',
        data: data,
        headers: {
            Authorization: "Bearer " + getToken()
        }
    })
}

// 查询预定列表
export function orderInfo() {
  return service.request({
    url: '/system/order/orderInfo',
    method: 'get',
    headers: {
      Authorization: "Bearer " + getToken(),
    },
  })
}

// 查询我的积分
export function getIntegral() {
    return service.request({
        url: '/system/viper/integral',
        method: 'get',
        headers: {
            Authorization: "Bearer " + getToken(),
        },
    })
}
// 查询我的评论列表
export function evaluateInfo() {
    return service.request({
        url: '/system/evaluate/my',
        method: 'get',
        headers: {
            Authorization: "Bearer " + getToken(),
        },
    })
}
// 查询我的游记列表
export function travelsInfo() {
    return service.request({
        url: '/system/travels/my',
        method: 'get',
        headers: {
            Authorization: "Bearer " + getToken(),
        },
    })
}
// 删除景点评价
export function delEvaluate(ids) {
    return service.request({
        url: '/system/evaluate/' + ids,
        method: 'delete',
        headers: {
            Authorization: "Bearer " + getToken(),
        },
    })
}
// 删除游记
export function delTravels(ids) {
    return service.request({
        url: '/system/travels/' + ids,
        method: 'delete',
        headers: {
            Authorization: "Bearer " + getToken(),
        },
    })
}

// 查询会员详细
export function getMember(id) {
    return service.request({
        url: '/system/member/' + id,
        method: 'get'
    })
}
// 新增会员
export function addViper(data) {
    return service.request({
        url: '/system/viper',
        method: 'post',
        data: data,
        headers: {
            Authorization: "Bearer " + getToken(),
        },
    })
}






const TokenKey = 'Portal-Token'
export function getToken() {
  return Cookies.get(TokenKey)
}

export function setToken(token) {
  return Cookies.set(TokenKey, token)
}

export function removeToken() {
  return Cookies.remove(TokenKey)
}

export function findRestaurant(params){
    return service.request({
        url: '/system/restaurant/list',
        method: 'get',
        params: params,
        headers: {
            Authorization: "Bearer " + getToken(),
        },
    })
}


// 查询景点
export function getRestaurant(id) {
    return service.request({
        url: '/system/restaurant/' + id,
        method: 'get',
        headers: {
            Authorization: "Bearer " + getToken(),
        },
    })
}
// 退出
async function logout() {
  router.push(`/login`)
}

service.interceptors.request.use(
    config => {
        const token = getToken(); // getToken 函数从Cookies或localStorage中获取Token
        if (token) {
            config.headers['Authorization'] = `Bearer ${token}`;
        }
        return config;
    },
    error => {
        return Promise.reject(error);
    }
);
export default service
// 获取单个导游详情的API接口


// 获取所有导游列表的API接口
export function getAllGuides() {
    return service.request({
        url: '/system/guide/list',
        method: 'get',
        params: query
    })

}

// 搜索导游的API接口，根据导游名、居住地和所属景区进行搜索
export function searchGuides(params) {
    return service.get('/system/guide/search', { params: params });
}
service.interceptors.request.use(
    config => {
        const token = getToken(); // getToken 函数从Cookies或localStorage中获取Token
        if (token) {
            config.headers['Authorization'] = `Bearer ${token}`;
        }
        return config;
    },
    error => {
        return Promise.reject(error);
    }
);