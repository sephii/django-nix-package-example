module.exports = {
  content: ['./../backend/example_project/**/*.html'],
  theme: {
    fontFamily: {
      'sans': ['Roboto', 'sans-serif'],
      'title': ['Oswald', 'sans-serif']
    }
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
