# fluent-plugin-raven

[Fluentd](https://fluentd.org/) output plugin for [Sentry](https://sentry.io/welcome/).


## Installation

```
$ gem install fluent-plugin-raven
```


## Configuration

### Tag

If `tag` is specified as bufferd chunk key, it send as tag for sentry.

### config params

- `dsn` (required): DSN KEY shown at setting page
- `environment` : set environment
- `logger_level` : set log level of the sentry logger. default value is `info`
- `default_level`: set default log level for sentry. default value is `error`

### record keys

- `message`: message body for sentry as events.
- `level`: log level for sentry as events.


### Example

```aconf
<match **>
  @type        raven
  dsn          https://12345678@sentry.io/123456
  logger_level warn
  environment  development
  <buffer tag>
    @type file
    path  fluentd/log/error.*.buffer
    timekey 5m
    timekey_wait 1m
    flush_interval 1s
  </buffer>
</match>
```

## Development

```
bundle install
bundle exec fluentd -c example/fluentd.conf
```

## Copyright

* Copyright(c) 2019- Yuto Suzuki
* License
  * Apache License, Version 2.0
