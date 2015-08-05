class Selection extends Array
  constructor: () ->
    super
  on: (eventListener, fun) ->
    this.each(element) ->
      element.addEventListener(eventListener, fun)
  attribute: (name, value) ->
    if value 
    then this.map((el) -> el.setAttribute(name, value))
    else this.map((el) -> el.getAttribute(name))
  text: (text) ->
    if text
    then this.map((el) -> el.textContent = text)
    else this.map((el) -> el.textContent)
  html: (html) ->
    if html
    then this.map((el) -> el.innerHTML = html)
    else this.map((el) -> el.innerHTML)

window.select = (selector, element) ->
  element = element || document
  nodes = element.querySelectorAll(selector)
  array = new Selection()
  for node, i in nodes
    array.append(node)
  array

window.head = (selector, element) -> window.select(selector,element).head()

window.get = (id) -> document.getElementById(id)

window.onLoad = (fun) ->
  document.on("DOMContentLoaded", fun)