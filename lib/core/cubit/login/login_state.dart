

abstract class LoginState {}

class LoginInitial extends LoginState {}

class ChangeCheckBox extends LoginState {}
class SetLoginToDone extends LoginState {}

class ChangeValidEmail extends LoginState {}
class ChangeValidPass extends LoginState {}

class StartValidate extends LoginState {}


class OnAppStart extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginLoading extends LoginState {}
class LoginFailed extends LoginState {}
