# About

This app is a mashup of Twitter, Twitpic and yFrog, written for the Ruby Midwest 2011 Hackfest.

# App Usage:

## Run:

    http://schlurp.herokuapp.com

## Install:

    git clone https://bratta@github.com/bratta/schlurp.git
    cd schlurp
    gem install bundler rails
    bundle
    rake db:migrate
    cp config/yfrog.yml.example config/yfrog.yml
    # EDIT config/yfrog.yml and add your API key
    rails s

Then in your browser, go to:

    http://localhost:3000/

and enter a twitter handle, or alternatively, go directly to:

    http://localhost:3000/profile?t=TWITTER_HANDLE


# LICENSE

The MIT License

Copyright (c) 2011 Tim Gourley

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
