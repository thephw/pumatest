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

# Expected Output (daemonize false)
```
=== puma startup: 2015-08-07 00:20:55 -0400 ===
[14493] * Starting control server on unix:///Users/patrickwiseman/src/pumatest/tmp/melody_control.sock
[14493] - Worker 0 (pid: 14514) booted, phase: 0
[14493] - Worker 1 (pid: 14515) booted, phase: 0
[14493] - Worker 2 (pid: 14516) booted, phase: 0
[14493] - Worker 3 (pid: 14517) booted, phase: 0
[14493] PumaWorkerKiller: Consuming 339.203125 mb with master and 4 workers
[14493] PumaWorkerKiller: Consuming 339.2734375 mb with master and 4 workers
```

# Actual Output (daemonize true)
```
=== puma startup: 2015-08-07 00:23:01 -0400 ===
[14647] * Starting control server on unix:///Users/patrickwiseman/src/pumatest/tmp/melody_control.sock
[14647] - Worker 0 (pid: 14648) booted, phase: 0
[14647] - Worker 1 (pid: 14649) booted, phase: 0
[14647] - Worker 3 (pid: 14651) booted, phase: 0
[14647] - Worker 2 (pid: 14650) booted, phase: 0
```

# Other Resources
Log statement is generated from:

https://github.com/schneems/puma_worker_killer/blob/master/lib/puma_worker_killer/reaper.rb

where @cluster.master is an instance of Puma::Cluster