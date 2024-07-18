# 基于springboot的旅游管理调度系统

## 1、项目介绍

基于springboot的旅游景点管理系统拥有两种角色

管理员：用户管理、数据可视化分析、景点管理、饭店管理、套餐管理、投诉管理、评价管理、游记管理、美食管理、订单管理、导游和旅行社管理等

用户：预订景点套餐，饭店点单，查看订单，修改个人信息，评价，投诉，查看导游、旅行社、车辆信息等


## 2、项目技术

管理员端借鉴了若依框架

后端框架：Springboot

前端技术：Vue+Element、CSS、JavaScript、JQuery

## 3、开发环境

- JAVA版本：JDK11
- 数据库：MySql 8
- maven版本：无限制
- 硬件环境：Windows 或者 Mac OS

## 4、如何运行

后端：

1. 配置jdk
2. 更新maven
3. 修改数据库信息（在application-druid.yml)
4. 修改logback.xml为logs文件夹的在本机的绝对地址
5. 修改application.yml中profile地址为img文件夹的绝对地址，检查redis地址
6. 点击右上角运行按钮运行

前端：

用户端启动

```bash
cd tourist-ui
npm run serve
```

管理员端启动

```bash
cd ruoyi-ui
npm run dev
```

若有版本问题，参考



```bash
export NODE_OPTIONS=--openssl-legacy-provider
```

## 5、功能介绍

### 5.1 用户端主页

![主页1](ScreenShot/主页1.jpg)

![主页2](ScreenShot/主页2.jpg)

![主页3](ScreenShot/主页3.jpg)

![主页4](ScreenShot/主页4.jpg)

### 5.2 用户端功能

![前端-旅游景点](ScreenShot/景点.jpg)

![前端](ScreenShot/景区内容.jpg)

![前端-旅游游记](ScreenShot/游记.jpg)

![前端-饭店](ScreenShot/饭店.jpg)![前端-饭店](ScreenShot/美食购买.jpg)

![前端-导游](ScreenShot/导游.jpg)

![前端-投诉](ScreenShot/投诉.jpg)

![前端](ScreenShot/旅行社.jpg)

![前端](ScreenShot/车辆实时查看.jpg)

![前端](ScreenShot/个人中心.jpg)

### 5.3 管理员模块

![前端](ScreenShot/管理员登录.jpg)

![前端](ScreenShot/大屏.jpg)

![前端](ScreenShot/添加.jpg)

![前端](ScreenShot/评价管理.jpg)
