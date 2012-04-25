This application is a site that I wrote for my own personal amusement.
The idea is to collect funny, interesting, or purely outrageous snippets of code for the world to see.
Inspired by the WAT Lightening Talk, and developed in CoffeeScript that runs inside Node.js.

## Getting Started

This app was built on Express running on Node.js 0.6. If you don't already have Node up and running
you should check it out [here](http://nodejs.org)

Additionally, stylesheets are compiled using Compass and Twitter's Bootstrap template - so you'll be
required to install the requisite rubygems for the stylesheets to complile. With Ruby and RubyGems
set up I believe these two commands should get you squared away with compass:

```
$ gem install compass
$ gem install compass_twitter_bootstrap
```

After compass is installed, npm should be able to do the rest. Just cd into the directory where you
cloned this project to, and run:

```
$ npm install -d
```

NPM should be able to effectively detect and install all the dependencies without a fuss.
After that, you should be able to run the project in development mode by invoking jake which will
start Express, the Compass watcher, and the CoffeeScript watcher (for the frontend JavaScript).

```
$ jake
Express server listening in development mode
>>> Compass is watching for changes. Press Ctrl-C to Stop.
```

At this point, you should be able to point your browser at http://localhost:3000 to see a version
of the application alive and kicking.

## About Me

My name is Matt Farmer. I'm a Software Engineer at [OpenStudy](http://openstudy.com) where we're working to make the world
one big study group by providing high-quality peer-to-peer tutoring. I write about the technology industry, programming,
and anything else that catches my fancy at my blog, [Farmdawg Nation](http://farmdawgnation.com).

## License

This project is licensed under the Apache License 2.0. You can review the content of that license [here](http://www.apache.org/licenses/LICENSE-2.0.html).
