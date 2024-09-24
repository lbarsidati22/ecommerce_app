class TestPrudact {
  String testImage;
  double testPrice;
  String testname;
  String testLocation;
  TestPrudact({
    this.testLocation = 'Noukchoot',
    required this.testImage,
    required this.testname,
    required this.testPrice,
  });
}

List<TestPrudact> myTestList = [
  TestPrudact(
      testname: 'Prudact 1',
      testLocation: 'BIG market',
      testImage: 'assets/images/1.webp',
      testPrice: 12.89),
  TestPrudact(
      testname: 'Prudact 2',
      testImage: 'assets/images/2.webp',
      testPrice: 12.89),
  TestPrudact(
      testname: 'Prudact 3',
      testImage: 'assets/images/3.webp',
      testPrice: 12.89),
  TestPrudact(
      testname: 'Prudact 4',
      testImage: 'assets/images/4.webp',
      testPrice: 12.89),
  TestPrudact(
      testname: 'Prudact 5',
      testImage: 'assets/images/5.webp',
      testPrice: 12.89),
  TestPrudact(
      testname: 'Prudact 6',
      testImage: 'assets/images/6.webp',
      testPrice: 12.89),
  TestPrudact(
      testname: 'Prudact 7',
      testImage: 'assets/images/7.webp',
      testPrice: 12.89),
  TestPrudact(
      testname: 'Prudact 8',
      testImage: 'assets/images/8.webp',
      testPrice: 12.89),
];
