import 'dart:convert' as convert;
import 'dart:math';
//external packages
import 'package:dart_application_1/pokeclass/data_pokemon.dart';
import 'package:http/http.dart' as http;

//internal packages
import 'package:dart_application_1/class/pokemon_response.dart'
    as pokemon_response;

void getReqRespServicePokemon(url) async {
  var rng = Random();
  int pokemon = rng.nextInt(19);

  var urlparse = Uri.parse(url);

  // Await the http get response, then decode the json-formatted response.
  final request = await http.get(urlparse);
  if (request.statusCode == 200) {
    final pokemon_parse =
        pokemon_response.pokemonResponseFromJson(request.body);

    print('Your pokemon is.....');
    print('-------${pokemon_parse.results[pokemon].name.toUpperCase()}-------');
    print('And his Url: ${pokemon_parse.results[pokemon].url}');

    var urldatapokemon = Uri.parse(pokemon_parse.results[pokemon].url);
    final requestdatapokemon = await http.get(urldatapokemon);
    if (requestdatapokemon.statusCode == 200) {
      final pokemon_data_parse =
          pokemonDataResponseFromJson(requestdatapokemon.body);
      int game_indices_abilities =
          rng.nextInt(pokemon_data_parse.abilities.length);
      int game_indices_move = rng.nextInt(pokemon_data_parse.moves.length);
      int game_indices = rng.nextInt(pokemon_data_parse.gameIndices.length);
      String types = '';
      print(
          'Ability: ${pokemon_data_parse.abilities[game_indices_abilities].ability.name}');
      print('Move: ${pokemon_data_parse.moves[game_indices_move].move.name}');
      print('Experience:${pokemon_data_parse.baseExperience}');
      print(
          'Game Indice:${pokemon_data_parse.gameIndices[game_indices].gameIndex}');
      print(
          'Game version:${pokemon_data_parse.gameIndices[game_indices].version.name}');
      print('Height:${pokemon_data_parse.height}');
      print('Weight:${pokemon_data_parse.weight}');

      for (var i = 0; i < pokemon_data_parse.types.length; i++) {
        types += (i == 0)
            ? pokemon_data_parse.types[i].type.name
            : ',${pokemon_data_parse.types[i].type.name}';
      }
      print('Type: $types');
    }
  } else {
    print('Request failed with status: ${request.statusCode}.');
  }
}
