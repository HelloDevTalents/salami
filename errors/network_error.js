class NetworkError extends Error {
  constructor (message, detail = null) {
    super(message)
    this.detail = detail
  }
}

export { NetworkError }
