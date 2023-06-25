import 'persistence.dart';

/// An in-memory implementation of [PlayerProgressPersistence].
/// Useful for testing.
class MemoryOnlyPersistence implements Persistance {
  int level = 0;

  @override
  Future<int> getTmpData() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return level;
  }
}
