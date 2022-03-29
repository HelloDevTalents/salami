
import { Collections } from '~/services/collections'

export default ({ store }, inject) => {
  inject('collections', Collections)
}
