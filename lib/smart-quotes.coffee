SmartQuotesView = require './smart-quotes-view'

module.exports =
  smartQuotesView: null

  activate: (state) ->
    @smartQuotesView = new SmartQuotesView(state.smartQuotesViewState)

  deactivate: ->
    @smartQuotesView.destroy()

  serialize: ->
    smartQuotesViewState: @smartQuotesView.serialize()
