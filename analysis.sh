dart run dart_code_metrics:metrics bin --reporter=html
dart test --coverage="coverage"
dart run coverage:format_coverage --lcov --in=coverage --out=./coverage/lcov.info --packages=.packages --report-on=bin
sonar-scanner -Dsonar.login="$argv[1]" -Dsonar.password="$argv[2]"