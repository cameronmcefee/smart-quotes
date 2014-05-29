module.exports =

  activate: (state) ->
    atom.workspaceView.command "smart-quotes:smart", => @smarter()

  smarter: ->
    editor = atom.workspace.activePaneItem
    selection = editor.getSelection()

    smarterText = selection.getText()

    # Regexp adapted from this post:
    # http://www.leancrew.com/all-this/2010/11/smart-quotes-in-javascript/
    smarterText = smarterText
      .replace(/(^|[-—\s(\["])'/g, "$1‘")  # opening singles
      .replace(/'/g, "’")                  # closing singles & apostrophes
      .replace(/(^|[-—/\[(‘\s])"/g, "$1“") # opening doubles
      .replace(/"/g, "”")                  # closing doubles

    selection.insertText(smarterText)
