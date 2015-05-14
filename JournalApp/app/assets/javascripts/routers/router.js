Journal.Routers.Router = Backbone.Router.extend({
  routes: {
    "": "index",
    "posts/new": "new",
    "posts/:id": "show",
    "posts/:id/edit": "edit"
  },

  initialize: function (options) {
    this.$sidebar = options.sidebar,
    this.$content = options.main,
    this.collection = new Journal.Collections.Posts();
    this.index();
  },

  index: function() {
    this.collection.fetch();
    var index = new Journal.Views.PostsIndex({ collection: this.collection });
    this.$content.empty();
    this.$sidebar.html(index.render().$el);
  },

  new: function() {
    var post = new Journal.Models.Post();

    var newView = new Journal.Views.PostForm({
      model: post,
      collection: this.collection
    });

    this.$content.html(newView.render().$el);
  },

  show: function(id) {
    var post = this.collection.getOrFetch(id);

    var showView = new Journal.Views.PostShow({
      model: post
    });

    this.$content.html(showView.render().$el);
  },

  edit: function(id) {
    var post = this.collection.getOrFetch(id);

    var editView = new Journal.Views.PostForm({
      model: post
    });

    this.$content.html(editView.render().$el);
  }

})
