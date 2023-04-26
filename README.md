# Ansible Docker

All the tools ansible tools inside a container image.

Pull the latest image from Docker Hub
```bash
$ docker push josuablejeru/ansible-docker:latest
```

Pull the latest image from Github
```bash
$ docker pull ghcr.io/josuablejeru/ansible-docker:0.1.0
```


## Gitlab
This Image was created with Gitlab and other CI/CD systems in mind.
The following is a example for Gitlab:

```yaml
default:
  image: josuablejeru/ansible-docker:latest

stages:
  - linting

ansible-lint:
  stage: linting
  artifacts:
    when: always
    reports:
      junit: ansible-lint.xml
  script:
    - ansible-lint -v --show-relpath -f pep8 --nocolor | ansible-lint-junit -o ansible-lint.xml
```

