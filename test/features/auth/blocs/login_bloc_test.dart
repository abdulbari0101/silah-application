/*
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:silah_app/core/infrastructure/analytics/logger/app_logger.dart';
import 'package:silah_app/core/infrastructure/errors/failures.dart';
import 'package:silah_app/core/injection/injection_container.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/app_state_bloc.dart';
import 'package:silah_app/core/presentation/state_magment/blocs/app_state/state_data/app_auth_status.dart';
import 'package:silah_app/features/auth/domain/entities/auth_user_entity.dart';
import 'package:silah_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/login_bloc.dart';
import 'package:silah_app/features/auth/presentation/blocs/login/login_operation_type.dart';

// ── Mocks ──────────────────────────────────────────────────────────
class MockAuthRepo extends Mock implements AuthRepo {}

class MockAppStateBloc extends Mock implements AppStateBloc {}

// ── Test Data ──────────────────────────────────────────────────────
const _validEmail = 'admin@gmail.com';
const _validPassword = '654321';

const _authUser = AuthUserEntity(
  uid: 'user-123',
  fullName: 'رغد الدربي',
  email: _validEmail,
  accountType: AuthAccountType.user,
);

// ── Tests ──────────────────────────────────────────────────────────
void main() {
  late MockAuthRepo mockAuthRepo;
  late MockAppStateBloc mockAppStateBloc;

  setUpAll(() {
    registerFallbackValue(
      const AppStateEvent.userLoggedIn(authData: null, userAuthStatus: null),
    );
    if (!locator.isRegistered<AppLogger>()) {
      locator.registerSingleton<AppLogger>(AppLogger());
    }
  });

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    mockAppStateBloc = MockAppStateBloc();
    when(() => mockAppStateBloc.add(any())).thenReturn(null);
  });

  LoginBloc buildBloc() => LoginBloc(
        repository: mockAuthRepo,
        appStateBloc: mockAppStateBloc,
      );

  group('Login Authentication', () {
    // ─── 1: Test login with correct credentials ────────────────────
    blocTest<LoginBloc, LoginState>(
      'TC-01: Login successful with correct email and password',
      setUp: () {
        when(() => mockAuthRepo.signIn(
              email: _validEmail,
              password: _validPassword,
            )).thenAnswer((_) async => const Right(_authUser));
      },
      build: buildBloc,
      act: (bloc) => bloc.add(
        const LoginEvent.requested(
          email: _validEmail,
          password: _validPassword,
        ),
      ),
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const LoginState.loading(operationType: LoginOperationType.signIn),
        const LoginState.success(operationType: LoginOperationType.signIn),
      ],
    );

    // ─── 2: Test login with wrong email ────────────────────────────
    blocTest<LoginBloc, LoginState>(
      'TC-02: Error when logging in with wrong email',
      setUp: () {
        when(() => mockAuthRepo.signIn(
              email: 'wrong@email.com',
              password: _validPassword,
            )).thenAnswer(
          (_) async => const Left(
            AuthFailure('Invalid email or password', 401),
          ),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(
        const LoginEvent.requested(
          email: 'wrong@email.com',
          password: _validPassword,
        ),
      ),
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const LoginState.loading(operationType: LoginOperationType.signIn),
        isA<LoginError>(),
      ],
    );

    // ─── 3: Test login with wrong password ─────────────────────────
    blocTest<LoginBloc, LoginState>(
      'TC-03: Error when logging in with wrong password',
      setUp: () {
        when(() => mockAuthRepo.signIn(
              email: _validEmail,
              password: 'WrongPass@999',
            )).thenAnswer(
          (_) async => const Left(
            AuthFailure('Invalid email or password', 401),
          ),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(
        const LoginEvent.requested(
          email: _validEmail,
          password: 'WrongPass@999',
        ),
      ),
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const LoginState.loading(operationType: LoginOperationType.signIn),
        isA<LoginError>(),
      ],
    );

    // ─── 4: Test login with empty email and password ───────────────
    blocTest<LoginBloc, LoginState>(
      'TC-04: Error when email and password are empty',
      setUp: () {
        when(() => mockAuthRepo.signIn(
              email: '',
              password: '',
            )).thenAnswer(
          (_) async => const Left(
            InvalidInputFailure('Email and password are required'),
          ),
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(
        const LoginEvent.requested(
          email: '',
          password: '',
        ),
      ),
      wait: const Duration(milliseconds: 300),
      expect: () => [
        const LoginState.loading(operationType: LoginOperationType.signIn),
        isA<LoginError>(),
      ],
    );
  });
}
*/
