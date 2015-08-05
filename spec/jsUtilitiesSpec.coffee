require '../src/jsUtilities'

html = "<body>
  <h1>Hello, world!</h1>
  <p class='tom'>
    <blah id='s'></blah>
  </p>
</body>"

describe 'selector', ->
  it 'selects elements', ->
    expect(select('blah', html)).toEqual("<blah>")