import 'package:flutter/material.dart';
import 'account_type_page.dart';
import 'auth/sign_in_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const Color bg = Color(0xFFE8F3EC);
  static const Color cardBg = Color(0xFFE3F0E7);
  static const Color primaryGreen = Color(0xFF1F6B3B);
  static const Color textDark = Color(0xFF1F2A24);
  static const Color textMuted = Color(0xFF5E6E66);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: bg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                const SizedBox(height: 30),

                Image.asset(
                  'assets/images/silah_logo1.png',
                  width: 220,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 24),

                const Text(
                  'منصة تتيح للمحامين عرض خبراتهم والتواصل مع العملاء،\n'
                      'وتقدم للمستخدمين استشارات قانونية موثوقة ومباشرة.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textDark,
                    fontSize: 14,
                    height: 1.6,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 24),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Column(
                    children: [
                      _OptionTile(
                        title: 'الأفراد / خريجو القانون',
                        subtitle:
                        'طلب استشارات قانونية موثوقة والتواصل مع محامين\n'
                            'متخصصين، مع إمكانية التقديم على فرص التدريب المتاحة لخريجي القانون.',
                        icon: Icons.person_outline,
                      ),
                      SizedBox(height: 18),
                      _OptionTile(
                        title: 'المحامين المرخصين',
                        subtitle:
                        'عرض الخبرات والخدمات، إدارة الاستشارات والتواصل مع العملاء،\n'
                            'ونشر فرص التدريب لخريجي القانون.',
                        icon: Icons.balance_outlined,
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 54,
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const AccountTypePage()),
                      );
                    },
                    child: const Text(
                      'ابدأ الآن',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
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
                        color: textMuted,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SignInPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      ),
                      child: const Text(
                        'تسجيل دخول',
                        style: TextStyle(
                          color: primaryGreen,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _OptionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFFD7E9DD),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF1F6B3B)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF1F2A24),
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFF5E6E66),
                  fontSize: 13,
                  height: 1.6,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
