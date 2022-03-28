export default ({ app, store }, inject) => {
  store.subscribe((mutation, state) => {
    // if (mutation.type === 'stocks_product/UPDATE_ITEM') {
    //   console.log('stock product form updated', mutation, state)
    //   if (Object.hasOwn(state.stocks_product.item, 'stock_id')) {
    //     store.dispatch('stocks_product/FETCH_STOCK_TABLE_DATA', state.stocks_product.item.stock_id)
    //   }
    // }
    // console.log('reply form subs:', mutation.type)
    // console.log('reply form subs:', mutation.type)
  })

  store.subscribeAction({
    before: (action, state) => {
      // console.log(action)
    },
    after: (action, state) => {
      if (action.type === 'stocks/CREATE') {
        // store.dispatch('stocks/FETCH_SELECT_ITEMS')
      }
    }
  })
}
