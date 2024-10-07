export default {
  mounted() {
    this.el.addEventListener("input", () => {
      const error = document.querySelector("#pwd-error")
      error.classList.toggle("hidden", this.el.value?.length >= 12)
    })
  }
}
