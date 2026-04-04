import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silah_app/core/config/theme/extentions/color_extantion.dart';

class UiErrorOverlay extends StatelessWidget {
  const UiErrorOverlay({
    super.key,
    required this.title,
    required this.message,
    required this.onRetry,
    required this.onReport,
    required this.onClose,
    required this.detailsProvider,
  });

  final String title;
  final String message;
  final VoidCallback onRetry;
  final VoidCallback onReport;
  final VoidCallback onClose;
  final String Function() detailsProvider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final text = theme.textTheme;

    return Material(
      color: Colors.black.withAlphaOpacity(0.35),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 18,
                  spreadRadius: 2,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 48,
                  color: theme.colorScheme.onSurface,
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: text.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: text.bodyMedium,
                ),
                const SizedBox(height: 18),

                // Buttons
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    FilledButton.icon(
                      onPressed: onRetry,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () async {
                        final data = detailsProvider();
                        await Clipboard.setData(ClipboardData(text: data));
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Details copied')),
                          );
                        }
                      },
                      icon: const Icon(Icons.copy_all),
                      label: const Text('Copy details'),
                    ),
                    OutlinedButton.icon(
                      onPressed: onReport,
                      icon: const Icon(Icons.report),
                      label: const Text('Report'),
                    ),
                  ],
                ),
                if (kDebugMode) ...[
                  const SizedBox(height: 12),
                  Text(
                    'A non-fatal UI error occurred.',
                    style: text.labelSmall,
                  ),
                ],
                const SizedBox(height: 4),
                TextButton(onPressed: onClose, child: const Text('Dismiss')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
