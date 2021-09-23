document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.progress-bar')

  if (control) { moveProgressBar(control) }
})

function moveProgressBar(element) {
  var width = element.dataset.progress

  element.style.width = width + "%"
}
