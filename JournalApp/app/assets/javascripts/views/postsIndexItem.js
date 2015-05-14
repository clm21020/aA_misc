Journal.Views.PostsIndexItem = Backbone.View.extend({
  tagName: "li",
  template: JST['postsIndexItem'],

  render: function() {
    var content = this.template({ post: this.model });
    this.$el.html(content);
    return this;
  },
  events: {
    "click button.delete_button": "remove"
  },

  remove: function() {
    this.model.destroy();
  }
});
