# ActiveRecordPrettyKey

A Ruby gem for generating and managing pretty, human-readable keys in ActiveRecord models.

## Why Pretty Keys?

| Feature | Regular Primary Keys | UUIDs | Pretty Keys |
|---------|---------------------|-------|-------------|
| **Human Readable** | ❌ Sequential numbers (1, 2, 3...) | ❌ Long, random strings | ✅ Short, memorable strings |
| **URL Friendly** | ✅ Simple and clean | ❌ Long and unwieldy | ✅ Short and clean |
| **Security** | ❌ Predictable, easily guessable | ✅ Random and secure | ✅ Random but readable |
| **Database Performance** | ✅ Excellent (auto-increment) | ❌ Poor (random insertion) | ✅ Good (indexed strings) |
| **User Experience** | ❌ Confusing for users | ❌ Hard to share/remember | ✅ Easy to share and remember |
| **SEO Friendly** | ❌ No meaningful content | ❌ No meaningful content | ✅ Can include meaningful prefixes |
| **Length** | ✅ Very short | ❌ Very long (36 chars) | ✅ Short (8-12 chars) |
| **Collision Risk** | ✅ None (auto-increment) | ✅ Extremely low | ✅ Very low (configurable) |

Pretty keys give you the best of both worlds: human-readable identifiers that are secure, performant, and user-friendly.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active-record-pretty-key'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install active-record-pretty-key
```

## Usage

Include the concern in your ActiveRecord model:

```ruby
class Post < ApplicationRecord
  include ActiveRecordPrettyKey::Concern

  has_pretty_key
end
```

### Configuration Options

You can customize the pretty key generation:

```ruby
class Post < ApplicationRecord
  include ActiveRecordPrettyKey::Concern

  has_pretty_key(
    field: :pretty_key,
    prefix: 'post',
    length: 8,
    unique: true,
    alphabet: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
  )
end
```

### Generating Keys

```ruby
post = Post.new(title: "My Awesome Post")
post.generate_pretty_key
# => "post-a1b2c3d4"

post.save!
```

The gem automatically generates pretty keys using the [Sqids](https://github.com/sqids/sqids-ruby) library, which creates short, unique, URL-safe identifiers. Keys are generated automatically before saving records, ensuring uniqueness and consistency.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yourusername/active-record-pretty-key. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/yourusername/active-record-pretty-key/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveRecordPrettyKey project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/yourusername/active-record-pretty-key/blob/main/CODE_OF_CONDUCT.md).
