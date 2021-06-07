#!/bin/sh
# based on https://gist.github.com/salman-abedin/6f52c52e465d89d489f9ea8d891c7332
# Launches files based on their mimetypes
# Usage: launch [FILE...]
# Dependencies: file

case $(file --mime-type "$@" -bL) in
   video/* | audio/* | image/gif)
      # Launch using your favorite application
      devour vlc "$@"
      ;;
   image/*)
      devour gwenview "$@"
      ;;
   *) exit 1 ;;
esac
