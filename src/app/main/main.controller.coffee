angular.module 'macaron'
.controller 'MainController', class MainController

  constructor: ->
    'ngInject'

    @dropzoneConfig =
      options:
        url: "http://facebook.com"
        method: 'post'
        maxFileSize: 50
        # previewsContainer: false
      eventHandlers:
        accept: (file, done) ->
          console.log 'accept'
        sending: (file, xhr, formData) ->
          console.log 'sending'
        error: (file, message) ->
          throw Error 'There was an error uploading your file: ' + message
        success: (file) ->
          console.log 'success'

.directive 'dropzone', ->
  restrict: 'E'
  replace: true
  scope:
    config: '='
  link: (scope, element) ->
    dropzone = new Dropzone(element[0], angular.merge(
      accept: scope.config.eventHandlers.accept
    , scope.config.options))

    angular.forEach scope.config.eventHandlers, (handler, event) ->
      dropzone.on event, handler
  template: '''
    <form class="dropzone"></form>
  '''
