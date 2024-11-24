part of 'app_bloc.dart';

class AppState extends Equatable {
  final bool? ishover;
  const AppState({this.ishover});

  factory AppState.initialState() => const AppState(ishover: false);

  AppState copyWith({bool? ishover}) {
    return AppState(ishover: ishover ?? this.ishover);
  }

  @override
  List<Object?> get props => [ishover];
}
