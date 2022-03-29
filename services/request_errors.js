import { ErrorMessage } from '~/errors/error_message'

const RequestErrors = {
  processErrorRespone (response) {
    if ('status' in response) {
      switch (response.status) {
        case 400:
          return new ErrorMessage('Błąd', this._getResponseDetail(response))
        case 404:
          return new ErrorMessage('Zasób nie istnieje:', this._getResponseDetail(response))
        default:
          return new ErrorMessage('Błąd o statusie', response.status)
      }
    } else {
      return new ErrorMessage('Błąd')
    }
  },
  _getResponseDetail (response) {
    try {
      return response.data.detail
    } catch (e) {
      return ''
    }
  }
}
export { RequestErrors }
