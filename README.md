# docker-zeoserver

Zeoserver docker container for SAPL 2.5

## Docker-compose Example

Save the following snippet as docker-compose.yaml in any folder you like.

```
zeoserver:
  image: interlegis/zeoserver:2.9.12
  volumes:
    - zeodata:/opt/zope/instances/zeo/var
  ports:
    - 8100:8100
```

