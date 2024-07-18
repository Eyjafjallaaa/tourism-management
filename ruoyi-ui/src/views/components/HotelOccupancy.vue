<template>
  <div class="chart-container">
    <div ref="chart" style="width: 100%; height: 400%;"></div>
  </div>
</template>

<script>
import * as echarts from 'echarts';

export default {
  data() {
    return {
      chart: null,          // ECharts 实例
      totalRooms: 100,      // 总房间数
      occupiedRooms: 50     // 初始已入住房间数
    };
  },
  mounted() {
    this.chart = echarts.init(this.$refs.chart);  // 初始化 ECharts 实例
    this.initChart();  // 初始化图表配置
    this.updateChart();  // 更新图表数据
  },
  methods: {
    randomizeData() {
      // 随机生成已入住房间数
      this.occupiedRooms = Math.floor(Math.random() * this.totalRooms);
    },
    initChart() {
      this.chart.setOption({
        title: {
          text: '饭店入住率',
          left: 'center',
          textStyle: {
            color: '#fff',
            fontSize: 20,
          },
        },
        tooltip: {
          trigger: 'item',
          formatter: '{a} <br/>{b} : {c} ({d}%)',
        },
        legend: {
          orient: 'vertical',
          left: 'left',
          textStyle: {
            color: '#fff',
          },
        },
        series: [
          {
            name: '房间状态',
            type: 'pie',
            radius: '50%',
            data: [
              { value: this.occupiedRooms, name: '已入住房间' },
              { value: this.totalRooms - this.occupiedRooms, name: '未入住房间' }
            ],
            itemStyle: {
              normal: {
                color: function (params) {
                  // 自定义颜色
                  const colorList = ['#00b3f4', '#d1e6eb'];
                  return colorList[params.dataIndex];
                },
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            },
            label: {
              normal: {
                textStyle: {
                  color: '#fff'
                }
              }
            },
            labelLine: {
              normal: {
                lineStyle: {
                  color: '#fff'
                }
              }
            },
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      });
    },
    updateChart() {
      setInterval(() => {
        this.randomizeData();  // 更新数据
        this.chart.setOption({
          series: [
            {
              data: [
                { value: this.occupiedRooms, name: '已入住房间' },
                { value: this.totalRooms - this.occupiedRooms, name: '未入住房间' }
              ]
            }
          ]
        });
      }, 5000);  // 每隔2秒更新一次数据
    }
  }
};
</script>

<style scoped>
.chart-container {
  background-image: url('~@/assets/indexImg/jt.png');
  background-size: 28vh ;
  background-repeat: no-repeat;
  background-position: 52%;

}

</style>
