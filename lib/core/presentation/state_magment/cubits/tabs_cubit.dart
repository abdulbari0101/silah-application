import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silah_app/core/presentation/ui/screen/tabs_screen/utils/tab_view.dart';

part 'tabs_cubit.freezed.dart';

/// Represents the state of tabs including the list of tabs
/// and the index of the currently selected tab.
@freezed
sealed class TabsState with _$TabsState {
  const factory TabsState({
    required List<TabView> tabs,
    required int selectedIndex,
  }) = _TabsState;
}

class TabsCubit extends Cubit<TabsState> {
  /// Initializes the TabsCubit with a required list of tabs and

  TabsCubit({required List<TabView> tabs, int initialIndex = 0})
    : assert(tabs.isNotEmpty),
      assert(initialIndex >= 0 && initialIndex < tabs.length),
      super(TabsState(tabs: tabs, selectedIndex: initialIndex));

  /// Changes the currently selected tab index if the index is valid,
  /// different from the current, and the target tab is enabled.
  void changeTab(int index) {
    if (index != state.selectedIndex &&
        index >= 0 &&
        index < state.tabs.length &&
        state.tabs[index].isEnabled) {
      emit(state.copyWith(selectedIndex: index));
    }
  }

  List<TabView> get tabs => state.tabs;
  TabView get currentTab => state.tabs[state.selectedIndex];
}
