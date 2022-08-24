abstract class PlanetStates{}
class initialstate extends PlanetStates{}
class plus_state extends PlanetStates{
  final int count;

  plus_state(this.count);
}
class minus_state extends PlanetStates{
  final int count;

  minus_state(this.count);
}
class SignUpLoadingState extends PlanetStates{}
class SignUpSuccessState extends PlanetStates{}
class SignUpErrorState extends PlanetStates{
  final String error;
  SignUpErrorState(this.error);
}
class ProductsLoadingState extends PlanetStates{}
class ProductsSuccessState extends PlanetStates{}
class ProductsErrorState extends PlanetStates{
  final String error;
  ProductsErrorState(this.error);
}