import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../home/home_screen.dart';

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
  State<LawyerLicenseVerificationPage> createState() =>
      _LawyerLicenseVerificationPageState();
}

class _LawyerLicenseVerificationPageState
    extends State<LawyerLicenseVerificationPage> {
  static const bg = Color(0xFFE8F3EC);
  static const primaryGreen = Color(0xFF1F6B3B);
  static const muted = Color(0xFF5E6E66);

  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  final _licenseCtrl = TextEditingController();
  final _nationalIdCtrl = TextEditingController();

  bool _agree = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _licenseCtrl.dispose();
    _nationalIdCtrl.dispose();
    super.dispose();
  }

  Future<void> _createLawyerAccount() async {
    if (!_agree) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى الموافقة على الشروط والأحكام')),
      );
      return;
    }
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final result = await _authService.createLawyerAccount(
      // Personal info
      name: widget.name,
      email: widget.email,
      phone: widget.phone,
      gender: widget.gender,
      password: widget.password,
      // Professional info
      legalField: widget.legalField,
      city: widget.city,
      workplace: widget.workplace,
      officeName: widget.officeName,
      experienceYears: widget.experienceYears,
      // License info
      licenseNumber: _licenseCtrl.text.trim(),
      nationalId: _nationalIdCtrl.text.trim(),
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (result.isSuccess) {
      _showSuccessDialog();
    } else {
      _showErrorDialog(result.errorMessage!);
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Row(
            children: [
              Icon(Icons.check_circle_outline, color: primaryGreen),
              SizedBox(width: 8),
              Text(
                'تم إنشاء الحساب',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          content: const Text(
            'تم إرسال بيانات التحقق بنجاح.\n'
            'سيتم مراجعة حسابك وتفعيله خلال فترة قصيرة.',
            style: TextStyle(fontSize: 15, height: 1.5),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                  (route) => false,
                );
              },
              child: const Text(
                'تم',
                style: TextStyle(
                  color: primaryGreen,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Row(
            children: [
              Icon(Icons.error_outline, color: Colors.redAccent),
              SizedBox(width: 8),
              Text('خطأ', style: TextStyle(fontWeight: FontWeight.w800)),
            ],
          ),
          content: Text(
            message,
            style: const TextStyle(fontSize: 15, height: 1.5),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'حسناً',
                style: TextStyle(
                  color: primaryGreen,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _dec(String hint) {
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
    );
  }

  Widget _req(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
          children: [
            TextSpan(
              text: text,
              style: const TextStyle(color: muted),
            ),
            const TextSpan(
              text: ' *',
              style: TextStyle(color: Colors.red),
            ),
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
                            decoration: _dec(
                              'أدخل رقم الترخيص كما هو مسجل في ناجز',
                            ),
                            validator: (v) =>
                                _requiredText(v, 'رقم الترخيص مطلوب'),
                          ),

                          const SizedBox(height: 14),

                          _req('رقم الهوية'),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _nationalIdCtrl,
                            keyboardType: TextInputType.number,
                            decoration: _dec('أدخل رقم الهوية الخاص بك'),
                            validator: (v) =>
                                _requiredText(v, 'رقم الهوية مطلوب'),
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
                              onPressed: _isLoading
                                  ? null
                                  : _createLawyerAccount,
                              child: _isLoading
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.5,
                                      ),
                                    )
                                  : const Text(
                                      'إنشاء حساب محامي',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                      ),
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
                                onChanged: (v) =>
                                    setState(() => _agree = v ?? false),
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
