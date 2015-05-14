Pokedex.RootView.prototype.reassignToy = function (event) {
  var oldPokemonId = this.$selectBox.data("pokemon-id");
  var toyId = this.$selectBox.data("toy-id");
  var newPokemonId = this.$selectBox.val();

  console.log(oldPokemonId, toyId, newPokemonId);
};

Pokedex.RootView.prototype.renderToysList = function (toys) {
};
