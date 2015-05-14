Pokedex.RootView.prototype.addToyToList = function (toy) {
  var $li = $("<li>").html(toy.get("name") + " - Happiness: <strong>" + toy.get("happiness") + "</strong> Price: <strong>" + toy.get("price") + "</strong>");
  $li.data({
    'id': toy.id,
    'pokemon-id': toy.get("pokemon_id")
  }).addClass("toy");
  this.$toys.append($li);
};

Pokedex.RootView.prototype.renderToyDetail = function (toy) {
  var $detail = $("<div class='detail'>");
  $detail.html(this.toyTemplate({
    name: toy.get("name"),
    image_url: toy.get("image_url"),
    happiness: toy.get("happiness"),
    price: toy.get("price")
  }));
  this.$el.find('.toy-detail').html($detail);
  this.$selectBox = $('<select>');
  this.$selectBox.data({
    "toy-id": toy.id,
    "pokemon-id": toy.get('pokemon_id')
  });
  this.pokes.each(function(pokemon) {
    var $opt = $('<option>');
    $opt.val(pokemon.id).text(pokemon.get('name'));
    if (pokemon.id === toy.get('pokemon_id')) {
      $opt.attr("selected", true);
    }
    this.$selectBox.append($opt);
  }.bind(this));
  $detail.append(this.$selectBox);
  this.$selectBox.on("change", this.reassignToy.bind(this));
};

Pokedex.RootView.prototype.selectToyFromList = function (event) {
  var pokemon = this.pokes.get($(event.currentTarget).data('pokemon-id'));
  this.renderToyDetail(pokemon.toys().get($(event.currentTarget).data('id')));
};
