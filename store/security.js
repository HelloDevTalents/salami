import { merge, pickBy } from 'lodash-es'
import axios from '~/services/axios'

export const state = () => ({
  registerUri: '/user/register',
  recoverPasswordUri: 'user/recover-password',
  registerUrl: '',
  updateLostPasswordUri: 'user/reset-password',
  updatePasswordUri: 'user/update-password',
  registerForm: {},
  isLoading: false,
  passwordForm: {
    current_password: null,
    password: null,
    password_repeat: null
  },
  loginForm: {
    username: 'admin@admin.com',
    password: 'changethis',
    remember: false
  }
})

export const mutations = {
  SET_REGISTER_URL (state, value) {
    state.registerUrl = value
  },
  SET_REGISTER_FORM (state, value) {
    state.registerForm = value
  },
  SET_ITEM (state, data) {
    Object.assign(state, { item: data })
  },
  SET_LOADED (state, data) {
    merge(state.item, pickBy(data))
  }
}

export const actions = {
  async RESET_REGISTER_FORM ({ commit }) {
    const res = await axios.get('user/schema/register')
    commit('SET_REGISTER_FORM', res.data)
  },
  async LOGIN ({ state }) {
    try {
      await this.$auth.loginWith('local', { data: state.loginForm })
      this.$router.push({ path: '/admin' })
    } catch (err) {
    }
  },
  async REGISTER ({ commit, state, dispatch, rootState }, { form, fileList }) {
    const formData = new FormData()

    Object.entries(form).forEach(([key, value]) => {
      formData.append(key, value)
    })

    if (Array.isArray(fileList) && fileList.length) {
      form.avatar = fileList[0].thumbUrl
    }
    commit('SET_REGISTER_URL', new URL('user/register', this.$config.apiUrl))

    const resp = await fetch(state.registerUrl.toString(), {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(form)
    })
    return resp
  },
  async RECOVER_PASSWORD ({ commit, state }, data) {
    await axios.post(state.recoverPasswordUri, data)
  },
  async UPDATE_LOST_PASSWORD ({ commit, state }, data) {
    await axios.post(state.updateLostPasswordUri, data)
  },
  async UPDATE_PASSWORD ({ commit, state }) {
    state.isLoading = true
    const res = await axios.post(state.updatePasswordUri, state.passwordForm)
    state.isLoading = false
    return res
  }
}

export const getters = {
  isLoading: state => state.isLoading,
  registerUrl: state => state.registerUrl,
  registerForm: state => state.registerForm,
  passwordForm: state => state.passwordForm,
  loginForm: state => state.loginForm
}
