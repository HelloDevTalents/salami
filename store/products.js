import axios from '~/services/axios'

export const state = () => ({
  moduleUri: 'product',
  isLoading: false,
  quantity: [],
  statuses: {},
  item: {}
})

export const mutations = {
  SET_ITEM (state, data) {
    state.item = data
  },
  SET_STATUS_LIST (state, value) {
    state.statuses = value
  },
  QUANTITY (state, data) {
    state.quantity = data
  }
}
export const actions = {
  async RESET_ITEM ({ state, commit }) {
    const res = await axios.get(`${state.moduleUri}/schema`)
    commit('SET_ITEM', res.data)
  },
  async RETRIEVE ({ commit, state }, id) {
    state.isLoading = true
    const res = await axios.get(`${state.moduleUri}/${id}`)
    state.isLoading = false
    commit('SET_ITEM', res.data)
  },
  async PREVIEW ({ commit, state }, id) {
    state.isLoading = true
    const res = await axios.get(`${state.moduleUri}/${id}/preview`)
    state.isLoading = false
    commit('SET_ITEM', res.data)
  },
  async CREATE ({ commit, state }, data) {
    state.isLoading = true
    const res = await axios.post(`${state.moduleUri}`, data)
    state.isLoading = false
    return res
  },
  async UPDATE ({ commit, state }, data) {
    state.isLoading = true
    const res = await axios.put(`${state.moduleUri}/${data.id}`, data)
    state.isLoading = false
    return res
  },
  async FETCH_STATUSES ({ commit, state }) {
    const res = await axios.get(`${state.moduleUri}/status-list`)
    commit('SET_STATUS_LIST', res.data)
  },
  async FETCH_QUANTITY ({ commit, state }) {
    const res = await axios.get(`${state.moduleUri}/quantity`)
    commit('QUANTITY', res.data)
  },
  async UPLOAD_GALLERY ({ commit, state }, { fileList, id }) {
    return await axios.upload(`${state.moduleUri}/upload-gallery/${id}`, fileList)
  },
  async UPLOAD_AVATAR ({ commit, state }, data) {
    return await axios.upload(`${state.moduleUri}/upload`, data)
  },
  async DELETE ({ commit, state }, id) {
    state.isLoading = true
    const res = await axios.delete(`${state.moduleUri}/${id}`)
    state.isLoading = false
    return res
  }
}

export const getters = {
  isLoading: state => state.isLoading,
  item: state => state.item,
  statuses: state => state.statuses,
  quantity: state => state.quantity
}
