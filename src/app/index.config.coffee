angular.module 'macaron'
  .config ($logProvider, $provide) ->
    'ngInject'
    # Enable log
    $logProvider.debugEnabled true
    # $provide.decorator('$httpBackend', angular.mock.e2e.$httpBackendDecorator)
