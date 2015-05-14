Journal.Views.PostShow = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model, 'sync', this.render);
  },
  template: JST["postShow"],
  render: function(options) {
    // debugger
    options = options ? options : {changeTitle: false, changeBody: false};
    var content = this.template({
      post: this.model,
      changeTitle: options.changeTitle,
      changeBody: options.changeBody
    });
    this.$el.html(content);
    return this;
  },

  events: {
    "click a.all-posts": "navigateToIndex",
    "dblclick h3": "renderEditTitle",
    "dblclick p": "renderEditBody",
    "blur input": "updateContent",
    "blur textarea": "updateContent",
  },

  navigateToIndex: function() {
    Backbone.history.navigate("/", { trigger: true });
  },

  renderEditTitle: function() {
    this.render({changeTitle: true, changeBody: false});
  },

  renderEditBody: function() {
    this.render({changeTitle: false, changeBody: true});
  },

  updateContent: function(event) {
    var formAttrs = $(event.currentTarget).serializeJSON();
    var that = this;

    this.model.save(formAttrs.post, {
      success: function() {
        if (that.collection) {
          that.collection.add(that.model, { merge: true });
        }
        Backbone.history.navigate("/post/" + that.model.id, { trigger: true });
      },
      error: function() {
        that.render();
      }
    });
  },

});
