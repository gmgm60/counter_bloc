part of 'internet_cubit.dart';


class InternetState extends Equatable {
final ConnectionType connectionType;
  const InternetState({required this.connectionType});

  @override
  List<Object?> get props => [connectionType];
}
