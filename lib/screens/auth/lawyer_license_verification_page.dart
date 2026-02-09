import 'package:flutter/material.dart';

class LawyerLicenseVerificationPage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String password;

  final String legalField;
  final String city;
  final String workplace;
  final String officeName;
  final String experienceYears;

  const LawyerLicenseVerificationPage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
    required this.legalField,
    required this.city,
    required this.workplace,
    required this.officeName,
    required this.experienceYears,
  });

  @override
  State<LawyerLicenseVerificationPage> createState() => _LawyerLicenseVerificationPageState();
}

class _LawyerLicenseVerificationPageState extends State<LawyerLicenseVerificationPage> {
  static const bg = Color(0xFFE8F3EC);
  static const primaryGreen = Color(0xFF1F6B3B);
  static const muted = Color(0xFF5E6E66);

  final _formKey = GlobalKey<FormState>();

  final _licenseCtrl = TextEditingController();
  final _nationalIdCtrl = TextEditingController();

  bool _agree = false;

  @override
  void dispose() {
    _licenseCtrl.dispose();
    _nationalIdCtrl.dispose();
    super.dispose();
  }

  InputDecoration _dec(String hint) {
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
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: primaryGreen,
                            size: 20,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          'التحقق من الرخصة',
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
                          _req('رقم ترخيص المحاماة'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _licenseCtrl,
                            keyboardType: TextInputType.number,
                            decoration: _dec('أدخل رقم الترخيص كما هو مسجل في ناجز'),
                            validator: (v) => _requiredText(v, 'رقم الترخيص مطلوب'),
                          ),

                          const SizedBox(height: 14),

                          _req('رقم الهوية'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _nationalIdCtrl,
                            keyboardType: TextInputType.number,
                            decoration: _dec('أدخل رقم الهوية الخاص بك'),
                            validator: (v) => _requiredText(v, 'رقم الهوية مطلوب'),
                          ),

                          const SizedBox(height: 12),

                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'سيتم التحقق من البيانات ومراجعتها قبل تفعيل حساب المحامي.\n'
                                  'قد يتطلب الأمر بعض الوقت.',
                              style: TextStyle(
                                color: muted,
                                fontSize: 12,
                                height: 1.6,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          const SizedBox(height: 18),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
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
                                if (!_agree) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('يرجى الموافقة على الشروط والأحكام')),
                                  );
                                  return;
                                }
                                if (_formKey.currentState!.validate()) {
                                  // رؤوس أقلام:
                                  // 1) إنشاء حساب Firebase Auth بالبريد/كلمة المرور
                                  // 2) حفظ بيانات المحامي في Firestore (lawyers)
                                  // 3) license.verified = false (إلى حين مراجعة الإدارة)
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('تم إرسال بيانات التحقق ✅')),
                                  );
                                }
                              },
                              child: const Text(
                                'إنشاء حساب محامي',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: _agree,
                                activeColor: primaryGreen,
                                onChanged: (v) => setState(() => _agree = v ?? false),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    'بالضغط على إنشاء الحساب، فإنك توافق على الشروط والأحكام وسياسة الخصوصية.',
                                    style: TextStyle(
                                      color: muted,
                                      fontSize: 12,
                                      height: 1.5,
                                      fontWeight: FontWeight.w700,
                                    ),
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
