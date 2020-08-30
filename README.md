# SmartPension-ruby_app

## Brief:
Write a script that receives a log file as an argument and returns the following:
- A list of webpages with total page views ordered most to least.
- A list of webpages with unique page views also ordered most to least.

## Approach:
I made sure that all my code was test driven, and followed key OOP principles; attempting to keep the code DRY where possible.
I decided to split what I perceived as the main responsibilities into seperate classes. These responsibilities were:
- Aggregation/counting of logs... responsible for reading the file lines and making checks on the data, aggregating it into something more usable.
- Ordering... the sole responsibility here was to take log counts and order them by magnitude.
- Printing... responsible for looping over manipulated data and printing it in a more human readable format.

I decided to use class methods where the object had no need to hold state, meaning classes did not need to be instantiated.
I felt that the bulk of latency issues would come from the LogCounter, so I tried to reduce the usage of local memory as much as I could; I imagine there are better ways of doing this which i'd be interested to learn.
I decided that the script should return more human readable messages when encountering file errors, although this started to make the parser call method quite long.

## What I would like to improve:
- As it stands, the classes are fairly tightly coupled and couldn't really function outside of the scope of this project. In an ideal world, they would be more dynamic and not so reliant on specific data structures.
- I would have liked to have handled the case in which a file was passed to the script with the wrong filename extension.
- I would like to handle the case where a count is 1, and then use the singular 'view' rather than 'views'.
- I would like to dig deeper into how I could make the aggregation more efficient / faster.
- The aggregation and counting of logs could be in seperate classes.
- The file error handling could be the responsibility of a seperate class.

## Usage:

To run the test suite and linter:
```
$ bundle install
$ bundle exec rspec
$ bundle exec rubocop
```

To run the script from inside the directory:
```
$ ruby lib/parser.rb webserver.log
```

output:
```
printing pages by magnitude of visits
=========================================
/about/2 90 visits
/contact 89 visits
/index 82 visits
/about 81 visits
/help_page/1 80 visits
/home 78 visits
=========================================
finished!
printing pages by magnitude of unique views
=========================================
/index 23 unique views
/home 23 unique views
/contact 23 unique views
/help_page/1 23 unique views
/about/2 22 unique views
/about 21 unique views
=========================================
finished!
```
