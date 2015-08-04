Array.prototype.each = Array.prototype.forEach

Array.prototype.append = () ->
  for arg in arguments
    this.push(arg)
  this

Array.prototype.cons = (args...) ->
  for arg in args.reverse()
    this.unshift(arg)
  this

Array.prototype.zip = (array) -> 
  this.map((_,i) => 
    [this, array].map((ary) -> return ary[i]))

Array.prototype.find = (pred) ->
  for el in this
    return el if pred(el)

Array.prototype.head = () -> this[0]
Array.prototype.first = () -> this[0]

Array.prototype.exists = (pred) ->
  this.find(pred) != undefined

Function.identity = (x) -> x