#!/bin/bash -x

bundle install --path "${HOME}/bundles/${JOB_NAME}" --deployment
RESTCLIENT_LOG="log/smokey-rest-client.log" bundle exec rake test:localnetwork
RESULT=$?
if [[ $RESULT -eq 0 ]]; then
  RESTCLIENT_LOG="log/smokey-rest-client.log" bundle exec rake test:search
  SEARCH_RESULT=$?
  if [[ $SEARCH_RESULT -ne 0 ]]; then
    wget ${JENKINS_URL}jnlpJars/jenkins-cli.jar
    java -jar jenkins-cli.jar set-build-result unstable
  fi
fi
exit $RESULT


