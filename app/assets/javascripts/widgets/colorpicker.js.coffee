class Colorpicker
  constructor: ->
    # let buttons control inputs
    $("#colorpicker .btn").on "click", (e) =>
      e.preventDefault()
      $(e.target).siblings("input").colorpicker("show")
      return

    # Update page colors on change
    $('#colorpicker .form-group input').colorpicker().on 'changeColor.colorpicker', (e) ->
      name = $(e.target).attr("name")
      color = e.color.toHex()
      $(".btn-#{name}, .bg-#{name}").css("background-color", color)
      $(".btn-#{name}, .bg-#{name}").css("border-color", color)

    # Set original colors on page load
    $('#colorpicker .form-group input').each ->
      originalColor = $(this).siblings(".btn").css("background-color")
      $(this).colorpicker('setValue', originalColor)
    return

window.Colorpicker = Colorpicker

$ ->
  new Colorpicker()
