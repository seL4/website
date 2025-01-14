const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

f_green = { /* foundation logo green = f_green['400'] */
  '50': '#f5faeb',
  '100': '#e8f4d3',
  '200': '#d2ebab',
  '300': '#b4dc7a',
  '400': '#96ca4f',
  '500': '#78b032',
  '600': '#5c8c24',
  '700': '#486b20',
  '800': '#3b561e',
  '900': '#33491e',
  '950': '#19280b',
}

f_red = { /* foundation accentDark = f_red['900'] */
  '50': '#fff4ea',
  '100': '#ffe6ce',
  '200': '#ffc89c',
  '300': '#ffa15d',
  '400': '#ff6a1c',
  '500': '#ff4300',
  '600': '#ff2300',
  '700': '#e10f00',
  '800': '#b10b00',
  '900': '#820c00',
  '950': '#4d0100',
}

f_yellow = { /* foundation emphasis = f_yellow['300'] */
  '50': '#fff9eb',
  '100': '#ffeec6',
  '200': '#ffdb88',
  '300': '#ffca5f',
  '400': '#ffab20',
  '500': '#f98807',
  '600': '#dd6202',
  '700': '#b74206',
  '800': '#94320c',
  '900': '#7a2a0d',
  '950': '#461302',
}

f_neutral = { /* foundation neutral = f_neutral['700'] */
  '50': '#f5f7fa',
  '100': '#e9edf5',
  '200': '#cfd9e8',
  '300': '#a5bad4',
  '400': '#7496bc',
  '500': '#5278a5',
  '600': '#3f5f8a',
  '700': '#385378',
  '800': '#2e425e',
  '900': '#2b3a4f',
  '950': '#1c2535',
}

f_blue = {
  '50': '#eff8ff',
  '100': '#dcedfd',
  '200': '#c1e1fc',
  '300': '#96cffa',
  '400': '#64b3f6',
  '500': '#4094f1',
  '600': '#2a78e6',
  '700': '#2261d3',
  '800': '#2250ab',
  '900': '#214587',
  '950': '#1b305b',
}

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
        f_green: f_green,
        f_red: f_red,
        f_yellow: f_yellow,
        f_neutral: f_neutral,
        f_blue: f_blue,
        darkcol: colors.gray['900'],
        darkcol_inv: colors.gray['300'],
        lightcol: colors.gray['600'],
        lightcol_inv: colors.gray['400'],
        logogreen: f_green['400'],
        darkblue: '#030020',
        accentlight: colors.slate['400'],
        accent: colors.slate['500'],
        accentdark: colors.slate['600'],
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
