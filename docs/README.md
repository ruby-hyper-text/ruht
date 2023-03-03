# Documentation

Ruht is an HTML generator. It allows you to write regular code
in Ruby and get HTML. Ruby code follows the structure of HTML.
In this code you can use regular conditions, method calls,
loops and so on.


## General usage

```ruby
require 'ruht'

Ruht.html do # <= the same as `Ruht::Document.new { ... }.to_s`
  doctype :html
  html lang: :en do
    head do
      meta charset: 'UTF-8'
      meta 'http-equiv': 'X-UA-Compatible', content: 'IE=egde'
      meta name: 'viewport', content: 'width=device-width, initial-scale=1.0'
      title { 'ruht usage example' }
    end

    body do
    end
  end
end
```

## False positive trigger on `p` of Rubocop >= 1.45

### Disable the rule copmletely

First solution is to disable `p` detection in `.rubocop.yml`:

```yaml
Lint/Debugger:
  DebuggerMethods:
    Kernel:
      p: ~
```

It will cause rubocop ignoring all `p` calls for debugging(including Kernel#p).

### Disable the rule for one line

Another solution is to disable rubocop locally.

```ruby
Ruht.html do
  html do
    p do # rubocop:disable Lint/Debugger
      'text'
    end
  end
end
```

This way you'll have to add this comment every time you use `p` tag.

### Use `paragraph` method

We added a `paragraph` method to avoid triggering Rubocop. It is an alias
for `p` so behaves totally the same.

```ruby
Ruht.html do
  html do
    paragraph do
      'text'
    end
  end
end
```
