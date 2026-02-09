import 'package:flutter/material.dart';

class UserSignUpPage extends StatefulWidget {
  const UserSignUpPage({super.key});

  @override
  State<UserSignUpPage> createState() => _UserSignUpPageState();
}

class _UserSignUpPageState extends State<UserSignUpPage> {
  static const bg = Color(0xFFE8F3EC);
  static const primaryGreen = Color(0xFF1F6B3B);
  static const muted = Color(0xFF5E6E66);

  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
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

  InputDecoration _fieldDecoration(String hint, {Widget? suffix}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Color(0xFF9AA8A0),
        fontWeight: FontWeight.w700,
      ),
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

  Widget _requiredHint(String text) {
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

  String? _requiredValidator(String? v, String message) {
    if (v == null || v.trim().isEmpty) return message;
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
            // الخلفية
            Container(color: bg),

            Container(
              height: 114,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(34),
                ),
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
                          'إنشاء حساب مستخدم',
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

                    const SizedBox(height: 75),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _requiredHint('الاسم الكامل'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _nameCtrl,
                            textInputAction: TextInputAction.next,
                            decoration: _fieldDecoration('الاسم الكامل'),
                            validator: (v) =>
                                _requiredValidator(v, 'الاسم الكامل مطلوب'),
                          ),

                          const SizedBox(height: 14),

                          _requiredHint('البريد الإلكتروني'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: _fieldDecoration('البريد الإلكتروني'),
                            validator: (v) {
                              final req = _requiredValidator(
                                  v, 'البريد الإلكتروني مطلوب');
                              if (req != null) return req;
                              final value = v!.trim();
                              if (!value.contains('@') ||
                                  !value.contains('.')) {
                                return 'البريد الإلكتروني غير صحيح';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 14),

                          _requiredHint('رقم الجوال'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _phoneCtrl,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            decoration: _fieldDecoration('رقم الجوال'),
                            validator: (v) {
                              final req =
                              _requiredValidator(v, 'رقم الجوال مطلوب');
                              if (req != null) return req;
                              final value = v!.trim();
                              if (value.length < 9) return 'رقم الجوال غير صحيح';
                              return null;
                            },
                          ),

                          const SizedBox(height: 14),

                          Align(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              'كلمة المرور',
                              style: TextStyle(
                                color: muted,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _passCtrl,
                            obscureText: _hidePass1,
                            textInputAction: TextInputAction.next,
                            decoration: _fieldDecoration(
                              'كلمة المرور',
                              suffix: IconButton(
                                onPressed: () =>
                                    setState(() => _hidePass1 = !_hidePass1),
                                icon: Icon(
                                  _hidePass1
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: const Color(0xFF8FA197),
                                ),
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'كلمة المرور مطلوبة';
                              }
                              if (v.length < 6) {
                                return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 14),

                          Align(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              'تأكيد كلمة المرور',
                              style: TextStyle(
                                color: muted,
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _confirmCtrl,
                            obscureText: _hidePass2,
                            textInputAction: TextInputAction.done,
                            decoration: _fieldDecoration(
                              'تأكيد كلمة المرور',
                              suffix: IconButton(
                                onPressed: () =>
                                    setState(() => _hidePass2 = !_hidePass2),
                                icon: Icon(
                                  _hidePass2
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: const Color(0xFF8FA197),
                                ),
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'تأكيد كلمة المرور مطلوب';
                              }
                              if (v != _passCtrl.text) {
                                return 'كلمة المرور غير متطابقة';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 22),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryGreen,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('تم التحقق ✅ جاهز لإنشاء الحساب'),
                                    ),
                                  );
                                }
                              },
                              child: const Text(
                                'تسجيل مستخدم جديد',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'لديك حساب بالفعل؟',
                                style: TextStyle(
                                  color: muted,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                style: TextButton.styleFrom(
                                  foregroundColor: primaryGreen,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                ),
                                child: const Text(
                                  'سجل دخول الآن',
                                  style: TextStyle(fontWeight: FontWeight.w900),
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
