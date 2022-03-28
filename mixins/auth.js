export default {
  methods: {
    isAdmin () {
      return this.$auth.user.role === 'ADMIN'
    }
  }
}
