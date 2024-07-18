import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)
const routes = [
    {
        path: "/",
        name: "Loading",
        component: () => import('../views/Loading.vue'),
        meta: { hideHeadAndFoot: true }
    },
  {
    path: "/",
    redirect: "/home"
  },
  {
    path: '/home',
    name: 'Home',
    meta: {
      scrollToTop: true
    },
    component: () => import('../views/Home.vue')
  },  {
    path: '/register',
    name: 'Register',
    meta: {
      scrollToTop: true
    },
    component: () => import('../views/register.vue')
  }, {
    path: '/login',
    name: 'Login',
    meta: {
      scrollToTop: true
    },
    component: () => import('../views/login.vue')
  }, {
    path: '/person',
    name: 'Person',
    meta: {
      scrollToTop: true
    },
    component: () => import('../views/person.vue')
  }, {
    path: '/food',
    name: 'Food',
    meta: {
      scrollToTop: true
    },
    component: () => import('../views/food.vue')
  },
    {
        path: '/restaurant',
        name: 'Restaurant',
        meta: {
            scrollToTop: true
        },
        component: () => import('../views/restaurant.vue')
    },
    {
        path: '/guides',
        name: 'Guides',
        meta: {
            scrollToTop: true
        },
        component: () => import('../views/guide.vue')
    },
    {
        path: '/agency',
        name: 'Agency',
        meta: {
            scrollToTop: true
        },
        component: () => import('../views/agency.vue')
    },
    {
        path: '/agencyDetail',
        name: 'AgencyDetail',
        meta: {
            scrollToTop: true
        },
        component: () => import('../views/agencyDetail.vue')
    },
    {
        path: '/complaints',
        name: 'Complaints',
        meta: {
            scrollToTop: true
        },
        component: () => import('../views/complaints.vue')
    },
  {
    path: '/packageDetail',
    name: 'PackageDetail',
    meta: {
      scrollToTop: true
    },
    component: () => import('../views/packageDetail.vue')
  }, {
    path: '/scenic',
    name: 'Scenic',
    meta: {
      scrollToTop: true
    },
    component: () => import('../views/scenic.vue')
  },{
        path: '/submitTravels',
        name: 'SubmitTravels',
        meta: {
            scrollToTop: true
        },
        component: () => import('../views/submitTravels.vue')
    },{
        path: '/scenicDetail',
        name: 'ScenicDetail',
        meta: {
            scrollToTop: true
        },
        component: () => import('../views/scenicDetail.vue')
    },{
        path: '/guideDetail',
        name: 'GuideDetail',
        meta: {
            scrollToTop: true
        },
        component: () => import('../views/guideDetail.vue')
    },  {
    path: '/travels',
    name: 'Travels',
    meta: {
      scrollToTop: true
    },
    component: () => import('../views/travels.vue')
  }, {
        path: '/travelsDetail',
        name: 'TravelsDetail',
        meta: {
            scrollToTop: true
        },
        component: () => import('../views/travelsDetail.vue')
    }, {
        path: '/foodDetail',
        name: 'FoodDetail',
        meta: {
            scrollToTop: true
        },
        component: () => import('../views/foodDetail.vue')
    },
    {
        path: '/restaurantDetail',
        name: 'RestaurantDetail',
        meta: {
            scrollToTop: true
        },
        component: () => import('../views/restaurantDetail.vue')
    },
    {
        path: '/cars',
        name: 'Cars',
        meta: {
            scrollToTop: true
        },
        component: () => import('../views/map/carMap.vue')
    }

]

const router = new VueRouter({
  mode: 'hash',
  base: process.env.BASE_URL,
  routes
})

export default router
