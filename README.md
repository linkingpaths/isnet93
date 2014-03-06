# ISNET93

![](https://upload.wikimedia.org/wikipedia/commons/3/36/Isnet93.png)

In 1993 some few Icelandic institutions in collaboration with IfAG and IfE in Germany measured a new geodetic reference system in Iceland with GPS technology. This survey campaign was named ISNET93 and the criterion was named ISN93. It's the basis for all geosurveys in Iceland and therefore the base for digital cartography, geographical information systems and construction projects. You can learn more about reasons for its creation [here](http://geoforum.no/lokalavdelinger/sognOgFjordane/filer/foredrag-fra-lokale-plan-og-kartdagar-2011/geodtic-problems-in-iceland/at_download/file).

Because of Iceland’s position on the North Atlantic ridge it’s difficult to maintain accurate surveying network for Iceland. The country drifts about 1 cm apart in each direction annually and also earthquakes and volcanic eruptions can cause local distortion on the geodetic reference system. In order to maintain the accuracy of the geodetic reference system, the [NLSI](http://www.lmi.is/en/) regularly re-measure the system.

This ruby gem manages **conversion of coordinates between ISNET93 and WGS84**, the standard geodetic system used internationally in cartography, geodesy, and navigation.

http://venus.lmi.is/cocodati/cocodati-manual.pdf


## Installation

Add this line to your application's Gemfile:

    gem 'isnet93'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install isnet93

## Usage

```ruby
$ irb
> require "isnet93"
true
> Isnet93.to_wgs84(387994, 477755)
[64.78173836, -21.35577008]
```

## Contributing

1. Fork it ( http://github.com/linkingpaths/isnet93/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## Kudos

This library was extracted from the work made by [Linking Paths](http://www.linkingpaths.com) during the first hackathon organized by [Open Knowledge Foundation Iceland](https://www.facebook.com/OKFNis). Documentation on the actual calculations for this conversion was researched via [Cocodati project documentation](http://venus.lmi.is/cocodati/cocodati-manual.pdf) and previous work on the python library [fasteignamat-functions](https://github.com/pallih/fasteignamat-functions), containing original work from [Smári](https://github.com/smari) and [Brian](https://github.com/briansuda), was checked as reference.
