# Jake Buildfile - Legends of WAT
# (c) 2012 Matt Farmer

##
# Compass Tasks
##
namespace "compass", () ->
  desc "Starts the compass watcher."
  task "watch", [], (task) ->
    jake.exec ["compass watch"], () ->
      console.error "[JAKE] Compass has terminated."
      complete
    , {stdout: true, stderr: true, async: true}
  
  desc "Compiles sass files into CSS."
  task "compile", [], (task) ->
    jake.exec ["compass compile -f"], () ->
      complete
    , {stdout: true, stderr: true}
  
  desc "Compile sass file into compressed CSS."
  task "compress", [], (task) ->
    jake.exec ["compass compile -f -e production"], () ->
      complete
    , {stdout: true, stderr: true}
  
  desc "Clean out compiled CSS files."
  task "clean", [], (task) ->
    jake.exec ["compass clean"], () ->
      complete
    , {stdout: true, stderr: true}

##
# Misc Tasks
##
desc "Starts express in development mode."
task "express", [], (task) ->
  jake.exec ["coffee ./app.coffee"], () ->
    console.error "[JAKE] Express has terminated..."
    complete
  , {stdout: true, stderr: true, async: true}

##
# Package
##
version = "0.1-SNAPSHOT"
package_task = new jake.PackageTask "legendsofwat", version, () ->
  fileList = ["model/*", "public/*", "routes/*", "sass/*", "views/*", "app.js", "config.rb", "jakefile.coffee", "package.json"]

  this.packageFiles.include fileList
  this.needTarGz = true

##
# El defaultivo.
##
desc "Starts up the development environment."
task "default", [], (task) ->
  expressrunner = jake.Task["express"]
  expressrunner.invoke()

  compasswatcher = jake.Task["compass:watch"]
  compasswatcher.invoke()
