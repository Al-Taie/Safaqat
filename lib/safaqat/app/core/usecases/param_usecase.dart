
abstract class ParamUseCase<Type, Params>{
  Future<Type> call ({required Params params});
}
