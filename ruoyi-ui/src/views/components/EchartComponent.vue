<template>
  <div>
    <div ref="chart" style="width: 100%; height: 400px;"></div>
  </div>
</template>

<script>
import * as echarts from 'echarts';
import axios from 'axios';

export default {
  data() {
    return {
      data: [],
      now: new Date(2024, 7, 3, 0, 0, 0),
      tenMinutes: 10 * 60 * 1000,
      value: Math.random() * 1000,
      chart: null,
    };
  },
  mounted() {
    this.chart = echarts.init(this.$refs.chart);
    this.initData();
    this.initChart();
    this.updateChart();
  },
  methods: {
    randomData() {
      this.now = new Date(+this.now + this.tenMinutes);
      this.value = this.value + Math.random() * 21 - 10;
      return {
        name: this.now,
        value: [
          this.now,
          Math.round(this.value),
        ],
      };
    },
    initData() {
      for (let i = 0; i < 100; i++) {
        this.data.push(this.randomData());
      }
    },
    initChart() {
      this.chart.setOption({
        title: {
          text: '旅游景区人数统计以及变化趋势',
          textStyle: {
            align: 'center',
            color: '#fff',
            fontSize: 20,
          },
          top: '5%',
          left: 'center',
        },
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            lineStyle: {
              color: {
                type: 'linear',
                x: 0,
                y: 0,
                x2: 0,
                y2: 1,
                colorStops: [
                  { offset: 0, color: 'rgba(0, 255, 233,0)' },
                  { offset: 0.5, color: 'rgba(255, 255, 255,1)' },
                  { offset: 1, color: 'rgba(0, 255, 233,0)' }
                ],
                global: false
              }
            }
          },
          formatter: function (params) {
            params = params[0];
            var date = new Date(params.name);
            return (
              date.getDate() +
              '/' +
              (date.getMonth() + 1) +
              '/' +
              date.getFullYear() +
              ' : ' +
              params.value[1]
            );
          },
        },
        grid: {
          top: '15%',
          left: '10%',
          right: '5%',
          bottom: '15%',
        },
        xAxis: {
          type: 'time',
          splitLine: {
            show: false,
          },
          axisLine: {
            show: true,
            lineStyle: {
              color: '#fff'
            }
          },
          axisLabel: {
            color: '#fff',
            formatter: function (value) {
              var date = new Date(value);
              var hours = date.getHours();
              var minutes = date.getMinutes();
              return hours + ':' + (minutes < 10 ? '0' : '') + minutes;
            },
          },
          axisTick: {
            interval: function (index, value) {
              var date = new Date(value);
              return date.getMinutes() % 10 === 0;
            },
            alignWithLabel: true,
            lineStyle: {
              color: '#fff',
            }
          }
        },
        yAxis: {
          type: 'value',
          boundaryGap: [0, '100%'],
          splitLine: {
            show: true,
            lineStyle: {
              color: 'rgba(255,255,255,0.1)'
            }
          },
          axisLine: {
            show: false,
          },
          axisLabel: {
            show: false,
            margin: 20,
            textStyle: {
              color: '#d1e6eb',
            },
          },
          axisTick: {
            show: false,
          },
        },
        series: [
          {
            name: 'Fake Data',
            type: 'line',
            smooth: true,
            showAllSymbol: true,
            symbol: 'circle',
            symbolSize: 0,
            lineStyle: {
              normal: {
                color: "#00b3f4",
                shadowColor: 'rgba(0, 0, 0, .3)',
                shadowBlur: 0,
                shadowOffsetY: 5,
                shadowOffsetX: 5,
              }
            },
            label: {
              show: false,
              position: 'top',
              textStyle: {
                color: '#00b3f4',
              }
            },
            itemStyle: {
              color: "#00b3f4",
              borderColor: "#fff",
              borderWidth: 3,
              shadowColor: 'rgba(0, 0, 0, .3)',
              shadowBlur: 0,
              shadowOffsetY: 2,
              shadowOffsetX: 2,
            },
            areaStyle: {
              normal: {
                color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                  { offset: 0, color: 'rgba(0,179,244,0.3)' },
                  { offset: 1, color: 'rgba(0,179,244,0)' }
                ], false),
                shadowColor: 'rgba(0,179,244, 0.9)',
                shadowBlur: 20
              }
            },
            data: this.data,
          }
        ],
      });
    },
    updateChart() {
      setInterval(() => {
        this.data.shift();
        const newData = this.randomData();
        this.data.push(newData);
        this.chart.setOption({
          series: [
            {
              data: this.data,
            }
          ],
        });

        // 当数据超过1000时发送邮件提醒
        if (newData.value[1] > 100) {
          this.sendEmailAlert(newData.value[1]);
        }
      }, 2000);
    },
    async sendEmailAlert(count) {
      try {
        await axios.post('http://localhost:3000/check-visitor-count', { count });
      } catch (error) {
        console.error('Failed to send email alert', error);
      }
    },
  },
};
</script>

<style scoped>
/* Optional: Add any custom styles for your component */
</style>
