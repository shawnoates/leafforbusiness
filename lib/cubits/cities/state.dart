part of 'cubit.dart';

@immutable
class CitiesState extends Equatable {
  final List<City>? data;
  final String? message;

  const CitiesState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message];
}

@immutable
class CitiesDefault extends CitiesState {}

@immutable
class CitiesFetchLoading extends CitiesState {
  const CitiesFetchLoading();
}

@immutable
class CitiesFetchSuccess extends CitiesState {
  const CitiesFetchSuccess({required List<City> data}) : super(data: data);
}

@immutable
class CitiesFetchFailed extends CitiesState {
  const CitiesFetchFailed({String? message}) : super(message: message);
}
