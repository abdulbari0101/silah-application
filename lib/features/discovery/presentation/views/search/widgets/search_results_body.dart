import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:silah_app/core/config/constants/ui_constants.dart';
import 'package:silah_app/core/config/localization/localizations_string_keys.dart';
import 'package:silah_app/core/config/router/app_routes.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/empty_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/error_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/headers/specialization_header.dart';
import 'package:silah_app/core/presentation/ui/widget/state_widgets/progress_state_widget.dart';
import 'package:silah_app/core/presentation/ui/widget/text_fields/f_search_text_field.dart';
import 'package:silah_app/features/consultations/presentation/views/create_request/models/consultation_request_args.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/discovery/presentation/blocs/search/discovery_results_cubit.dart';
import 'package:silah_app/features/discovery/presentation/views/search/widgets/lawyer_result_card.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

class SearchResultsBody extends StatefulWidget {
  const SearchResultsBody({super.key, required this.specialization});

  final LegalSpecializationEntity specialization;

  @override
  State<SearchResultsBody> createState() => _SearchResultsBodyState();
}

class _SearchResultsBodyState extends State<SearchResultsBody> {
  late final TextEditingController _searchController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title =
        widget.specialization.name ?? widget.specialization.code ?? '';
    return SafeArea(
      child: BlocBuilder<DiscoveryResultsCubit, DiscoveryResultsState>(
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: ProgressStateWidget()),
            failure: (message) => Center(
              child: CustomeErrorWidget(
                message: message,
                onRetry: () => context.read<DiscoveryResultsCubit>().load(),
              ),
            ),
            ready: (_, lawyers) {
              final filteredLawyers = lawyers.where((lawyer) {
                final name = (lawyer.fullName ?? '').toLowerCase();
                return name.contains(_searchQuery.toLowerCase());
              }).toList();

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: UIConstants.screenHorizantalPadding,
                  vertical: UIConstants.bigPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SpecializationHeader(title: title),
                    UIConstants.bigHeight,
                    FSearchTextField(
                      controller: _searchController,
                      hintText: Strings.search.tr(),
                      onChanged: (val) {
                        setState(() {
                          _searchQuery = val;
                        });
                      },
                      onCleared: () {
                        setState(() {
                          _searchQuery = '';
                        });
                      },
                    ),
                    UIConstants.bigHeight,
                    if (filteredLawyers.isEmpty)
                      EmptyWidget(title: Strings.no_data_to_display.tr())
                    else
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredLawyers.length,
                        separatorBuilder: (_, __) => UIConstants.mediumHeight,
                        itemBuilder: (context, index) {
                          final lawyer = filteredLawyers[index];
                          return LawyerResultCard(
                            lawyer: lawyer,
                            specializationLabel: title,
                            specializationId:
                                widget.specialization.id ??
                                widget.specialization.code ??
                                widget.specialization.name,
                            onRequestConsultation: () =>
                                _openRequest(context, lawyer),
                          );
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

  void _openRequest(BuildContext context, LawyerProfileEntity lawyer) {
    context.pushNamed(
      AppRoutes.requestConsultation.name,
      extra: ConsultationRequestArgs(
        lawyer: lawyer,
        specializationId:
            widget.specialization.id ??
            widget.specialization.code ??
            widget.specialization.name,
        specializationLabel:
            widget.specialization.name ??
            widget.specialization.code ??
            widget.specialization.id,
      ),
    );
  }
}
