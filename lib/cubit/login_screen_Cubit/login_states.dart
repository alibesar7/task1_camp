abstract class LoginStates{}

class InitinalState extends LoginStates{}
class LoadingState extends LoginStates{}
class SuccessState extends LoginStates{}
class ErrorState extends LoginStates{
  final String mes;
  ErrorState({required this.mes});
}