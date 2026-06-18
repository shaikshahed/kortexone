import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kortexone_mobile/core/usecases/usecase.dart';
import 'package:kortexone_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:kortexone_mobile/features/auth/domain/usecases/logout_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LogoutUseCase useCase;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    useCase = LogoutUseCase(mockRepository);
  });

  test('should call logout on repository when invoked', () async {
    // arrange
    when(() => mockRepository.logout())
        .thenAnswer((_) async => const Right(null));

    // act
    final result = await useCase(const NoParams());

    // assert
    expect(result, const Right(null));
    verify(() => mockRepository.logout()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
