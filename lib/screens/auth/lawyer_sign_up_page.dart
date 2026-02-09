import 'package:flutter/material.dart';
import 'lawyer_professional_info_page.dart';

class LawyerSignUpPage extends StatefulWidget {
  const LawyerSignUpPage({super.key});

  @override
  State<LawyerSignUpPage> createState() => _LawyerSignUpPageState();
}

class _LawyerSignUpPageState extends State<LawyerSignUpPage> {
  static const bg = Color(0xFFE8F3EC);
  static const primaryGreen = Color(0xFF1F6B3B);
  static const muted = Color(0xFF5E6E66);

  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  String? _gender; // dropdown
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  bool _hidePass1 = true;
  bool _hidePass2 = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  InputDecoration _dec(String hint, {Widget? suffix, Widget? prefix}) {
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
      prefixIcon: prefix,
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

  String? _required(String? v, String msg) {
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
                          'إنشاء حساب محامي',
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
                          _req('الاسم الكامل'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _nameCtrl,
                            decoration: _dec('الاسم الكامل'),
                            validator: (v) => _required(v, 'الاسم الكامل مطلوب'),
                          ),

                          const SizedBox(height: 14),
                          _req('البريد الإلكتروني'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            decoration: _dec('البريد الإلكتروني'),
                            validator: (v) {
                              final req = _required(v, 'البريد الإلكتروني مطلوب');
                              if (req != null) return req;
                              final value = v!.trim();
                              if (!value.contains('@') || !value.contains('.')) {
                                return 'البريد الإلكتروني غير صحيح';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 14),
                          _req('رقم الجوال'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _phoneCtrl,
                            keyboardType: TextInputType.phone,
                            decoration: _dec('رقم الجوال'),
                            validator: (v) {
                              final req = _required(v, 'رقم الجوال مطلوب');
                              if (req != null) return req;
                              if (v!.trim().length < 9) return 'رقم الجوال غير صحيح';
                              return null;
                            },
                          ),

                          const SizedBox(height: 14),
                          _req('الجنس'),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            value: _gender,
                            decoration: _dec('الجنس', suffix: const Icon(Icons.keyboard_arrow_down_rounded)),
                            items: const [
                              DropdownMenuItem(value: 'ذكر', child: Text('ذكر')),
                              DropdownMenuItem(value: 'أنثى', child: Text('أنثى')),
                            ],
                            onChanged: (v) => setState(() => _gender = v),
                            validator: (v) => (v == null || v.isEmpty) ? 'الجنس مطلوب' : null,
                          ),

                          const SizedBox(height: 14),
                          Align(
                            alignment: Alignment.centerRight,
                            child: const Text('كلمة المرور',
                                style: TextStyle(color: muted, fontSize: 12, fontWeight: FontWeight.w800)),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _passCtrl,
                            obscureText: _hidePass1,
                            decoration: _dec(
                              'كلمة المرور',
                              suffix: IconButton(
                                onPressed: () => setState(() => _hidePass1 = !_hidePass1),
                                icon: Icon(
                                  _hidePass1 ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                  color: const Color(0xFF8FA197),
                                ),
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) return 'كلمة المرور مطلوبة';
                              if (v.length < 6) return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                              return null;
                            },
                          ),

                          const SizedBox(height: 14),
                          Align(
                            alignment: Alignment.centerRight,
                            child: const Text('تأكيد كلمة المرور',
                                style: TextStyle(color: muted, fontSize: 12, fontWeight: FontWeight.w800)),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _confirmCtrl,
                            obscureText: _hidePass2,
                            decoration: _dec(
                              'تأكيد كلمة المرور',
                              suffix: IconButton(
                                onPressed: () => setState(() => _hidePass2 = !_hidePass2),
                                icon: Icon(
                                  _hidePass2 ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                  color: const Color(0xFF8FA197),
                                ),
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) return 'تأكيد كلمة المرور مطلوب';
                              if (v != _passCtrl.text) return 'كلمة المرور غير متطابقة';
                              return null;
                            },
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
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => LawyerProfessionalInfoPage(
                                              name: _nameCtrl.text.trim(),
                                              email: _emailCtrl.text.trim(),
                                              phone: _phoneCtrl.text.trim(),
                                              gender: _gender!,
                                              password: _passCtrl.text,
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
                                      side: BorderSide(color: Colors.white.withOpacity(0.0)),
                                      backgroundColor: const Color(0xFFDCEBE2),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
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
