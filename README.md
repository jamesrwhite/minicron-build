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
cd ~/path/to/minicron-build
rackup gem-server/config.ru
```

- Build and install the minicron gem
```
cd ~/path/to/minicron
bundle
gem build minicron.gemspec
```

- Push the minicron gem to the local gem server
```
gem push minicron-*VERSION*.gem --host http://127.0.0.1:9999
```

- Build the minicron package(s)
```
cd ~/path/to/minicron-build/build
bundle
rake package
```
This should create 3 directories with the naming scheme `minicron-VERSION-PLATFORM`
where platform is one of `osx, linux-x86, linux-x86_64` and version is `0.8.3`. To
only package minicron for one platform you can append `:platform` to the rake task
e.g `rake package:osx`.

- Run minicron!
```
minicron-0.8.3-linux-x86_64/minicron -v
```
There should now be an executable shell script in each of the 3 directories
