export default function ({ store, redirect }) {
  // const admin = store.$auth.user.role === 'ADMIN'
  const loggedIn = store.$auth.loggedIn
  if (!loggedIn) {
    return redirect('/login')
  }
}
