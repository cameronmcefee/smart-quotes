{View} = require 'atom'

module.exports =
class SmartQuotesView extends View
  @content: ->
    @div class: 'smart-quotes overlay from-top', =>
      @div "The SmartQuotes package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "smart-quotes:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "SmartQuotesView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
