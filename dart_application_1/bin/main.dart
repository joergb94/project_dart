//internal packages
import 'package:dart_application_1/my_packages.dart' as my_packages;
import 'package:dart_application_1/pokemon_packages.dart' as pokemon_packages;

void main(List<String> arguments) {
  //my_packages.getReqRespService('https://reqres.in/api/users?page=2');
  pokemon_packages
      .getReqRespServicePokemon('https://pokeapi.co/api/v2/pokemon');
}
