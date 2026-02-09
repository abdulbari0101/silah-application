import 'package:flutter/material.dart';
import 'lawyer_license_verification_page.dart';


class LawyerProfessionalInfoPage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String password;

  const LawyerProfessionalInfoPage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
  });

  @override
  State<LawyerProfessionalInfoPage> createState() => _LawyerProfessionalInfoPageState();
}

class _LawyerProfessionalInfoPageState extends State<LawyerProfessionalInfoPage> {
  static const bg = Color(0xFFE8F3EC);
  static const primaryGreen = Color(0xFF1F6B3B);
  static const muted = Color(0xFF5E6E66);

  final _formKey = GlobalKey<FormState>();

  String? _legalField;
  String? _city;

  // جهة العمل
  String _workplace = 'أملك مكتب محاماة';

  final _officeNameCtrl = TextEditingController();
  final _experienceCtrl = TextEditingController();

  @override
  void dispose() {
    _officeNameCtrl.dispose();
    _experienceCtrl.dispose();
    super.dispose();
  }

  InputDecoration _dec(String hint, {Widget? suffix}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Color(0xFF9AA8A0), fontWeight: FontWeight.w700),
      filled: true,
      fillColor: const Color(0xFFF3F7F4),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFE6EEE9)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFFBFD8C8), width: 1.4),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.4),
      ),
      suffixIcon: suffix,
    );
  }

  Widget _req(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
          children: [
            TextSpan(text: text, style: const TextStyle(color: muted)),
            const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }

  String? _requiredDropdown(String? v, String msg) {
    if (v == null || v.trim().isEmpty) return msg;
    return null;
  }

  String? _requiredText(String? v, String msg) {
    if (v == null || v.trim().isEmpty) return msg;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bg,
        body: Stack(
          children: [
            Container(color: bg),
            Container(
              height: 140,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(34)),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 14, 22, 18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back_ios_new_rounded,
                              color: primaryGreen, size: 20),
                        ),
                        const Spacer(),
                        const Text(
                          'المعلومات المهنية',
                          style: TextStyle(
                            color: primaryGreen,
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 60),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _req('المجال القانوني'),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            value: _legalField,
                            decoration: _dec('اختر المجال القانوني',
                                suffix: const Icon(Icons.keyboard_arrow_down_rounded)),
                            items: const [
                              DropdownMenuItem(value: 'تجاري', child: Text('تجاري')),
                              DropdownMenuItem(value: 'أحوال شخصية', child: Text('أحوال شخصية')),
                              DropdownMenuItem(value: 'جنائي', child: Text('جنائي')),
                              DropdownMenuItem(value: 'عمالي', child: Text('عمالي')),
                              DropdownMenuItem(value: 'إداري', child: Text('إداري')),
                            ],
                            onChanged: (v) => setState(() => _legalField = v),
                            validator: (v) => _requiredDropdown(v, 'المجال القانوني مطلوب'),
                          ),

                          const SizedBox(height: 14),

                          _req('المدينة'),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            value: _city,
                            decoration: _dec('اختر المدينة',
                                suffix: const Icon(Icons.keyboard_arrow_down_rounded)),
                            items: const [
                              DropdownMenuItem(value: 'الرياض', child: Text('الرياض')),
                              DropdownMenuItem(value: 'جدة', child: Text('جدة')),
                              DropdownMenuItem(value: 'الدمام', child: Text('الدمام')),
                              DropdownMenuItem(value: 'مكة', child: Text('مكة')),
                              DropdownMenuItem(value: 'المدينة', child: Text('المدينة')),
                            ],
                            onChanged: (v) => setState(() => _city = v),
                            validator: (v) => _requiredDropdown(v, 'المدينة مطلوبة'),
                          ),

                          const SizedBox(height: 14),

                          _req('جهة العمل'),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: _RadioPill(
                                  label: 'أملك مكتب محاماة',
                                  selected: _workplace == 'أملك مكتب محاماة',
                                  onTap: () => setState(() => _workplace = 'أملك مكتب محاماة'),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: _RadioPill(
                                  label: 'أعمل لدى مكتب محاماة',
                                  selected: _workplace == 'أعمل لدى مكتب محاماة',
                                  onTap: () => setState(() => _workplace = 'أعمل لدى مكتب محاماة'),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 14),

                          _req('اسم المكتب'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _officeNameCtrl,
                            decoration: _dec('اسم المكتب'),
                            validator: (v) => _requiredText(v, 'اسم المكتب مطلوب'),
                          ),

                          const SizedBox(height: 14),

                          Align(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              'سنوات الخبرة (اختياري)',
                              style: TextStyle(color: muted, fontSize: 12, fontWeight: FontWeight.w800),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _experienceCtrl,
                            keyboardType: TextInputType.number,
                            decoration: _dec('مثال: 5'),
                          ),

                          const SizedBox(height: 22),

                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 48,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryGreen,
                                      foregroundColor: Colors.white,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => LawyerLicenseVerificationPage(
                                              name: widget.name,
                                              email: widget.email,
                                              phone: widget.phone,
                                              gender: widget.gender,
                                              password: widget.password,
                                              legalField: _legalField!,
                                              city: _city!,
                                              workplace: _workplace,
                                              officeName: _officeNameCtrl.text.trim(),
                                              experienceYears: _experienceCtrl.text.trim(),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text('التالي', style: TextStyle(fontWeight: FontWeight.w900)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: SizedBox(
                                  height: 48,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: const Color(0xFF1F2A24),
                                      backgroundColor: const Color(0xFFDCEBE2),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      side: BorderSide(color: Colors.white.withOpacity(0.0)),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('عودة', style: TextStyle(fontWeight: FontWeight.w900)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RadioPill extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _RadioPill({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFD7E9DD) : const Color(0xFFF3F7F4),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? const Color(0xFFBFD8C8) : const Color(0xFFE6EEE9),
          ),
        ),
        child: Row(
          children: [
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              size: 18,
              color: selected ? const Color(0xFF1F6B3B) : const Color(0xFF9AA8A0),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                  color: const Color(0xFF1F2A24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
