const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './_includes/**/*.html',
    './_layouts/**/*.html',
    '**/*.md',
    '**/*.html',
  ],
  theme: {
    extend: {
      fontFamily: {
        'sans': ['Roboto', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        logogreen: '#96ca4f'
      },
      animation: {
        'infinite-scroll': 'infinite-scroll 50s linear infinite',
      },
      keyframes: {
        'infinite-scroll': {
          from: { transform: 'translateX(0)' },
          to: { transform: 'translateX(-100%)' },
        }
      }
    },
  },
  plugins: [
    require('@tailwindcss/typography')
  ]
}
