# app-name

App::Name is a class to get or guess application name.
It may be usable, for example, in OptionParser or Logger instances
properties.

App::Name tries to provide best result in all situations, but it may be
mistaken. Feel free to create an issue is this is your case.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     app-name:
       github: DRVTiny/app-name
   ```

2. Run `shards install`

## Usage

```crystal
require "app-name"

my_app = App::Name.new
puts app.name
# or simply so:
puts App::Name.exec_name
# you may also set application name yourself:
app.name = "Rogneda"
puts app.name

# App::Name instance will be stringified to <<app [process_id]>>
puts app
# will be printed something like this: 
# Rogneda [1234]

```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/DRVTiny/app-name/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Andrey A. Konovalov](https://github.com/your-github-user) - creator and maintainer
