import 'package:flutter/material.dart';
import 'auth/user_sign_up.dart';
import 'auth/lawyer_sign_up_page.dart';

enum AccountType { user, lawyer }

class AccountTypePage extends StatelessWidget {
  const AccountTypePage({super.key});

  static const Color bg = Color(0xFFE8F3EC);
  static const Color primaryGreen = Color(0xFF1F6B3B);
  static const Color titleDark = Color(0xFF1F2A24);
  static const Color muted = Color(0xFF5E6E66);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // الخلفية مع منحنى ناعم
            Positioned.fill(
              child: ClipPath(
                clipper: _TopCurveClipper(),
                child: Container(color: bg),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  children: [
                    const SizedBox(height: 18),

                    Image.asset(
                      'assets/images/silah_logo1.png',
                      width: 140,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'اختر نوع حسابك',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: titleDark,
                      ),
                    ),

                    const SizedBox(height: 14),

                    const Text(
                      'لتحسين تجربتك في صلة\n'
                          'يرجى اختيار نوع الحساب المتوافق مع استخدامك',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.6,
                        color: muted,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 26),

                    // مستخدم
                    _RoleCard(
                      title: 'مستخدم',
                      subtitle:
                      'البحث عن استشارات قانونية، متابعة القضايا أو\n'
                          'التقديم على فرص التدريب',
                      icon: Icons.person_outline,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const UserSignUpPage()),
                        );
                      },
                    ),

                    const SizedBox(height: 18),

                    // محامي
                    _RoleCard(
                      title: 'محامي مرخّص',
                      subtitle:
                      'لتقديم الاستشارات القانونية المعتمدة، إدارة\n'
                          'القضايا واستقبال طلبات التدريب',
                      icon: Icons.balance_outlined,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LawyerSignUpPage()),
                        );
                      },
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

class _RoleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _RoleCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  static const Color primaryGreen = Color(0xFF1F6B3B);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: primaryGreen,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              blurRadius: 14,
              offset: Offset(0, 8),
              color: Color(0x22000000),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // الأيقونة على اليمين (RTL) داخل مربع
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 12),

            // النصوص: عنوان + وصف (محاذاة يمين)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 12,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Clipper للمنحنى
class _TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final p = Path();
    p.lineTo(0, 0);

    final curveStartY = size.height * 0.18;
    p.lineTo(0, curveStartY);

    p.quadraticBezierTo(
      size.width * 0.50,
      size.height * 0.28,
      size.width,
      curveStartY,
    );

    p.lineTo(size.width, size.height);
    p.lineTo(0, size.height);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
