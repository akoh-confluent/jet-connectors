FROM confluentinc/cp-server-connect-operator:6.1.3.0
USER root
RUN confluent-hub install --no-prompt confluentinc/connect-transforms:latest
RUN mkdir -p /usr/share/confluent-hub-components/confluentinc-kafka-connect-aws-dynamodb-1.3.0-SNAPSHOT && mkdir -p /usr/share/confluent-hub-components/confluentinc-kafka-connect-kinesis-1.4.0-SNAPSHOT
COPY ./target/confluentinc-kafka-connect-kinesis-1.4.0-SNAPSHOT /usr/share/confluent-hub-components/confluentinc-kafka-connect-kinesis-1.4.0-SNAPSHOT
COPY ./target/confluentinc-kafka-connect-aws-dynamodb-1.3.0-SNAPSHOT /usr/share/confluent-hub-components/confluentinc-kafka-connect-aws-dynamodb-1.3.0-SNAPSHOT
COPY ./target/logback/java /usr/share/java/logback
COPY ./target/logback/configs /usr/share/configs
USER appuser
