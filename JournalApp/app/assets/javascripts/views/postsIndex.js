Journal.Views.PostsIndex = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.collection, "sync remove", this.render);
  },

  template: JST['postsIndex'],

  render: function(){
    var content = this.template();
    this.$el.html(content);
    // this.$el.html("<ul></ul>");
    var that = this;
    this.collection.each(function(post) {
      var PostItemView = new Journal.Views.PostsIndexItem( { model: post });
      that.$("ul").append(PostItemView.render().$el);
    });
    return this;
  }
});

// posts = new Journal.Collections.Posts();
// var view2 = new Journal.Views.PostsIndex({collection: posts });
// view2.collection.fetch({
//   success: function() {
//     view2.render();
//     $('body').append(view2.$el);
//   }
// })
