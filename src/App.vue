<template>
  <div id="q-app">
    <router-view :key="$route.params.id" />
  </div>
</template>

<script >
export default {
  name: 'App'
}
</script>
