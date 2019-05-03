<template>
  <div id="app">
    <h1>My Todo List</h1>
    <todoList></todoList>
  </div>
</template>

<script>
import todoList from './components/todoList.vue'

export default {
  name: 'app',
  components: {
    todoList
  }
}
</script>

<style>
#app {
  width: 400px;
  line-height: 1.5;
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin:0 auto;
}

</style>
