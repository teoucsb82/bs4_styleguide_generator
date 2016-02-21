class Stylepicker
  constructor: ->
    @init()
    return

  init: =>
    @handleColorChanges()
    @handleFontChanges()
    return

  ######

  handleColorChanges: =>
    # let buttons control inputs
    $("#colorpicker .btn").on "click", (e) =>
      e.preventDefault()
      $(e.target).siblings("input").colorpicker("show")
      return

    # Update page colors on change
    $('#colorpicker .form-group input').colorpicker().on 'changeColor.colorpicker', (e) ->
      name = $(e.target).attr("name")
      color = e.color.toHex()
      if name == "primary"
        $("a.nav-item").css("color", color)
        $("a.nav-link").css("color", color)
        $("header a.nav-link").css("color", "#ffffff")
        $(".active").css("background-color", color).css("color", "#ffffff")
      $(".btn-#{name}, .bg-#{name}").css("background-color", color)
      $(".btn-#{name}, .bg-#{name}").css("border-color", color)


    # Set original colors on page load
    # $('#colorpicker .form-group input').each ->
    #   originalColor = $(this).siblings(".btn").css("background-color")
    #   $(this).colorpicker('setValue', originalColor)
    return

  handleFontChanges: =>
    $('a[data-toggle="tab"]').on 'shown.bs.tab', (e) ->
      font = $(this).text()
      if $(this).parents(".nav").attr("id") == "header-font"
        $("h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6").css("font-family", font)
      else
        $("body").css("font-family", font)
      return
    return


window.Stylepicker = Stylepicker

$ ->
  new Stylepicker()
