import { merge, pickBy, filter, isEmpty, isNull, lowerCase, values } from 'lodash-es'
import axios from '~/services/axios'

export const state = () => ({
  moduleUri: 'user',
  isLoading: false,
  tableData: [],
  statusSelectList: [],
  roleSelectList: [],
  filter: {},
  item: {
    phone: '',
    company: {}
  },
  pagination: {
    pageSize: 10,
    current: 1,
    total: 0
  }
})

export const mutations = {
  SET_TABLE_DATA (state, data) {
    state.tableData = data
  },
  SET_FILTER (state, data) {
    state.filter = data
  },
  SET_ITEM (state, data) {
    Object.assign(state, { item: data })
  },
  SET_LOADED (state, data) {
    merge(state.item, pickBy(data, r => !isNull(r)))
  },
  SET_STATUS_SELECT_ITEMS (state, data) {
    state.statusSelectList = data
  },
  SET_ROLE_SELECT_ITEMS (state, data) {
    state.roleSelectList = data
  },
  SET_PAGINATION_CURRENT (state, value) {
    state.pagination = Object.assign(state.pagination, { current: value })
  },
  SET_PAGINATION_TOTAL (state, value) {
    state.pagination = Object.assign(state.pagination, { total: value })
  }
}

export const actions = {
  async FETCH_TABLE_DATA ({ commit, state }) {
    state.isLoading = true
    const res = await axios.get(`${state.moduleUri}`)
    state.isLoading = false
    commit('SET_TABLE_DATA', res.data)
  },
  async FETCH_STATUS_SELECT_ITEMS ({ commit, state }) {
    const res = await axios.get(`${state.moduleUri}/status-list`)
    commit('SET_STATUS_SELECT_ITEMS', res.data)
  },
  async FETCH_ROLE_SELECT_ITEMS ({ commit, state }) {
    const res = await axios.get(`${state.moduleUri}/role-list`)
    commit('SET_ROLE_SELECT_ITEMS', res.data)
  },
  LOAD_DATA ({ commit }) {
    commit('SET_LOADED', this.$auth.user)
  },
  async RETRIEVE ({ commit, state }, id) {
    const res = await axios.get(`${state.moduleUri}/${id}`)
    commit('SET_LOADED', res.data)
  },
  async UPDATE ({ commit, state }, data) {
    state.isLoading = true
    const res = await axios.put(`${state.moduleUri}/${data.id}`, data)
    state.isLoading = false
    return res
  },
  async RESET_ITEM ({ state, commit }) {
    const res = await axios.get(`${state.moduleUri}/schema`)
    commit('SET_ITEM', res.data)
  },
  async UPDATE_PROFILE ({ commit, state }, data) {
    state.isLoading = true
    const res = await axios.put(`${state.moduleUri}/update-profile`, data)
    state.isLoading = false
    return res
  },
  async UPLOAD_AVATAR ({ commit, state }, data) {
    state.isLoading = true
    const res = await axios.upload(`${state.moduleUri}/upload-avatar`, data)
    state.isLoading = false
    return res
  },
  async UPLOAD_LOGO ({ commit, state }, data) {
    state.isLoading = true
    const res = await axios.upload(`${state.moduleUri}/upload-logo`, data)
    state.isLoading = false
    return res
  },
  async UPDATE_CURRENCY ({ commit, state }, data) {
    state.isLoading = true
    const res = await axios.post(`${state.moduleUri}/update-currency`, data)
    state.isLoading = false
    return res
  }
}

export const getters = {
  isLoading: state => state.isLoading,
  registerUrl: state => state.registerUrl,
  item: state => state.item,
  tableData: state => state.tableData,
  filteredTableData: (state) => {
    const data = filter(state.tableData, (r) => {
      if (isEmpty(values(state.filter).filter(r => !isEmpty(r)))) { return true }
      const i = pickBy(r, (value, index) => {
        if (state.filter[index] && lowerCase(r[index]) === lowerCase(state.filter[index])) { return true }
      })
      if (!isEmpty(i)) { return true }
    })
    state.pagination = Object.assign(state.pagination, { total: data.length })
    return data
  },
  statusSelectList: state => state.statusSelectList,
  roleSelectList: state => state.roleSelectList,
  filter: state => state.filter,
  pagination: state => state.pagination
}
