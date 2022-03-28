export default {
  // Disable server-side rendering: https://go.nuxtjs.dev/ssr-mode
  ssr: false,
  target: 'static',
  router: {
    base: '/salami/'
  },
  static: {
    prefix: '/public/'
  },
  publicRuntimeConfig: {
    apiUrl: process.env.BASE_URL + '/api/' || 'http://localhost/api'
  },
  head: {
    title: 'Salami',
    meta: [
      { charset: 'utf-8' },
      {
        name: 'viewport',
        content: 'width=device-width, initial-scale=1.0, maximum-scale=1.0,user-scalable=0'
      },
      {
        hid: 'description',
        name: 'description',
        content: ''
      },
      {
        name: 'format-detection',
        content: 'telephone=no'
      }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.png?v2' }
    ],
    htmlAttrs: {
      class: 'flex flex-col h-full w-full'
    },
    bodyAttrs: {
      class: 'h-full w-full flex flex-col font-poppins'
    }
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
    '~/assets/ant/main.less'
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    '@/plugins/antd-ui'
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/eslint
    '@nuxtjs/eslint-module',
    '@nuxtjs/tailwindcss',
    '@nuxtjs/google-fonts'
  ],

  googleFonts: {
    families: {
      Poppins: true,
      display: 'swap'
    }
  },

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    '@nuxtjs/i18n',
    '@nuxtjs/axios',
    '@nuxtjs/auth-next',
    '@nuxtjs/pwa',
    [
      'nuxt-mq',
      {
        defaultBreakpoint: 'sm',
        breakpoints: {
          sm: 640,
          md: 768,
          lg: 1024,
          xl: 1280
        }
      }
    ]
  ],
  i18n: {
    locales: [
      {
        code: 'en',
        name: 'EN',
        file: 'en-US.js'
      },
      {
        code: 'pl',
        name: 'PL',
        file: 'pl-PL.js'
      }
    ],
    lazy: true,
    skipNuxtState: true,
    langDir: 'lang/',
    defaultLocale: 'pl',
    detectBrowserLanguage: false,
    vueI18n: {
      locale: 'pl',
      fallbackLocale: 'pl',
      silentTranslationWarn: true
    }
  },

  // Axios module configuration: https://go.nuxtjs.dev/config-axios
  axios: {},

  // PWA module configuration: https://go.nuxtjs.dev/pwa
  pwa: {
    manifest: {
      lang: 'en'
    }
  },

  auth: {
    localStorage: {
      prefix: 'auth.'
    },
    cookie: false,
    fullPathRedirect: true,
    redirect: {
      login: '/login',
      logout: '/login',
      callback: '/admin',
      home: '/'
    },
    strategies: {
      local: {
        token: {
          property: 'access_token',
          global: true,
          required: true,
          type: 'Bearer'
        },
        user: {
          property: false,
          autoFetch: true
        },
        endpoints: {
          login: {
            url: process.env.BASE_URL + '/api/security/access-token',
            method: 'post'
          },
          logout: false,
          user: {
            url: process.env.BASE_URL + '/api/security/user',
            method: 'get'
          }
        }
      }
    },
    plugins: [
      { src: '~/plugins/polyfills', mode: 'client' },
      { src: '~/plugins/subscribers', mode: 'client' },
      {
        src: '~/plugins/nuxt-auth.js',
        mode: 'client'
      },
      {
        src: '~/plugins/services.js',
        mode: 'client'
      },
      { src: '~/plugins/i18n.js' }
    ]
  },
  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
    loaders: {
      less: {
        lessOptions: {
          javascriptEnabled: true,
          math: 'always'
        }
      }
    },
    publicPath: 'public/_nuxt',
    babel: {
      plugins: [
        ['@babel/plugin-proposal-private-property-in-object', { loose: true }]
      ]
    }
  },

  loading: true,

  loadingIndicator: {
    name: 'circle',
    color: '#595959',
    background: '#FAFAFA'
  }
}
