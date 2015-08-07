# Issue

The option for stdout_redirect does not seem to work for all logging when daemonize is true.  This can be seen by commenting or uncommenting the `daemonize true` in `config/puma.rb` and then running the server and tailing the log.

Terminal 1
```
$ bundle exec puma
```

Terminal 2
```
$ tail -f log/puma.log
```