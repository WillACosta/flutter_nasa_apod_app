import 'package:core_commons/core_commons.dart';
import 'package:flutter/material.dart';

abstract base class ViewModel {
  /// UiState for views
  final ValueNotifier<UiState> state = ValueNotifier(IdleUiState());

  /// Update UiState with a new event
  void updateState(UiState newState) => state.value = newState;
}
