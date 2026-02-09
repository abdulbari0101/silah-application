import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  static const bg = Color(0xFFE8F3EC);
  static const primaryGreen = Color(0xFF1F6B3B);
  static const muted = Color(0xFF5E6E66);

  final _formKey = GlobalKey<FormState>();
  final _loginCtrl = TextEditingController(); // email or phone
  final _passCtrl = TextEditingController();

  bool _hidePass = true;

  @override
  void dispose() {
    _loginCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  InputDecoration _dec(String hint, {Widget? suffix}) {
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

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bg,
        body: Stack(
          children: [
            Container(color: bg),

            // الهيدر الأبيض (مثل باقي صفحاتك)
            Container(
              height: 170,
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
                    // زر رجوع (نفس الصورة فيه سهم)
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
                        const SizedBox(width: 20),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // الشعار
                    Image.asset(
                      'assets/images/silah_logo1.png',
                      width: 120,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'أهلاً بعودتك!',
                      style: TextStyle(
                        color: primaryGreen,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'ادخل البيانات التالية للتمكن من الوصول إلى حسابك',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: muted,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 22),

                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _loginCtrl,
                            textInputAction: TextInputAction.next,
                            decoration: _dec('البريد الإلكتروني أو رقم الجوال'),
                            validator: (v) {
                              if (v == null || v.trim().isEmpty) {
                                return 'الرجاء إدخال البريد أو رقم الجوال';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 12),

                          TextFormField(
                            controller: _passCtrl,
                            obscureText: _hidePass,
                            textInputAction: TextInputAction.done,
                            decoration: _dec(
                              'كلمة المرور',
                              suffix: IconButton(
                                onPressed: () => setState(() => _hidePass = !_hidePass),
                                icon: Icon(
                                  _hidePass ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                  color: const Color(0xFF8FA197),
                                ),
                              ),
                            ),
                            validator: (v) {
                              if (v == null || v.isEmpty) return 'الرجاء إدخال كلمة المرور';
                              return null;
                            },
                          ),

                          const SizedBox(height: 10),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('نسيت كلمة المرور (لاحقًا)')),
                                );
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: muted,
                                padding: EdgeInsets.zero,
                              ),
                              child: const Text(
                                'هل نسيت كلمة المرور؟',
                                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryGreen,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // رؤوس أقلام:
                                  // 1) Firebase Auth signInWithEmailAndPassword
                                  // 2) أو تسجيل بالجوال (لاحقًا)
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('تم تسجيل الدخول ✅')),
                                  );
                                }
                              },
                              child: const Text(
                                'تسجيل الدخول',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'ليس لديك حساب؟',
                                style: TextStyle(
                                  color: muted,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // هنا لاحقًا نروح AccountTypePage أو SignUp حسب اختيارك
                                  Navigator.pop(context);
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: primaryGreen,
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                ),
                                child: const Text(
                                  'سجل الآن',
                                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
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
