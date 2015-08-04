require '../array'

describe "array", ->
  it "appends shit", ->
    array = [1,2,3]
    expect(array.append(5,6)).toEqual([1,2,3,5,6])
  it "cons's shit", ->
    array = [1,2,3]
    expect(array.cons(-1, 0)).toEqual([-1,0,1,2,3])
  it "zips shit", ->
    array = [1,2,3]
    expect(array.zip([4,5,6])).toEqual([[1,4],[2,5],[3,6]])
  it "finds shit", ->
    array = [1,2,3,4]
    expect(array.find((x)-> x % 2 == 0)).toEqual(2)
    expect(array.find((x)-> x % 5 == 0)).toEqual(undefined)
  it "get head or first", ->
    array = [1,2,3]
    expect(array.head()).toEqual(1)
    expect(array.first()).toEqual(1)
  it "tell if element exists", ->
    array = [1,2,3]
    expect(array.exists((x)->x%2==0)).toBe(true)
    expect(array.exists((x)->x%5==0)).toBe(false)
  it "identity map does nada", ->
    array = [1,2,3]
    expect(array.map(Function.identity)).toEqual([1,2,3])
