#!/bin/bash
set -e

DIR="/opt/minicron"

# Override the directory location if required
if [ "test" != "test$OVERRIDE_DIR" ]; then
    DIR=$OVERRIDE_DIR
fi

# Tell Bundler where the Gemfile and gems are.
export BUNDLE_GEMFILE="$DIR/lib/vendor/Gemfile"
unset BUNDLE_IGNORE_CONFIG

# Run the actual app using the bundled Ruby interpreter, with Bundler activated.
exec "PACKAGED=1 $DIR/lib/ruby/bin/ruby" -rbundler/setup $DIR/lib/vendor/ruby/2.2.0/bin/minicron "$@"
