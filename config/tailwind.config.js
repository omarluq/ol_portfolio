const colors = require('tailwindcss/colors')
const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.html.erb',
    './app/components/**/*.rb',
    './app/controllers/**/*.rb',
    './spec/components/**/*.rb',
    './spec/components/**/*.html.erb',
    './spec/previews/components/**/*.rb',
    './src/**/*.{html,js}',
    './node_modules/tw-elements/dist/js/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        'black-transparent': 'rgba(0, 0, 0, 0.5)'
      },
      minWidth: {
        '1/2': '50%',
        '1/3': '33.33%'
      },
      maxWidth: {
        '1/2': '50%',
        '1/3': '33.33%',
        '1/6': '66.66'
      },
      width: {
        'inherit': 'inherit'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/line-clamp'),
    require('tw-elements/dist/plugin'),
  ]
}
