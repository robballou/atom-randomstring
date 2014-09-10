var RandomString = require('randomstring')

module.exports = {

  activate: function(state) {
    atom.workspaceView.command('atom-randomstring:insert', '.editor', this.generateString);
  },

  generateString: function() {
    editor = atom.workspace.getActiveEditor()
    editor.insertText(RandomString.generate())
  }
};
