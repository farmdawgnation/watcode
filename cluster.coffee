###
Copyright 2012 Matt Farmer

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Manage the creation and oversight of a cluster of Express
applications. This is really only needed in production. In
development a single instance of the app should do fine.
###
cluster = require 'cluster'
numExpressWorkers = process.env.NUM_EXPRESS_WORKERS || require('os').cpus().length;

workerRestartCallback = (worker) ->
  console.error "Worker " + worker.pid + " died. Forking a new worker."
  worker = cluster.fork()
  worker.on('death', workerRestartCallback)

if (cluster.isMaster)
  # Wire up death handler
  cluster.on('death', workerRestartCallback)

  # Fork off the child processes.
  i = 0
  while i < numExpressWorkers
    worker = cluster.fork()
    console.log "Worker " + worker.pid + " spawned."

    i++
else
  # Spin up this child process's copy of the app.
  require "./app"
