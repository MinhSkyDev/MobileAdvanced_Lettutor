part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent {}

class HistoryOnInitEvent extends HistoryEvent {}

class HistoryOnClickItemEvent extends HistoryEvent {}

class HistoryOnSwitchPageEvent extends HistoryEvent {}
