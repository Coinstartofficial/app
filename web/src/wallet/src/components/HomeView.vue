<template>
  <div class="content">
    <div>
      <img class="img-class" src="@/assets/Icon-192.png" />
    </div>
    <div class="title1">Welcome to</div>
    <div class="title2">coinstart wallet</div>

    <div class="content-btn-pup">Create a New wallet</div>

    <div class="content-btn-black">Login with email</div>

    <div class="content-white">
      Have a recovery phrase?
      <span class="span-pup">&nbsp;Import-></span>
    </div>

    <div class="content-pup">Forget password -></div>
  </div>
</template>

<script>
export default {
  name: "HomeView",
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
.body {
  background-color: #1b1e26;
  width: 100%;
  height: 100%;
  text-align: center;
  line-height: 100%;
}
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
  margin-top: 130px;
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
  font-size: 12px;
}
.span-pup {
  color: #8f63c7;
}
.content-pup {
  width: 310px;
  margin: 0 auto;
  text-align: left;
  margin-top: 20px;
  font-size: 12px;
  color: #8f63c7;
}
</style>
