window.Journal = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var $main = $("div.content");
    var $sidebar = $("div.sidebar");
    new Journal.Routers.Router({main: $main, sidebar: $sidebar});
    Backbone.history.start();
  }
};

$(document).ready(function(){
  Journal.initialize();
});
