require '../src/string'

describe 'strings', ->
  it 'sees if starts with', ->
    str = "tom s"
    expect(str.startsWith("tom ")).toBe(true)
  it 'can check contains string', ->
    str = "tom s"
    expect(str.contains("to ")).toBe(false)
    expect(str.contains("om ")).toBe(true)
  it 'can check if valid email', ->
    valid    = "shachamtom@gmail.com"
    invalid1 = "blah"
    invalid2 = "blah@"
    invalid3 = "blah@com"
    invalid4 = "@com"
    expect(valid.isValidEmail()).toBe(true)
    expect(invalid1.isValidEmail()).toBe(false)
    expect(invalid2.isValidEmail()).toBe(false)
    expect(invalid3.isValidEmail()).toBe(false)
    expect(invalid4.isValidEmail()).toBe(false)
  it 'reverses strings', ->
    str = "tom s"
    expect(str.reverse()).toEqual("s mot")
  it 'pops last letter off', ->
    str = "tom s"
    expect(str.pop()).toEqual("tom ")