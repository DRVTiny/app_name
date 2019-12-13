# app_name

AppName is a class to get or guess application name.
It may be usable, for example, in OptionParser or Logger instances
properties.

AppName tries to provide best result in all situations, but it may be
mistaken. Feel free to create an issue is this is your case.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     app_name:
       github: DRVTiny/app_name
   ```

2. Run `shards install`

## Usage

```crystal
require "app_name"

my_app = AppName.new
puts app.name
# or simply so:
puts AppName.exec_name
# you may also set application name yourself:
app.name = "Rogneda"
puts app.name

# AppName instance will be stringified to <<app [process_id]>>
puts app
# will be printed something like this: 
# Rogneda [1234]

```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/DRVTiny/app_name/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Andrey A. Konovalov](https://github.com/your-github-user) - creator and maintainer
