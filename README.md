# Wimp

Ruby bindings for WiMP. The library uses WiMPs internal RPC API.
Take a look at the [FAQ](#faq) for frequently asked questions. 

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

#### Add tracks using tracks

``` ruby
status = playlist.add_tracks(tracks, {
  start_position: 1
})
```

#### Add tracks using track ids

``` ruby
status = playlist.add_tracks_by_id(track_ids, {
  start_position: 1
})
```

#### Create playlist

``` ruby
playlist = WiMP::Playlist.create(title)
```

#### Remove tracks

``` ruby
status = playlist.remove_tracks_by_indices(tracks)
```

#### Find playlist

``` ruby
playlist = WiMP::Playlist.find(uuid)
```

## FAQ

### Can I port this library to language X?

Yes. WiMP uses [thrift](http://thrift.apache.org/) behind the scene, 
which means that code to over 7 languages can be generated.

Take a look in the `resources` folder for more information.

### Can I stream music?

The WiMP API has support for streaming, but this library doesn't.

### Where are the rest of the inplementation?

Take a look in at the `lib/gen` folder for more, undocumented code.

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