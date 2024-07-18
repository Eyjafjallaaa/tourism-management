<template>
  <div class="parking-lot-container">
    <h2>{{ parkingLot.name }}</h2>
    <div class="slot-info">
      <p>总车位: <span class="slot-number">{{ parkingLot.totalSlots }}</span></p>
      <p>剩余车位: <span class="slot-number">{{ parkingLot.availableSlots }}</span></p>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      parkingLot: {
        name: '景区停车场',
        totalSlots: 100, // 总车位数量
        availableSlots: 100 // 剩余车位数量
      }
    };
  },
  mounted() {
    // 模拟数据变化，每秒钟更新一次剩余车位数量
    setInterval(this.updateParkingSlots, 1000);
  },
  methods: {
    updateParkingSlots() {
      // 随机生成一个剩余车位数量，模拟数据变化
      const min = 0;
      const max = this.parkingLot.totalSlots;
      this.parkingLot.availableSlots = Math.floor(Math.random() * (max - min + 1)) + min;
    }
  }
};
</script>

<style>
.parking-lot-container {
  background-image: url('~@/assets/indexImg/border-2.gif') !important;
  background-size: cover !important;
  background-repeat: no-repeat !important;
  padding: 30px !important;
  max-width: 360px !important;
  margin-top: 17vh;
  margin-left: 7vh;
}

h2 {
  font-weight: bold !important;
  color: #FFFFFF !important;
  text-align: center !important;
  margin-bottom: 20px !important;
}

.slot-info {
  font-size: 16px !important;
  color: #FFFFFF !important;
}

.slot-number {
  font-weight: bold !important;
  color: #409eff !important;
}
</style>
