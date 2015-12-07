describe 'controllers', () ->
  vm = undefined

  beforeEach module 'macaron'

  beforeEach inject ($controller) ->
    vm = $controller 'MainController'

  it 'should have a timestamp creation date', () ->
    expect(vm.creationDate).toEqual jasmine.any Number

  it 'should define animate class after delaying timeout ', inject ($timeout) ->
    $timeout.flush()
    expect(vm.classAnimation).toEqual 'rubberBand'

  it 'should define more than 5 awesome things', () ->
    expect(angular.isArray(vm.awesomeThings)).toBeTruthy()
    expect(vm.awesomeThings.length == 5).toBeTruthy()
