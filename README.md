This application is a site that I wrote for my own personal amusement.
The idea is to collect funny, interesting, or purely outrageous snippets of code for the world to see.
Inspired by the WAT Lightening Talk, and developed in Node.js, my hope is that the submissions to this
app will be amusing and what you learn from peeking at the code will be enlightening.

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

After that, you should be able to run the project in development mode by invoking jake.

```
$ jake
Express server listening on port 3000 in development mode
>>> Compass is watching for changes. Press Ctrl-C to Stop.
```

## About Me

My name is Matt Farmer. I'm a Software Engineer at [OpenStudy](http://openstudy.com) where we're working to make the world
one big study group by providing high-quality peer-to-peer tutoring. I write about the technology industry, programming,
and anything else that catches my fancy at my blog, [Farmdawg Nation](http://farmdawgnation.com).
