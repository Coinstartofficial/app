<template class="page-box">
  <div id="app">
    
    <CreateWallet msg="Welcome to Your Vue.js App"/>
  </div>
</template>

<script>
import CreateWallet from './components/CreateWallet.vue'

export default {
  name: 'App',
  components: {
    CreateWallet
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
   background-color: #1b1e26;
   height: 100%
}

</style>
