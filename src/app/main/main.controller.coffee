angular.module 'macaron'
.controller 'MainController', class MainController

  constructor: (@$timeout, @toastr) ->
    'ngInject'

    @dropzoneConfig =
      parallelUploads: 3
      maxFileSize: 30

    @awesomeThings = []
    @classAnimation = ''
    @creationDate = 1447010814444
    @activate()

  activate: ->
    @$timeout (=>
      @classAnimation = 'rubberBand'
    ), 4000

  showToastr: =>
    @toastr.info "Fork <a href=\"https://github.com/Swiip/generator-gulp-angular\"
      target=\"_blank\"><b>generator-gulp-angular</b></a>"
    @classAnimation = ''
