{WorkspaceView} = require 'atom'
SmartQuotes = require '../lib/smart-quotes'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "SmartQuotes", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('smart-quotes')

  describe "when the smart-quotes:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.smart-quotes')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'smart-quotes:smart'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.smart-quotes')).toExist()
        atom.workspaceView.trigger 'smart-quotes:smart'
        expect(atom.workspaceView.find('.smart-quotes')).not.toExist()
