The truth of the matter is that Software Engineers
have to deal with some of the most ridiculous idiosyncrasies in the code we work with. Sometimes, your only
options are to cry or laugh. So, why not build a site where we can celebrate the weirdness that we see
from day to day?

## Getting Started

This app was built on Express running on Node.js 0.6. If you don't already have Node up and running
you should check it out [here](http://nodejs.org). You'll need to install Node.js, NPM, CoffeeScript,
[MongoDB](http://www.mongodb.org/downloads), Ruby 1.8 or greater, and RubyGems on your machine before
you can run the project.

After you have the basic scaffolding in place we can move onto the higher level stuff.

First, stylesheets are compiled using [Compass](http://compass-style.org/) and
[Twitter's Bootstrap](http://twitter.github.com/bootstrap/) - so you'll be required to install the requisite
gems for the stylesheets to compile. To get Compass simply run:

```
$ gem install compass
```

For the Twitter Bootstrap gem, you'll want to clone and build that manually. Unfortunately, there hasn't been
a release since a pretty major bug was fixed, so the working version isn't yet on RubyGems. The following
commands should square you away.

```
$ git clone https://github.com/vwall/compass-twitter-bootstrap
$ cd compass-twitter-bootstrap
$ gem build compass_twitter_bootstrap.gemspec
$ gem install compass_twitter_bootstrap-2.0.1.2.gem
```

After Compass and the Twitter Bootstrap Plugin are installed, npm should be able to do the rest. Just cd into the directory where you
cloned this project to, and run:

```
$ npm install -d
```

NPM should be able to effectively detect and install all the dependencies without a fuss.
After that, you should be able to run the project in development mode by invoking jake which will
start Express, the Compass watcher, and the CoffeeScript watcher (for the front end JavaScript).

```
$ jake
Express server listening in development mode
>>> Compass is watching for changes. Press Ctrl-C to Stop.
```

At this point, you should be able to point your browser at http://localhost:3000 to see a version
of the application alive and kicking.

## About Me

My name is Matt Farmer. I'm a Software Engineer at [OpenStudy](http://openstudy.com) where we're working to empower students to
give and receive free, high-quality peer-to-peer tutoring. I write about the technology industry, programming, and anything else
that catches my fancy on my blog, [Farmdawg Nation](http://farmdawgnation.com).

## License

This project is licensed under the Apache License 2.0. You can review the content of that license
[here](http://www.apache.org/licenses/LICENSE-2.0.html).
