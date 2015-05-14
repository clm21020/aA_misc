Journal.Views.PostForm = Backbone.View.extend({
  template: JST["postForm"],

  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    "submit form.new-post": "submitForm"
  },

  render: function() {
    var content = this.template({ post: this.model});
    this.$el.html(content);
    return this;
  },

  submitForm: function(event) {
    event.preventDefault();
    var formAttrs = $(event.currentTarget).serializeJSON();
    var that = this;

    this.model.save(formAttrs.post, {
      success: function() {
        if (that.collection) {
          that.collection.add(that.model, { merge: true });
        }
        Backbone.history.navigate("/", { trigger: true });
      },
      error: function() {
        that.render();
      }
    });
  }
});
