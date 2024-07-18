<template>
  <div>
    <div ref="chart" class="chart-container"></div>
  </div>
</template>

<script>
import * as echarts from 'echarts';

export default {
  data() {
    return {
      chart: null,  // ECharts 实例
      travelAgencies: ['中青旅游团', '向阳旅行社', '天源国际旅游', '康辉旅行社', '龙行神舟国际旅行社'],  // 旅行社名称
      travelData: [120, 200, 150, 80, 70]  // 初始出游人数数据
    };
  },
  mounted() {
    this.chart = echarts.init(this.$refs.chart);  // 初始化 ECharts 实例
    this.initChart();  // 初始化图表配置
    this.updateChart();  // 更新图表数据
  },
  methods: {
    randomizeData() {
      // 随机生成出游人数
      this.travelData = this.travelData.map(() => Math.floor(Math.random() * 300));
    },
    initChart() {
      this.chart.setOption({
        title: {
          text: '旅行社团队出游人数',
          left: 'center',
          textStyle: {
            color: '#ffffff',
            fontSize: 20
          }
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          },
          backgroundColor: 'rgba(0,0,0,0.7)',
          borderColor: '#333',
          borderWidth: 1,
          textStyle: {
            color: '#fff'
          }
        },
        xAxis: {
          type: 'category',
          data: this.travelAgencies,
          axisLine: {
            lineStyle: {
              color: '#ffffff'
            }
          },
          axisLabel: {
            color: '#ffffff',
            fontSize: 14
          }
        },
        yAxis: {
          type: 'value',
          axisLine: {
            lineStyle: {
              color: '#ffffff'
            }
          },
          splitLine: {
            lineStyle: {
              type: 'dashed'
            }
          },
          axisLabel: {
            color: '#ffffff',
            fontSize: 14
          }
        },
        series: [
          {
            name: '出游人数',
            type: 'bar',
            data: this.travelData,
            itemStyle: {
              color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [
                  {
                    offset: 0,
                    color: '#21B8FA' // 顶部颜色
                  },
                  {
                    offset: 0.8,
                    color: '#21B8FA' + '00' // 底部渐变颜色
                  }
                ]
              },
              barBorderRadius: [5, 5, 0, 0]
            },

            barWidth: '60%',
            emphasis: {

              itemStyle: {
                color: '#1f78b4',
                borderRadius:[5, 5, 0, 0]
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
              data: this.travelData  // 更新图表数据
            }
          ]
        });
      }, 10000);  // 每隔2秒更新一次数据
    }
  }
};
</script>

<style scoped>
.chart-container {
  width: 100%;
  height: 400px;
  border-radius: 8px;


}
</style>
