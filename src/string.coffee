String.prototype.startsWith = (str) ->
  this.indexOf(str) == 0

String.prototype.contains = (str) ->
  this.indexOf(str) != -1

String.prototype.isValidEmail = () ->
    re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
    re.test(this)

String.prototype.reverse = () -> this.split('').reverse().join('')

String.prototype.pop = () -> this[0..-2]