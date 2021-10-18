KAFKA_VERSION=2.8.0
TRAVIS_SCALA_VERSION=2.13
docker build --build-arg kafka_version=$KAFKA_VERSION --build-arg scala_version=$TRAVIS_SCALA_VERSION --build-arg vcs_ref=$TRAVIS_COMMIT --build-arg build_date=$(date -u +"%Y-%m-%dT%H:%M:%SZ") -t levels/kafka .