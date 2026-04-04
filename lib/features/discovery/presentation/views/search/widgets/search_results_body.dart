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
import 'package:silah_app/features/consultations/presentation/views/create_request/models/consultation_request_args.dart';
import 'package:silah_app/features/discovery/domain/entities/legal_specialization_entity.dart';
import 'package:silah_app/features/discovery/presentation/blocs/search/discovery_results_cubit.dart';
import 'package:silah_app/features/discovery/presentation/views/search/widgets/lawyer_result_card.dart';
import 'package:silah_app/features/profiles/domain/entities/lawyer_profile_entity.dart';

class SearchResultsBody extends StatelessWidget {
  const SearchResultsBody({super.key, required this.specialization});

  final LegalSpecializationEntity specialization;

  @override
  Widget build(BuildContext context) {
    final title = specialization.name ?? specialization.code ?? '';
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
            ready: (_, lawyers) => SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: UIConstants.screenHorizantalPadding,
                vertical: UIConstants.bigPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpecializationHeader(title: title),
                  UIConstants.bigHeight,
                  if (lawyers.isEmpty)
                    EmptyWidget(title: Strings.no_data_to_display.tr())
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: lawyers.length,
                      separatorBuilder: (_, __) => UIConstants.mediumHeight,
                      itemBuilder: (context, index) {
                        final lawyer = lawyers[index];
                        return LawyerResultCard(
                          lawyer: lawyer,
                          specializationLabel: title,
                          specializationId:
                              specialization.id ??
                              specialization.code ??
                              specialization.name,
                          onRequestConsultation: () =>
                              _openRequest(context, lawyer),
                        );
                      },
                    ),
                ],
              ),
            ),
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
            specialization.id ?? specialization.code ?? specialization.name,
        specializationLabel:
            specialization.name ?? specialization.code ?? specialization.id,
      ),
    );
  }
}
