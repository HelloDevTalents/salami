import axiosService from '~/services/axios'
export default ({ $auth, $axios, $config }) => {
  axiosService.setAxios($axios)
  axiosService.setApiUrl($config.apiUrl)
}
