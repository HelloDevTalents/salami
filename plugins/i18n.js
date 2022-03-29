export default function ({ app }) {
  app.i18n.onBeforeLanguageSwitch = (oldLocale, newLocale, isInitialSetup, context) => {}
  app.i18n.onLanguageSwitched = (oldLocale, newLocale) => {
    app.store.commit('LOCALE', newLocale)
  }
}
