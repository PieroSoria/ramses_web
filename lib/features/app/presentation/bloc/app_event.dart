part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  factory AppEvent.onChangeHover({required bool ishover}) =>
      _OnChangeHover(ishover: ishover);

  @override
  List<Object?> get props => [];
}

class _OnChangeHover implements AppEvent {
  final bool ishover;

  _OnChangeHover({required this.ishover});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
