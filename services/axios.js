import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
import { NetworkError } from '~/errors/network_error'

class Axios {
  constructor () {
    this.apiUrl = null
    this.axios = null
  }

  setAxios (axios) {
    this.axios = axios
  }

  setApiUrl (url) {
    this.apiUrl = url
  }

  setToken (token) {
    // // console.log('setting token:', token);
    this.axios.defaults.headers.common = { Authorization: `Bearer ${token}` }
  }

  get commonHeaders () {
    return this.axios.defaults.headers.common
  }

  async get (url, config) {
    // console.log('getting:', this.axios)
    NProgress.start()
    const fullUrl = new URL(url, this.apiUrl)
    try {
      const response = await this.axios.get(fullUrl, config)
      NProgress.done()
      return response
    } catch (e) {
      NProgress.done()
      throw new NetworkError(e.message, `GET ${fullUrl}`)
    }
  }

  async put (url, config) {
    NProgress.start()
    try {
      const fullUrl = new URL(url, this.apiUrl)
      // console.log('axios put', config)
      const response = await this.axios.put(fullUrl, config)
      NProgress.done()
      return response
    } catch (e) {
      NProgress.done()
      // console.log('Error on put e.response', e.response)
      if (e.response.status && e.response.status === 403) {
        return e.response
      } else {
        return e.response
      }
    }
  }

  async post (url, data) {
    NProgress.start()
    try {
      const fullUrl = new URL(url, this.apiUrl)
      const response = await this.axios({
        method: 'post',
        url: fullUrl,
        data
      })
      NProgress.done()
      return response
    } catch (e) {
      // console.log('Error', e)
      // console.log('Error on post e.response', e.response)
      if (e.response.status && e.response.status === 403) {
        return e.response
      } else {
        return e.response
      }
    }
  }

  async delete (url, config) {
    NProgress.start()
    try {
      const fullUrl = new URL(url, this.apiUrl)
      const data = await this.axios.delete(fullUrl, config)
      NProgress.done()
      return data
    } catch (e) {
      NProgress.done()
      // console.log('Error on delete e.response', e.response)
      if (e.response.status && e.response.status === 403) {
        return e.response
      } else {
        return e.response
      }
    }
  }

  async patch (url, data, config) {
    let pathData = {}
    if (data) {
      pathData = data
    }
    NProgress.start()
    try {
      const data = await this.axios.patch(url, pathData, {
        headers: {
          'Content-Type': 'application/merge-patch+json'
        }
      })
      NProgress.done()
      return data
    } catch (e) {
      NProgress.done()
      // console.log('Error on patch e.response', e.response)
      if (e.response.status && e.response.status === 403) {
        return e.response
      } else {
        return e.response
      }
    }
  }

  async upload (url, fileList) {
    NProgress.start()
    try {
      const fullUrl = new URL(url, this.apiUrl)
      const formData = new FormData()
      // console.log('axios upload', fileList)
      if (fileList.length) {
        fileList.forEach((file) => {
          if (Object.hasOwn(file, 'thumbUrl')) {
            formData.append('files', file)
          }
        })
        const response = await this.axios.post(fullUrl, formData, { headers: { 'Content-Type': 'multipart/form-data' } })
        NProgress.done()
        return response
      } else {
        NProgress.done()
        return false
      }
    } catch (e) {
      NProgress.done()
      // console.log('Error on post e.response', e.response)
      if (e.response.status && e.response.status === 403) {
        return e.response
      } else {
        return e.response
      }
    }
  }
}

export default new Axios()
