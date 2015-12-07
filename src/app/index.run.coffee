angular.module 'macaron'
  .run ($log, $httpBackend) ->
    'ngInject'

    $httpBackend.whenPOST('/document.png').respond (method, url, data) ->
      params = angular.fromJson(data)
      console.log params
      [201, {}, {}]

    $httpBackend.whenGET(/.*/).passThrough()
