# WiMP

Ruby bindings for [WiMP](http://wimpmusic.com). This library uses WiMPs internal RPC API.
Take a look at the [FAQ](#faq) for frequently asked questions and how to port this library to any other language using [thrift](http://thrift.apache.org/).

## Installation

```
$ gem install wimp
```

## Usage

Your WiMP username and password. You must have a premium 
acount to be able to use this library.

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

## FAQ

### Can I port this library to language X?

Yes. WiMP uses [thrift](http://thrift.apache.org/) behind the scene, 
which means that code to over 7 languages can be generated.

Take a look in the `resources/thrift` folder and the `Rakefile` 
file for more information on how this could be done.

[Here is a good thift tutorial](http://diwakergupta.github.io/thrift-missing-guide/) 
that explains the basics.

### Can I stream music using this library?

The WiMP API has support for streaming, but I've chosen not to document 
those methods with respect to the WiMP.

### Where are the rest of the implementation?

Take a look at the `lib/gen` folder for more, undocumented code. Code
exists for all 50 some methods in the thift directory, but only a few are
ported to a Ruby-friendly syntax and documented above. You're more than
welcome to help me migrate all these methods.

Some methods from the offical API isn't ported to thrift. You'll find a list
of these in the `resources/skiped-methods.md` file.

### I'm get an `Thrift::ApplicationException` error when running method X

The `Thrift::ApplicationException` error indicates that the returning data
from WiMP isn't what we think it is. It's usually caused by invalid data being passed
to thrift. 

In other words; check the data being passed from this library. Is it correct?

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


## Notes

1. Not all methods existing in the offical API are documented above, but 
the code for all of them exists. Navigate the `lib` folder for more information.

2. The first request to the API will be slower than the rest.
That's because a session is created.

3. None of the credentials in this project are my own. They're 
only created to be used in the specs. They might therefore already be exired
and when you read this.

## Contributing

1. Fork it ( http://github.com/oleander/wimp-api-rb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request