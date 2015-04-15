# Which Mag Test

Write a program that searches for 'which university' on google then clicks on
the first link.

# Usage

```shell
./bin/search_and_click
```

# Specs
```shell
bundle exec rspec spec
```

# Notes
Ain't no party like wrapping 3rd party,
And yes named params everywhere, its a style thing for me
Only travelled the happy path for this test (server responses etc)

The web interactor is wrapped,
can be replaced with another interactor if it adheres to the same API.

One could take abstractions further aka result/page objects that
could be wrappers for any interactor result, but if the page talks search
with a css selector we can still rock and roll.

Enjoy
