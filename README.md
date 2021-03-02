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



### Refs

- https://docs.sonarqube.org/latest/analysis/languages/scala/
- https://sonar-scala.com/docs/setup/getting-started/
- https://github.com/mwz/sonar-scala/releases
