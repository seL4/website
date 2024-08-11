const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

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
        darkcol: colors.gray['900'],
        darkcol_inv: colors.gray['300'],
        lightcol: colors.gray['600'],
        lightcol_inv: colors.gray['400'],
        logogreen: '#96ca4f',
        darkblue: '#030020',
        accentlight: colors.indigo['400'],
        accent: colors.indigo['500'],
        accentdark: colors.indigo['600']
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
    require('@tailwindcss/typography'),
    function ({ addVariant }) {
      addVariant('light', '@media (prefers-color-scheme: light)')
    },
  ]
}
