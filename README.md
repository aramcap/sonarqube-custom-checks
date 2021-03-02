# SonarQube custom checks

## Requirements

SonarQube instance run. This script launchs a SonarQube and PostgreSQL instances in Podman, and config the system with `sysctl` if needed:
```
$ bash docker-run.sh
```

If you runs this with Docker-Desktop, you can launch `docker-compose`:
```
$ docker-compose up -d
```

## Python

In Python folder, we can see:
```
├── codetest/
│   └── main.py
└── python-custom-rules/
    ├── pom.xml
    └── src/
```

- `codetest/` contains a Python test code.
- `python-custom-rules/` contains a SonarQube plugins code. It's includes Maven.

### Compile

```
$ cd python/python-custom-rules
$ mvn install
```

### Test

```
$ podman cp target/python-custom-rules-plugin-1.0-SNAPSHOT.jar sonarqube_sonarqube_1:/opt/sonarqube/extensions/plugins/
$ cd ../..
$ podman-compose restart sonarqube

# we can check the plugin load
$ podman-compose logs -f sonarqube
```

SonarQube loads by default 167 rules. With this custom plugin, we have 169 rules.

### Refs

- https://docs.sonarqube.org/latest/analysis/languages/python/
- https://github.com/SonarSource/sonar-custom-rules-examples/tree/master/python-custom-rules


## Scala

[Sonar-Scala](https://sonar-scala.com) includes more than 200 rules. For install:

First, disable the default Scala plugin, then copy the new jar library and restart:
```
$ podman cp sonarqube_sonarqube_1:/opt/sonarqube/lib/extensions/sonar-scala-plugin-1.8.2.1946.jar .
$ podman exec sonarqube_sonarqube_1 rm -f /opt/sonarqube/lib/extensions/sonar-scala-plugin-1.8.2.1946.jar
$ podman cp sonar-scala_2.13-8.6.0-assembly.jar sonarqube_sonarqube_1:/opt/sonarqube/extensions/plugins/
$ podman-compose restart sonarqube

# we can check the plugin load
$ podman-compose logs -f sonarqube
```

### Refs

- https://docs.sonarqube.org/latest/analysis/languages/scala/
- https://github.com/mwz/sonar-scala/releases


## JSON



### Refs

- https://github.com/racodond/sonar-json-plugin
- https://github.com/racodond/sonar-json-custom-rules-plugin

