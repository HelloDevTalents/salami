import axios from '~/services/axios'

export const state = () => ({
  formsUri: 'forms',
  worldRegions: [],
  contactForm: {}
})

export const mutations = {
  SET_WORLD_REGIONS (state, value) {
    state.worldRegions = value
  },
  SET_CONTACT_FORM (state, value) {
    state.contactForm = value
  }
}

export const actions = {
  async LOAD_WORLD_REGIONS ({ commit }) {
    const url = new URL('system/world-region', this.$config.apiUrl)
    const res = await this.$axios.get(url.toString())
    commit('SET_WORLD_REGIONS', res.data)
  },
  async RESET_CONTACT_FORM ({ state, commit }) {
    console.log('ressting contact form')
    const res = await axios.get(`${state.formsUri}/contact/schema`)
    commit('SET_CONTACT_FORM', res.data)
  },
  async POST_CONTACT_FORM ({ commit, state }) {
    state.isLoading = true
    const res = await axios.post(`${state.formsUri}/send-contact`, state.contactForm)
    state.isLoading = false
    commit('SET_MANAGE_TABLE_DATA', res.data)
  }
}

export const getters = {
  worldRegions: state => state.worldRegions,
  contactForm: state => state.contactForm
}
