import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_morty_universe/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryTest extends Mock implements DashBoardRepository {}

@GenerateNiceMocks([MockSpec<DashboardRepositoryTest>()])
void main() {
  late DashboardRepositoryTest dashboardRepositoryTest;

  setUp() {
    dashboardRepositoryTest = DashboardRepositoryTest();
  }

  test(
    '',
    () async => {},
  );
}
