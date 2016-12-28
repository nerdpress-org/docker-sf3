
### Elasticsearch
Uses the official [Elasticsearch Alpine](https://hub.docker.com/_/elasticsearch) image.
```yml
host: elasticsearch
port: 9200
```

### Mailcatcher SMTP
[mailcatcher](https://rubygems.org/gems/mailcatcher/) helps to deal with inbound and outbound email.
```yml
host: mailcatcher
port: 1025
```

Webinterface on http://[yourhost*]:1080