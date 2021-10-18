document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.test-timer')

  if (control) { 
    var duration = control.dataset.timer
    startTimer(duration, control) 
  }
})

function startTimer(duration, display) {
  var timer = duration, hours, minutes, seconds
  var rest = duration
  var passed = 0

  setInterval(function () {
    ++passed
    rest = duration - passed
    console.log(rest)

    if (!rest) {
      clearInterval(setInterval);
      document.querySelector('.form-submit').click()
    }

    hours = parseInt(timer / 3600, 10)
    minutes = parseInt((timer - hours * 3600) / 60, 10)
    seconds = parseInt(timer % 60, 10)

    hours = hours < 10 ? "0" + hours : hours
    minutes = minutes < 10 ? "0" + minutes : minutes
    seconds = seconds < 10 ? "0" + seconds : seconds

    if (hours > 0) {
      timer_context = hours + ":" + minutes + ":" + seconds
    } else {
      timer_context = minutes + ":" + seconds
    }

    display.textContent = timer_context

    if (--timer < 0) {
      timer = duration
    }
  }, 1000)
}
