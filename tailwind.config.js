module.exports = {
  purge: [
    './components/**/*.{vue,js}',
    './modules/**/*.{vue,js}',
    './layouts/**/*.vue',
    './pages/**/*.vue',
    './plugins/**/*.{js,ts}',
    './nuxt.config.{js,ts}'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        color1: '#00F9FF',
        color2: '#5C02C2',
        color3: '#FC94FF',
        color4: '#9000C2',
        color5: '#FFF46A',
        color6: '#DC0070',
        color7: '#137BFF',
        color8: '#55FFA7',
        color9: '#0C459B'
      },
      fontFamily: {
        poppins: ['Poppins', 'sans-serif']
      }

    },
    screens: {
      xs: '500px',
      sm: '640px',
      md: '768px',
      lg: '1024px',
      xl: '1280px'
    }
  },
  variants: {
    extend: {}
  },
  plugins: []
}
