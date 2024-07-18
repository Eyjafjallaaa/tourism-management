<template>
  <div class="container">
    <img src="~@/assets/indexImg/pic-12.png" class="header-image">
    <div class="header-text">旅游实时数据展示</div>
    <div class="content">
      <div class="left-column">
        <HotelOccupancy />
        <EchartComponent />


      </div>
      <div class="middle-container">
        <Map :provinces="provincesData" :end="'成都'" />
      </div>
      <div class="right-column">

        <TravelAgencyBarChart />

        <ParkingLot />
      </div>
    </div>
  </div>
</template>

<script>
import EchartComponent from './components/EchartComponent.vue';
import ParkingLot from './components/ParkingLot.vue';
import HotelOccupancy from './components/HotelOccupancy.vue';
import TravelAgencyBarChart from './components/TravelAgencyBarChart.vue';
import Map from './components/Map.vue';

export default {
  name: "Index",
  components: {
    EchartComponent,
    ParkingLot,
    HotelOccupancy,
    TravelAgencyBarChart,
    Map
  },
  data() {
    return {
      like: true,
      value1: 4154.564,
      value2: 1314,
      title: "增长人数",
      provincesData: [] // 确保这是一个数组
    };
  },
  mounted() {

  },
  methods: {

  },
  created() {
    // 模拟获取数据
    this.provincesData = [
      { name: '北京', value: 6 },
      { name: '湖南', value: 3 },
      { name: '广东', value: 2 },
      { name: '山西', value: 2 },
      { name: '上海', value: 1 },
      { name: '重庆', value: 1 },
      { name: '河北', value: 1 },
      { name: '陕西', value: 1 },
      { name: '山东', value: 0 },
      { name: '黑龙江', value: 0 },
      { name: '贵州', value: 0 },
      { name: '成都', value: 0  }
    ];
  }
};
</script>

<style scoped lang="scss">
.container {
  background-image: url("~@/assets/indexImg/background-6.png");
  background-size:cover;
  background-position-x: 50%;
}

.header-image {
  width: 100%;
  margin-bottom: 0%;
}
.header-text {
  position: absolute;
  top: 4%;
  left: 51%;
  transform: translate(-50%, -50%);
  color: white;
  font-size: 43px;
  font-weight: bold;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
}

.content {
  display: flex;
  flex-wrap: wrap;
}

.left-column, .right-column {
  flex: 1;
  min-width: 30vh; /* 保证在屏幕变小时组件不会太小 */

}

.left-column {
  display: flex;
  flex-direction: column;
}

.right-column {
  display: flex;
  flex-direction: column;
}

.left-column > * {

}

.right-column > * {

}
.main-container{
  justify-content: center;
}
</style>
