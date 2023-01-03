<template>
  <div class="content">
    <div class="back-home">
      <img class="back-class" src="@/assets/back.png" />
    </div>
    <div>
      <img class="img-class" src="@/assets/Icon-192.png" />
    </div>

    <div class="content-white content-magin-top">Your Recovery phrase</div>

    <div class="content-pup">
      This phrase is the only way to recover your
      <br />wallet. Do not share it with anyone!
    </div>

    <div class="content-white content-magin-top">Recovery phrase</div>

    <div class="content-pup content-pup-bg">
      <div>kiwi nose immune blouse license ability guide gas mimic note toilet panther</div>
    </div>

    <div class="content-btn-pup">Continue</div>
  </div>
</template>

<script>
export default {
  name: "HelpMemory",
  props: {
    msg: String
  },

  //实例创建之前钩子函数--给body添加行内样式
  beforeCreate() {
    this.$nextTick(() => {
      document.body.setAttribute("style", "background:#1b1e26");
    });
  },
  //实例销毁之前钩子--移除body 标签的属性style
  beforeDestroy() {
    document.body.removeAttribute("style");
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.content {
  position: absolute;
  left: 50%;
  top: 50%;
  margin: -250px 0 0 -200px;
  width: 370px;
  height: 630px;
  background-color: #30303a;
  border-radius: 10px;
}
.img-class {
  width: 150px;
  height: 150px;
  margin-top: 50px;
}
.title1 {
  color: #ffffff;
  font-size: 14px;
}
.title2 {
  color: #ffffff;
  font-size: 18px;
  margin-top: 15px;
  font-weight: 700;
}

.content-btn-pup {
  width: 310px;
  height: 48px;
  background-color: #8f63c7;
  color: #ffffff;
  text-align: center;
  line-height: 48px;
  margin: 0 auto;
  margin-top: 40px;
  border-radius: 10px;
}

.content-btn-black {
  width: 310px;
  height: 48px;
  margin: 0 auto;
  margin-top: 10px;
  text-align: center;
  line-height: 48px;
  background-color: #1f1f1f;
  color: #b893e7;
  border-radius: 10px;
}

.content-white {
  width: 310px;
  margin: 0 auto;
  text-align: left;
  color: #ffffff;
  margin-top: 20px;
  font-size: 16px;
}
.span-pup {
  color: #8f63c7;
}
.content-pup {
  width: 310px;
  margin: 0 auto;
  text-align: left;
  margin-top: 10px;
  font-size: 12px;
  color: #a5a5a5;
}
.back-home {
  width: 370px;
  text-align: left;
}
.back-class {
  width: 25px;
  height: 25px;
  margin-top: 10px;
  margin-left: 10px;
}
.content-magin-top {
  margin-top: 30px;
}
.content-pup-bg {
  padding: 10px;
  background-color: #222229;
  border-radius: 10px;
  min-height: 70px;
  line-height: 25px;
  color: #c8c8ca;
  font-size: 16px;
}
</style>
