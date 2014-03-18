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
status = playlist.add_track_ids(track_ids, {
  start_position: 1
})
```

#### Create playlist

``` ruby
playlist = WiMP::Playlist.create(title)
```

#### Remove tracks

``` ruby
status = playlist.remove_tracks(tracks)
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
- (*required*) **String** album
- (*optional*) **String** copyright
- (*optional*) **String** small_album_cover
- (*optional*) **String** medium_album_cover
- (*optional*) **String** large_album_cover
- (*optional*) **String** content_access_string
- (*optional*) **String** version
- (*optional*) **String** currency_code
- (*optional*) **String** price_code
- (*required*) **String** album_calculated_type
- (*required*) **String** preview_url
- (*optional*) **String** customizable_album_cover
- (*required*) **String** revised_copyright
- (*required*) **Integer** artist_id
- (*required*) **Integer** album_id
- (*required*) **Integer** duration
- (*required*) **Integer** id
- (*required*) **Integer** volume_number
- (*required*) **Integer** track_number
- (*required*) **Integer** album_nr_of_volumes
- (*required*) **Integer** popularity
- (*required*) **Integer** popularity_this_week
- (*required*) **Float** search_score
- (*required*) **Float** price
- (*required*) **Date** sales_started_at
- (*required*) **Date** stream_started_at
- (*required*) **Boolean** sales_ready?
- (*required*) **Boolean** stream_ready?
- (*required*) **Boolean** album_only?
- (*required*) **Boolean** album_broken?
- (*required*) **Boolean** allow_streaming?
- (*required*) **Boolean** premium_only_streaming?
- (*required*) **Integer** popularity_level
- (*required*) **Integer** sales_price_rule_id
- (*required*) **RecordLabel** record_label

### Playlist

struct Playlist {
  1: required i32 count;
  2: required i32 createdByArtistId;
  3: required i32 duration;
  4: optional string imgPath;
  5: required i64 lastUpdated;
  6: required string playlistName;
  7: required i32 profileId;
  8: required i64 registeredDate;
  9: optional list<Track> tracks;
  10: required string uuid;
  11: optional i32 type;
  12: optional string desc;
  13: required i32 id;
  14: optional string createdByNickName;
}


## Notes

1. Not all methods below are implemented as below but 
  the code for all of them exists. Navigate the `lib` folder for more 
  information.

2. The first request to the API will be a bit slower than the rest.
  That's because at the first request a session is created. The sesson isn't store
  on your local computer, but is instead kept in memory during execution.

3. None of the credentials in this project are my own. They're 
  only created to be used in the specs.

## Contributing

1. Fork it ( http://github.com/<my-github-username>/wimp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request