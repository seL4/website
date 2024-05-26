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
    },
  },
  plugins: []
}
