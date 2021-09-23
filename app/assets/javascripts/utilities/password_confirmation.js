document.addEventListener('turbolinks:load', function () {
  var confirm = document.querySelector('#user_password_confirmation')

  if (confirm) { confirm.addEventListener('input', trackInputValue) }
})

function trackInputValue() {
  var password = document.querySelector('#user_password').value

  if (this.value && password != this.value) {
    this.classList.add('bg-danger')
    this.parentElement.querySelector('.octicon-alert').classList.remove('hide')
    this.parentElement.querySelector('.octicon-check').classList.add('hide')
  } else if (password == this.value) {
    this.classList.remove('bg-danger')
    this.classList.add('bg-success')
    this.parentElement.querySelector('.octicon-alert').classList.add('hide')
    this.parentElement.querySelector('.octicon-check').classList.remove('hide')
  } else {
    this.classList.remove('bg-danger')
    this.classList.remove('bg-success')
    this.parentElement.querySelector('.octicon-alert').classList.add('hide')
    this.parentElement.querySelector('.octicon-check').classList.add('hide')
  }
}
