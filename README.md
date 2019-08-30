# Phonetics

Phonetic matching (sounds-like) matching can be done with the SoundEx or Metaphone algorithms

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     cadmium_phonetics:
       github: cadmiumcr/phonetics
   ```

2. Run `shards install`

## Usage

```crystal
require "cadmium_phonetics"
```

```crystal
sound_ex = Cadmium.sound_ex
metaphone = Cadmium.metaphone

sound_ex.process("phonetics")
# => "P532"

sound_ex.tokenize_and_phoneticize("Ruby aint got nothing on Crystal")
# => ["R100", "A530", "G300", "C234"]

# Keep word stops
sound_ex.tokenize_and_phoneticize("Ruby aint got nothing on Crystal", true)
# => ["R100", "A530", "G300", "N352", "O000", "C234"]

sound_ex.compare("phonetix", "phonetics")
# => true

metaphone.process("phonetics")
# => "FNTKS"

metaphone.tokenize_and_phoneticize("Ruby aint got nothing on Crystal")
# => ["RB", "ANT", "KT", "KRSTL"]

# Keep word stops
metaphone.tokenize_and_phoneticize("Ruby aint got nothing on Crystal", true)
# => ["RB", "ANT", "KT", "N0NK", "ON", "KRSTL"]

metaphone.compare("phonetix", "phonetics")
# => true
```

Both classes can also be used with attached String methods. The default class for String methods is `Metaphone`. The attached methods are `phonetics`, `sounds_like`, and `tokenize_and_phoneticize`.

```crystal
"Crystal".phonetics
# => "KRSTL"

"Crystal".sounds_like("Krystal")
# => true

"Crystal".phonetics(nil, Cadmium::SoundEx)
# => "C234"

# Using a max length
"Constitution".phonetics(6, Cadmium::SoundEx)
# => "C52333"
```

## Contributing

1. Fork it (<https://github.com/cadmiumcr/phonetics/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Chris Watson](https://github.com/watzon) - creator and maintainer
