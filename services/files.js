const Files = {
  getBase64 (file) {
    // console.log('getBase64 file', file)
    if (file) {
      return new Promise((resolve, reject) => {
        const reader = new FileReader()
        reader.readAsDataURL(file)
        // console.log('getBase64 after data read', reader)
        reader.onload = () => resolve(reader.result)
        reader.onerror = error => reject(error)
      })
    }
  }
}
export { Files }
