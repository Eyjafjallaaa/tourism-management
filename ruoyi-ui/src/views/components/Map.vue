<template>
  <div class="map"  />
</template>

<script>
// 城市坐标文件
import City from '@/utils/City'
import '@/utils/china'
export default {
  props: {
    //provinces 数据格式  要求 name：城市地区， value：迁徙人数
    provinces: {
      type: Array,
      default() {
        return {}
      }
    },
    // 终点位置位置
    end:{
      type: String,
      default: '上海'
    }
  },
  watch: {
    provinces: {
      handler() {
        this.getMap()
      },
      deep: true
    },
  },
  mounted() {
    this.getMap()
  },
  methods: {
    // 地图
    getMap() {
      // 地图的坐标信息
      var geoCoordMap = City
      // const a = [{ 'name': '北京', 'value': 6 }, { 'name': '湖南', 'value': 3 }, { 'name': '广东', 'value': 2 }, { 'name': '山西', 'value': 2 }, { 'name': '上海', 'value': 1 }, { 'name': '重庆', 'value': 1 }, { 'name': '河北', 'value': 1 }, { 'name': '陕西', 'value': 1 }, { 'name': '山东', 'value': 0 }, { 'name': '黑龙江', 'value': 0 }, { 'name': '贵州', 'value': 0 }]
      // 数据信息
      var BJData = this.provinces.filter(item => item.value > 0).map(item => {
        return [{
          name: this.end
        },
          {
            name: item.name,
            value: item.value
          }]
      })

      // var planePath = 'path://M.6,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705'
      // var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z'
      var planePath = 'arrow';
      var convertData = function(data) {
        // data BJData
        var res = []
        for (var i = 0; i < data.length; i++) {
          // BJData
          var dataItem = data[i]
          var fromCoord = geoCoordMap[dataItem[0].name] // 北京
          var toCoord = geoCoordMap[dataItem[1].name] // 成都
          if (fromCoord && toCoord) {
            res.push([{
              coord: toCoord,
              value: dataItem[1].value
            }, {
              coord: fromCoord
            }])
          }
        }
        return res
      }
      var series = [];
      [
        ['北京', BJData]
      ].forEach(function(item) {
        series.push({
          // 设置飞机后的烟雾
          type: 'lines',
          zlevel: 1,
          effect: {
            show: true,
            period: 6,
            trailLength: 0.7,
            color: 'white',
            symbolSize: 3,
            symbol: planePath
          },
          // 线宽
          lineStyle: {
            normal: {
              color: '#fff',
              width: 0,
              curveness: 0.2
            }
          },
          data: convertData(item[1]) // 坐标
        }, {
          name: '旅游车队前往中',
          type: 'lines',
          zlevel: 2,
          effect: {
            show: true,
            period: 6,
            trailLength: 0,
            symbol: planePath,
            symbolSize: 15
          },
          lineStyle: {
            normal: {
              color: function(params) {
                if (params.value > 0 && params.value <= 1) {
                  return '#ffe566'
                } else if (params.value === 2) {
                  return '#74ebd5'
                } else if (params.value > 2 && params.value < 4) {
                  return '#5bc0eb'
                } else {
                  return '#f26419'
                }
              },
              width: 1,
              opacity: 0.4,
              curveness: 0.2
            }
          },
          data: convertData(item[1])
        }, {
          // 设置圆圈属性的
          name: item[0] + '',
          type: 'effectScatter',
          coordinateSystem: 'geo',
          // 鼠标移入显示的东西
          tooltip: {

            showDelay: 0,

            formatter: function(params) {
              return `
${params.name}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br/>旅游车队人数:
        <span">${params.value[2]}人</span>`
            },

            axisPointer: {

              show: true,

              type: 'cross',

              lineStyle: {

                type: 'dashed',

                width: 1

              }

            }

          },
          zlevel: 2,
          rippleEffect: {
            brushType: 'stroke'
          },
          label: {
            normal: {
              show: true,
              position: 'right',
              formatter: '{b}'
            }
          },
          // 设置圆圈大小
          symbolSize: function() {
            // val的值是data的值
            return 10
          },
          itemStyle: {
            normal: {
              color: function(params) {
                if (params.value[2] > 0 && params.value[2] <= 1) {
                  return '#ffe566'
                } else if (params.value[2] === 2) {
                  return '#74ebd5'
                } else if (params.value[2] > 2 && params.value[2] < 4) {
                  return '#5bc0eb'
                } else {
                  return '#f26419'
                }
              }
            }
          },
          data: item[1].map(function(dataItem) {
            return {
              name: dataItem[1].name,
              value: geoCoordMap[dataItem[1].name].concat([dataItem[1].value])
            }
          })
        })
      })

      const option = {
        // 设置为半透明
        title: {
          left: 'left',
          textStyle: {
            color: '#fff'
          }
        },
        tooltip: {
          trigger: 'item'
        },
        // 设置地图默认大小
        geo: {
          zoom: 1.2,
          map: 'china',
          label: {
            normal: {
              show: false,
              color: '#fff'
            },
            emphasis: {
              show: true,
              color: '#fff'
            }
          },
          roam: true,
          itemStyle: {
            normal: {
              // 设置区域颜色
              areaColor: 'rgba(237,242,244,0.06)',
              // 设置边框颜色
              borderColor: '#00b3f4'
            },
            emphasis: {
              // 设置鼠标悬停时候的样式
              areaColor: '#c6c2c2'
            }
          }
        },

        visualMap: { // 颜色的设置  dataRange
          textStyle: { color: '#fff' },
          x: 'right',
          y: '380',
          splitList: [
            { start: 30 }, { start: 20, end: 30 },
            { start: 10, end: 20 }, { start: 0, end: 10 }
          ],
          // text:['高','低'],// 文本，默认为数值文本
          // color: ['#65A2D9', '#E09107', '#A3E00B']
          color: ['#f26419', '#5bc0eb', '#74ebd5', '#ffe566']
        },
        series: series
      }
      this.$echarts.init(document.querySelector('.map')).setOption(option)
    }
  }
}
</script>

<style scoped>

.map{
  width: 89vh;
  height: 90vh;
  margin-top: 1vh;
  transform: scale(1.1); /* 缩小地图比例，例如缩小到80% */
  transform-origin: center; /* 确保缩放是从中心点进行 */
}
</style>
