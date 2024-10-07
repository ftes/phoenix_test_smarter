export default {
  mounted() {
    this.el.addEventListener('input', () => {
      const isValid = this.el.value.length >= 12

      const errorEl = document.getElementById('pwd-error')
      errorEl.classList.toggle("hidden", isValid)
    })
  }
}
