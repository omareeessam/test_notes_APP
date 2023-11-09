part of 'notes_cubit.dart';

sealed class NotesState {}
@immutable

final class NotesInitial extends NotesState {}
final class NotesSuccesss extends NotesState {}

final class NotesLoading extends NotesState {}


final class NotesFailure extends NotesState {
  final String message;

  NotesFailure({required this.message});
}
