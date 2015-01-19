var RandomString = require('randomstring');

module.exports = {

  activate: function(state) {
    atom.workspace.command('atom-randomstring:insert', '.atom-text-editor', this.generateString);
  },

  generateString: function() {
    editor = atom.workspace.getActiveTextEditor();
    editor.insertText(RandomString.generate());
  }
};
