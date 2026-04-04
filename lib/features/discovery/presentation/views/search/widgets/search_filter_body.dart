import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/config/theme/extentions/theme_context_extension.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/discovery/presentation/blocs/search/discovery_search_cubit.dart';
import 'package:silah_app/features/discovery/presentation/views/search/widgets/search_filter_header.dart';
import 'package:silah_app/features/discovery/presentation/views/search/widgets/specializations_grid.dart';

class SearchFilterBody extends StatefulWidget {
  const SearchFilterBody({super.key});

  @override
  State<SearchFilterBody> createState() => _SearchFilterBodyState();
}

class _SearchFilterBodyState extends State<SearchFilterBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openResults(LegalSpecializationEntity specialization) {
    context.pushNamed(AppRoutes.searchResults.name, extra: specialization);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<DiscoverySearchCubit, DiscoverySearchState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: ProgressStateWidget()),
            failure: (message) => Center(
              child: CustomeErrorWidget(
                message: message,
                onRetry: () => context.read<DiscoverySearchCubit>().load(),
              ),
            ),
            ready: (specializations, selected, query) {
              final normalizedQuery = (query ?? '').trim().toLowerCase();
              final filtered = normalizedQuery.isEmpty
                  ? specializations
                  : specializations.where((item) {
                      final text = (item.name ?? item.code ?? '').toLowerCase();
                      return text.contains(normalizedQuery);
                    }).toList();
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: UIConstants.screenHorizantalPadding,
                  vertical: UIConstants.bigPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchFilterHeader(
                      controller: _controller,
                      onChanged: (value) => context
                          .read<DiscoverySearchCubit>()
                          .updateQuery(value),
                      onCleared: () =>
                          context.read<DiscoverySearchCubit>().updateQuery(''),
                    ),
                    UIConstants.bigHeight,
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        Strings.specializations.tr(),
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    UIConstants.mediumHeight,
                    if (filtered.isEmpty)
                      EmptyWidget(title: Strings.no_data_to_display.tr())
                    else
                      SpecializationsGrid(
                        items: filtered,
                        selectedId: selected?.id,
                        onSelect: (item) {
                          context.read<DiscoverySearchCubit>().select(item);
                          _openResults(item);
                        },
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
