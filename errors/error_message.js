const ErrorMessage = function (message, detail = '', status = null) {
  this.detail = detail
  this.status = status
  this.message = message
}

export { ErrorMessage }
