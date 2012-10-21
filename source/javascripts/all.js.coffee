#= require jquery.min

pad = (number, length) ->
  str = "" + number
  str = "0" + str  while str.length < length
  str

clock = ->
  clockAngle = 360 / 60
  clockHoursAngle = 360 / 12
  secondHand = $('.second-hand')
  minuteHand = $('.minute-hand')
  hourHand = $('.hour-hand')

  time = new Date
  seconds = time.getSeconds()
  minutes = time.getMinutes()
  hours = time.getHours()

  secondHand.css('-webkit-transform', 'rotate(' + (seconds * clockAngle) + 'deg)').attr('data-time', pad(seconds, 2))
  minuteHand.css('-webkit-transform', 'rotate(' + (minutes * clockAngle + (seconds / 60 * clockAngle)) + 'deg)').attr('data-time', pad(minutes, 2))
  hourHand.css('-webkit-transform', 'rotate(' + (hours * clockHoursAngle + ((minutes / 60) * clockHoursAngle ))  + 'deg)').attr('data-time', pad(hours, 2))

$ ->
  time = new Date
  clock()

  window.setTimeout (->
    window.setInterval (->
      clock()
    ), 1000
  ), (1000 - time.getMilliseconds())


  $('.buttons a').live "click", (e) ->
    e.preventDefault()
    $(this).parent().find('a').removeClass('active')
    $(this).addClass('active')

    if $(this).attr('href') == "#digital"
      $('.clock').addClass('digital')
    else
      $('.clock').removeClass('digital')

