{CompositeDisposable} = require 'atom'
RandomString = require 'randomstring'

module.exports = AtomRandomstring =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a
    # CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-text-editor',
      'atom-randomstring:insert': (event) ->
        editor = @getModel()
        editor.insertText(RandomString.generate())

  deactivate: (state) ->
    @subscriptions.dispose()
