<template>
  <div class="flex flex-col min-h-screen">
    <Nuxt />
  </div>
</template>

<script>
import Vue from 'vue'
import { mapActions, mapMutations, mapGetters } from 'vuex'
import auth from '~/mixins/auth'

Vue.mixin(auth)

export default {
  name: 'Home',
  computed: {
    ...mapGetters({
    })
  },
  methods: {
    ...mapMutations({
    }),
    ...mapActions({
    })
  }
}
</script>

<style>
#__nuxt, #__layout {
  min-height: 100vh;
  display: block;
  height: auto;
}

.ant-form-item {
  margin-bottom: 0;
}

.ant-form-explain {
  display: none;
}
</style>
