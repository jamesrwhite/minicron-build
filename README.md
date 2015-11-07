# minicron build

Rough instructons on how to build [minicron](https://github.com/jamesrwhite/minicron).

## Requirements

- Ruby 2.2.1 on OSX/Linux

## Instructions

- Clone this repo and [minicron](https://github.com/jamesrwhite/minicron) locally.

- Install core dependencies
```
gem install bundler geminabox
```

- Start the geminabox server
```
cd minicron-build
rackup gem-server/config.ru
```

- Build and install the minicron gem
```
cd minicron
bundle
gem build minicron.gemspec
```

- Push the minicron gem to the local gem server
```
gem push minicron-*VERSION*.gem --host http://127.0.0.1:9999
```

**TODO:** finish the rest of this..
