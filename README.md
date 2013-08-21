# MusicbrainzCli

A command line interface to the ["Musicbrainz database"]("http://musicbrainz.org/doc/MusicBrainz_Database")

## Installation

    $ gem install musicbrainz_cli

And then execute:

    $ musicbrainz-cli

## Usage

This gem uses the ["ActiveMusicbrainz"]("https://github.com/pilu/active_musicbrainz"), so you can use its model like the following:

    artist = Artist.by_gid '9a709693-b4f8-4da9-8cc1-038c911a61be'
     => #<ActiveMusicbrainz::Model::Artist id: 24146, gid: "9a709693-b4f8-4da9-8cc1-038c911a61be", name: 143497, sort_name: 143497, begin_date_year: 1976, begin_date_month: 3, begin_date_day: 30, end_date_year: nil, end_date_month: nil, end_date_day: nil, type: 1, area: 221, gender: 1, comment: "UK electro artist Simon Green", edits_pending: 0, last_updated: "2013-05-13 11:00:09", ended: false, begin_area: nil, end_area: nil>

    artist.name
     => "Bonobo"

    artist.release_groups.first.type
     => #<ActiveMusicbrainz::Model::ReleaseGroupPrimaryType id: 1, name: "Album">

    artist.release_groups.each{|r| puts r.name }
      Black Sands
      Dial 'M' for Monkey
      Scuba EP
      Flutter
      Pick Up
      Terrapin
      Eyesdown
      ...

    artist.release_groups.first.releases.first.mediums
     => [#<ActiveMusicbrainz::Model::Medium id: 654199, release: 654199, position: 1, format: 1, name: nil, edits_pending: 0, last_updated: "2012-01-15 13:46:18", track_count: 12>]

    artist.release_groups.first.releases.first.mediums.first.tracks.each{|t| puts t.name}
      Prelude
      Kiara
      Kong
      Eyesdown
      ...

    artist.release_groups.first.releases.first.mediums.first.format
     => #<ActiveMusicbrainz::Model::MediumFormat id: 1, name: "CD", parent: nil, child_order: 0, year: 1982, has_discids: true>

## Author

Andrea Franz - [http://gravityblast.com](http://gravityblast.com)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
