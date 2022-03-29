const Collections = {
  getNameById (collection, id) {
    const row = collection.find(r => r.id === id)
    if (row && Object.hasOwn(row, 'name')) {
      return row.name
    } else {
      return null
    }
  }
}
export { Collections }
