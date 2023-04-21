after_success:
  - docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
  - docker build -f Dockerfile -t username/hello-world-with-travis.
  - docker tag username/hello-world-with-travis 0.1.0
  - docker push username/hello-world-with-travis
