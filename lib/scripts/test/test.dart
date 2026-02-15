// ignore_for_file: public_member_api_docs, sort_constructors_first
class test {
  int? x;
  test({
    this.x,
  });

  @override
  String toString() => 'test(x: $x)';

  test copyWith({
    int? x,
  }) {
    return test(
      x: x ?? this.x,
    );
  }
}
