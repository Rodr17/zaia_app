import 'package:flutter/material.dart';
import 'package:iconify_design/iconify_design.dart';
import 'package:zaia_app/theme/app_typography.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_constants.dart';
import '../../widgets/common_app_bar.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqItems = [
      {
        'question': '¿Cómo empiezo a meditar?',
        'answer':
            'Comienza con sesiones cortas de 5-10 minutos. Encuentra un lugar tranquilo, siéntate cómodamente y enfócate en tu respiración. Usa nuestras meditaciones guiadas para principiantes.',
      },
      {
        'question': '¿Cuánto tiempo debo meditar al día?',
        'answer':
            'Lo ideal es empezar con 10 minutos diarios e ir aumentando gradualmente. La consistencia es más importante que la duración. Incluso 5 minutos al día pueden generar beneficios.',
      },
      {
        'question': '¿Qué hago si mi mente no deja de pensar?',
        'answer':
            'Es completamente normal. La meditación no se trata de vaciar la mente, sino de observar los pensamientos sin juzgarlos. Con práctica, aprenderás a dejarlos pasar como nubes en el cielo.',
      },
      {
        'question': '¿Puedo meditar acostado?',
        'answer':
            'Sí, aunque sentarse ayuda a mantener la alerta. Si eliges acostarte, asegúrate de no quedarte dormido a menos que estés haciendo una meditación para dormir.',
      },
      {
        'question': '¿La meditación es religiosa?',
        'answer':
            'No necesariamente. Aunque tiene raíces en tradiciones espirituales, la meditación moderna puede practicarse de forma secular, enfocándose en el bienestar mental y físico.',
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CommonAppBar(title: 'Preguntas frecuentes'),
      body: ListView.separated(
        padding: EdgeInsets.all(AppSpacing.mdW),
        itemCount: faqItems.length,
        separatorBuilder: (context, index) => SizedBox(height: AppSpacing.mdH),
        itemBuilder: (context, index) {
          final item = faqItems[index];
          return _FaqItem(question: item['question'] as String, answer: item['answer'] as String);
        },
      ),
    );
  }
}

class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FaqItem({required this.question, required this.answer});

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppBorderRadius.lg)),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppBorderRadius.lg)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppBorderRadius.lg)),
        collapsedBackgroundColor: AppColors.grey200,
        backgroundColor: AppColors.cordBronze.withValues(alpha: .4),
        title: Text(widget.question, style: AppTypography.titleSmall.copyWith(fontWeight: FontWeight.w600)),
        trailing: _isExpanded ? IconifyIcon(icon: 'ic:round-close') : IconifyIcon(icon: 'ic:round-plus'),
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(AppSpacing.mdW, 0, AppSpacing.mdW, AppSpacing.mdH),
            child: Text(widget.answer, style: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary)),
          ),
        ],
      ),
    );
  }
}
