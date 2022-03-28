export const strict = false

export const state = () => ({
  apiUrl: '',
  message: '',
  locale: ''
})

export const mutations = {
  apiUrl (state, value) {
    state.apiUrl = value
  },
  LOCALE (state, locale) {
    state.locale = locale
  }
}

export const actions = {
  nuxtServerInit ({ commit }, { req }) {},
  SET_LOCALE ({ state, commit, context }, locale) {}
}

export const getters = {
  apiUrl: state => state.apiUrl,
  locale: state => state.locale,
  locale2: state => state.locale
}
