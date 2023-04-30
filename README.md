# Ansible Docker

![Docker Hub](https://img.shields.io/docker/pulls/josuablejeru/ansible-docker?style=for-the-badge) ![GitHub License](https://img.shields.io/github/license/josuablejeru/ansible-docker?style=for-the-badge)

*"All the ansible tools inside one container image."*

Pull the latest image from Github or Docker Hub
```bash
$ docker pull ghcr.io/josuablejeru/ansible-docker:0.1.0
```
```bash
$ docker pull josuablejeru/ansible-docker:0.1.0
```


## Gitlab
This Image was created with Gitlab and other CI/CD systems in mind.
The following is a example for Gitlab:

```yaml
default:
  image: 
    name: josuablejeru/ansible-docker:latest
    entrypoint: [""]

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

