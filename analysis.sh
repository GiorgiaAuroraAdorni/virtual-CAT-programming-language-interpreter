rm -rf ./coverage
rm -rf ./metrics
dart run dart_code_metrics:metrics lib --reporter=html
dart test --coverage="coverage"
dart run coverage:format_coverage --lcov --in=coverage --out=./coverage/lcov.info --packages=.packages --report-on=lib
genhtml -o coverage coverage/lcov.info
sonar-scanner -Dsonar.login="$argv[1]" -Dsonar.password="$argv[2]"