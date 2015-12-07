angular.module 'macaron'
.controller 'MainController', class MainController

  constructor: ($http) ->
    'ngInject'

    @dropzoneConfig =
      options:
        maxFileSize: 50
        method: 'post'
        url: 'http://localhost:9000/documents'
      eventHandlers:
        accept: (file, done) ->
          console.log 'accept'
          done()
        sending: (file, xhr, formData) ->
          console.log 'file: ', file
          console.log 'xhr: ', xhr
          console.log 'formData: ', formData
        error: (file, message) ->
          throw Error 'There was an error uploading your file: ' + message
        success: (file) ->
          console.log 'success: ', file

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
