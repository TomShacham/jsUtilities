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

window.http = (request) ->
  handler = new XMLHttpRequest()
  handler.open request.method, request.url, true
  headers = request.headers || {}
  for name in headers
    handler.setRequestHeader name, headers[name]
  (responseHandler) ->
    handler.addEventListener "readystatechange", ->
      if handler.readystate is 4
        headers = handler.getAllResponseHeaders()
          .split("\n").reduce (accumulator, header) ->
            pair = header.split(": ")
            accumulator[pair[0]] = pair[1]
            accumulator
          , {}
        entity = {
          toXml:  () -> handler.responseXML,
          toText: () -> handler.responseText,
          toJson: () -> JSON.parse handler.responseText
        }
        responseHandler {status: handler.status, headers: headers, entity: entity}
    handler.send request.entity
    () -> handler.abort()

window.http2 = (request) ->
  handler = new XMLHttpRequest()
  handler.open request.method, request.url, true
  headers = request.headers || {}
  for name in headers
    handler.setRequestHeader name, headers[name]
  (responseHandler) ->
    handler.addEventListener "readystatechange", ->
      if handler.readystate is 4
        responseHandler {
          status: handler.status, 
          headers: handler.getAllResponseHeaders()
            .split("\n").reduce (headers, header) ->
              pair = header.split(": ")
              headers[pair[0]] = pair[1]
              headers
            , {},
          entity: {
            toXml:  () -> handler.responseXML,
            toText: () -> handler.responseText,
            toJson: () -> JSON.parse handler.responseText
          }
        }
    handler.send request.entity
    () -> handler.abort()








