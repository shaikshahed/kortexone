import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kortexone_mobile/core/error/failures.dart';
import 'package:kortexone_mobile/core/usecases/usecase.dart';
import 'package:kortexone_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:kortexone_mobile/features/auth/domain/usecases/login_usecase.dart';
import 'package:kortexone_mobile/features/auth/domain/usecases/logout_usecase.dart';
import 'package:kortexone_mobile/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:kortexone_mobile/features/auth/presentation/bloc/auth_event.dart';
import 'package:kortexone_mobile/features/auth/presentation/bloc/auth_state.dart';
import 'package:kortexone_mobile/features/auth/domain/entities/user.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}
class MockLogoutUseCase extends Mock implements LogoutUseCase {}
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late AuthBloc authBloc;
  late MockLoginUseCase mockLoginUseCase;
  late MockLogoutUseCase mockLogoutUseCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    mockLogoutUseCase = MockLogoutUseCase();
    mockAuthRepository = MockAuthRepository();
    authBloc = AuthBloc(mockLoginUseCase, mockLogoutUseCase, mockAuthRepository);
  });

  tearDown(() {
    authBloc.close();
  });

  group('AuthLogoutRequested', () {
    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, AuthUnauthenticated] when logout succeeds',
      build: () {
        when(() => mockLogoutUseCase(const NoParams()))
            .thenAnswer((_) async => const Right(null));
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthLogoutRequested()),
      expect: () => [
        AuthLoading(),
        AuthUnauthenticated(),
      ],
      verify: (_) {
        verify(() => mockLogoutUseCase(const NoParams())).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, AuthFailure] when logout fails',
      build: () {
        when(() => mockLogoutUseCase(const NoParams()))
            .thenAnswer((_) async => const Left(ServerFailure('Logout failed')));
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthLogoutRequested()),
      expect: () => [
        AuthLoading(),
        const AuthFailure('Logout failed'),
      ],
      verify: (_) {
        verify(() => mockLogoutUseCase(const NoParams())).called(1);
      },
    );
  });

  group('AuthCheckRequested', () {
    const tUser = User(
      id: '1',
      email: 'test@example.com',
      name: 'Test User',
    );

    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, AuthAuthenticated] when getCachedUser succeeds with user',
      build: () {
        when(() => mockAuthRepository.getCachedUser())
            .thenAnswer((_) async => const Right(tUser));
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthCheckRequested()),
      expect: () => [
        AuthLoading(),
        const AuthAuthenticated(tUser),
      ],
      verify: (_) {
        verify(() => mockAuthRepository.getCachedUser()).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, AuthUnauthenticated] when getCachedUser succeeds with null',
      build: () {
        when(() => mockAuthRepository.getCachedUser())
            .thenAnswer((_) async => const Right(null));
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthCheckRequested()),
      expect: () => [
        AuthLoading(),
        AuthUnauthenticated(),
      ],
      verify: (_) {
        verify(() => mockAuthRepository.getCachedUser()).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, AuthUnauthenticated] when getCachedUser fails',
      build: () {
        when(() => mockAuthRepository.getCachedUser())
            .thenAnswer((_) async => const Left(CacheFailure('Cache error')));
        return authBloc;
      },
      act: (bloc) => bloc.add(AuthCheckRequested()),
      expect: () => [
        AuthLoading(),
        AuthUnauthenticated(),
      ],
      verify: (_) {
        verify(() => mockAuthRepository.getCachedUser()).called(1);
      },
    );
  });
}
