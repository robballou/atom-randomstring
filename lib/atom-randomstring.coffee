{CompositeDisposable} = require 'atom'
RandomString = require 'randomstring'

module.exports = AtomRandomstring =
  subscriptions: null

  config:
    length:
      type: 'integer'
      default: 32
      minimum: 1
    charset:
      type: 'string'
      default: 'alphanumeric'

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a
    # CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-text-editor',
      'atom-randomstring:insert': (event) ->
        editor = @getModel()
        options =
          length: atom.config.get('atom-randomstring.length'),
          charset: atom.config.get('atom-randomstring.charset')
        console.log(options)
        editor.insertText(RandomString.generate())

  deactivate: (state) ->
    @subscriptions.dispose()
