# HeyJony

Welcome to jony bot cli.

## Installation
    % cp .env.sample .env
    % bundle install --path vendor/bundle

## Path
    $ brew info openssl (compilers to find openssl you may need to set path.)
    
    # LDFLAGS
    % bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib"
    
    # CPPFLAGS
    % bundle config --local build.mysql2 "--with-cppflags=-I/usr/local/opt/openssl/include"

## Usage
    % bundle exec ruby bin/console

![image](https://i.gyazo.com/7dae971f645b8e1285d81869c822646c.png)

## Test
    % bundle exec rake test

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
