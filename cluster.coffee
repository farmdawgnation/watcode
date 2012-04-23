###
# Manage the creation and oversight of a cluster of Express
# applications. This is really only needed in production. In
# development a single instance of the app should do fine.
###
cluster = require 'cluster'
numExpressWorkers = process.env.NUM_EXPRESS_WORKERS || require('os').cpus().length;

workerRestartCallback = (worker) ->
  console.error "Worker " + worker.pid + " died. Forking a new worker."
  worker = cluster.fork()
  worker.on('death', workerRestartCallback)

if (cluster.isMaster)
  # Fork off the child processes.
  i = 0
  while i < numExpressWorkers
    worker = cluster.fork()
    console.log "Worker " + worker.pid + " spawned."
    worker.on('death', workerRestartCallback)

    i++
else
  # Spin up this child process's copy of the app.
  require "./app"
