# WiMP

Ruby bindings for [WiMP](http://wimpmusic.com). This library uses WiMPs internal RPC API.
Take a look at the [FAQ](#faq) for frequently asked questions and how to port this library to any other language using [thrift](http://thrift.apache.org/).

## Installation

```
$ gem install wimp
```

## Usage

You must have a premium acount to be able to use this library.

``` ruby
WiMP.configure do |config|
  config.username = "email@example.com"
  config.password = "my-password"
end
```

### Track

#### Search

``` ruby
tracks = WiMP::Track.search(query, {
  limit: 10
})
```

### Playlist

Note that you can only read and update your own playlists, 
not someone else's.

#### Find a playlist

``` ruby
playlist = WiMP::Playlist.find(uuid)
```

#### Create a playlist

``` ruby
playlist = WiMP::Playlist.create(title)
```

#### Add tracks to playlist

``` ruby
status = playlist.add_tracks(tracks, {
  start_position: 1
})
```

#### Add tracks to playlist using Track#id

``` ruby
status = playlist.add_tracks_by_id(track_ids, {
  start_position: 1
})
```

#### Remove tracks from playlist

``` ruby
status = playlist.remove_tracks_by_indices(tracks)
```

## Containers

### Track

- (*required*) **String** artist
- (*required*) **Integer** artist_id
- (*required*) **Integer** album_id
- (*required*) **Integer** duration
- (*required*) **Integer** id
- (*required*) **Integer** popularity

### Playlist

- (*required*) **Integer** count
- (*required*) **String** url
- (*optional*) **Array<Track>** tracks
- (*required*) **String** uuid
- (*required*) **Integer** id

## FAQ

### Can I port this library to language X?

Probably. WiMP uses [thrift](http://thrift.apache.org/) behind the scene, 
which means that code for C++, C#, Erlang, Haskell, Java, Objective 
C/Cocoa, OCaml, Perl, PHP, Python, and Squeak can be generated. Take a look 
at the `resources/thrift` folder and the `Rakefile` file for more 
information on how this could be done.

[Here is a good thrift tutorial](http://diwakergupta.github.io/thrift-missing-guide/) 
that explains the basics.

### Can I stream music using this library?

The WiMP API has support for streaming, but I've chosen not to include 
those methods.

### Where is the rest of the implementation?

Take a look at the `lib/gen` folder for more, undocumented code. Code
exists for all 50 some methods in the thirft directory, but only a few are
ported to a Ruby-friendly syntax and documented above. You're more than
welcome to help me migrate all these methods.

Some methods from the offical API isn't ported to thrift. You'll find a list
of these in the `resources/skipped-methods.md` file.

### I'm get an `Thrift::ApplicationException` error

The `Thrift::ApplicationException` error indicates that the returning data
from WiMP isn't what we think it is. It's usually caused by invalid data being passed
to thrift. 

In other words; check the data being passed from this library. Is it correct?

## Notes

1. Not all methods existing in the offical API are documented above, but 
the code for all of them exists. Navigate the `lib` folder for more information.
2. The first request to the API will be slower than the rest.
That's because a session is created.
3. None of the credentials in this project are my own. They're 
only created to be used in the specs. They might therefore already 
be expired when you read this.
4. This library has been created for educational purposes. You shouldn't
use it without first consulting WiMP.

## Contributing

1. Fork it ( http://github.com/oleander/wimp-api-rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request