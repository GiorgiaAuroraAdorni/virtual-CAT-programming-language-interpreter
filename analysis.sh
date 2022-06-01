rm -rf ./coverage
rm -rf ./metrics
dart run dart_code_metrics:metrics lib --reporter=html
dart pub global run coverage:test_with_coverage --branch-coverage
genhtml -o coverage coverage/lcov.info
sonar-scanner -Dsonar.login="$argv[1]" -Dsonar.password="$argv[2]"