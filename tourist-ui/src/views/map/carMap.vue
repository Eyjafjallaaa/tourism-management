<template>
  <div class="carMap">
      <div class="carMapRight">
        <Mapview
            ref="carMap"
            :lntlat="[checkObj.rotes.startLocation, checkObj.rotes.endLocation]"
            :carInfo="checkObj"
        ></Mapview>
      </div>
  </div>
</template>

<script>
import Mapview from "./MapContainer.vue";
export default {
  name: "carMap",
  components: {
    Mapview,
  },
  props: {},
  data() {
    return {
      checkObj: {
        id: "1-2",
        label: "湘A00002",
        parentId: 1,
        parentLabel: "第一车队",
        driver: "中南游击队",
        type: 2,
        rotes: {
          startTime: "2024-06-30 10:44",
          endTime: "2023-07-2 10:44",
          startLocation: [112.991554,28.139883],
          endLocation: [103.861842,30.780189],
        },
      },
    };
  },
  watch:{},
  mounted() {},
  computed: {},
  methods: {},
  destroyed() {},
};
</script>
<style lang="scss" scoped>
* {
  margin: 1px 60px 10px 60px;
  padding: 0;
}

html,
body {
  width: 100%;
  height: 100%;
}

.carMap {
  padding: 20px;
  width: 100%;
  box-sizing: border-box;
  display: flex;

}

.carMapRight {
  width: 80%;
  height: 88vh;
  border: 4px solid #ccc; /* 边框样式和颜色 */
  border-radius: 8px; /* 边框圆角 */
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 阴影效果 */
}
</style>