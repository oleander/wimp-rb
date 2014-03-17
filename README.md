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
WiMP.configuration do |c|
  c.username = "...."
  c.password = "...."
end
```

Note 1: Not all methods below are implemented as below but 
the code for all of them exists. Navigate the lib folder for more 
information.

Note 2: The first request to the API will be a bit slower than the rest.
That's because at the first request a session is created. The sesson isn't store
on your local computer, but is instead kept in memory during execution.

### Track

#### Search

##### Ruby

``` ruby
tracks = WiMP::Track.search(query, {
  limit: 10
})
```

##### Thrift

```
SearchResult search(
  1:string term, 
  2:i32 limitArtists, 
  3:i32 limitAlbums, 
  4:i32 limitTracks, 
  5:string sessionId, 
  6:i32 limitPlaylists
)
```

#### By category id

##### Ruby

``` ruby
tracks = WiMP::Track.by_category_id(123)
```

##### Thrift

```
list<Track> getTracksByCategoryId(
  1:i32 categoryId, 
  2:i32 startIndex, 
  3:i32 limit, 
  4:string sessonId
);
```

#### By artist ids

##### Ruby

``` ruby
tracks = WiMP::Track.by_artist_ids([
  1,2,3,4
])
```

##### Thrift

```
list<Track> suggestTracksByArtistIds(
  1:list<i32> artistIds, 
  2:i32 limit, 
  3:string sessonId
);
```

#### By artist ids

##### Ruby

``` ruby
tracks = WiMP::Track.by_track_ids([
  1,2,3,4
])
```

##### Thrift

```
list<Track> suggestTracksByTrackIds(
  1:list<i32> trackIds, 
  2:i32 limit, 
  3:string sessonId
);
```

#### By artist id

##### Ruby

``` ruby
tracks = WiMP::Track.by_artist_id(123)
```

##### Thrift

```
list<Track> getTracksByAlbumId(
  1:i32 albumId, 
  2:string sessonId
);
```

#### Find by id

##### Ruby

``` ruby
track = WiMP::Track.find(10)
```

##### Thrift

```
Track getTrackById(
  1:i32 trackId, 
  2:string sessonId
);
```

#### Add tracks to favorites

##### Ruby

``` ruby
track.add_to_favorites
```

##### Thrift

```
oneway void addTrackToFavorites(
  1:i32 trackId, 
  2:string sessionId
);
```

#### Top Tracks By Artist Id

##### Ruby

``` ruby
tracks = WiMP::Track.top_by_artist_id({
  artist_id: 123,
  limit: 10,
  only_as_main_artist: true
})
```

##### Thrift

```
list<Track> getTopTracksByArtistId(
  1:i32 artistId, 
  2:i32 limit, 
  3:bool onlyAsMainArtist, 
  4:string sessonId
);
```

### Album

#### Search

##### Ruby

``` ruby
albums = WiMP::Album.search(query, {
  limit: 10
})
```

##### Thrift

```
SearchResult search(
  1:string term, 
  2:i32 limitArtists, 
  3:i32 limitAlbums, 
  4:i32 limitTracks, 
  5:string sessionId, 
  6:i32 limitPlaylists
);
```

#### Add to favorites

##### Ruby

``` ruby
album.add_to_favorites
```

##### Thrift

```
oneway void addAlbumToFavorites(
  1:i32 albumId, 
  2:string sessionId
);
```

#### Find by id

##### Ruby

``` ruby
album = WiMP::Album.find(123)
```

##### Thrift

```
Album getAlbumById(
  1:i32 albumId, 
  2:string sessionId
);
```

#### Load meta data

##### Ruby

``` ruby
album.load_meta_data
```

##### Thrift

```
AlbumMetadata getAlbumMetaData(
  1:i32 albumId, 
  2:string sessionId
);
```

#### Find by artist ids

#### Ruby

``` ruby
albums = WiMP::Album.by_artist_ids([1,2,3], {
  limit: 10,
  page: 10,
  include_singles: true,
  order_by: Album::NAME
})
```

##### Thrift

```
list<Album> getAlbumsByArtistId(
  1:i32 artistId, 
  2:i32 limit, 
  3:AlbumOrderBy order, 
  4:string sessionId, 
  5:AlbumFilter filter
);
```

```
list<Album> getAlbumsByArtistIdWithPaging(
  1:i32 artistId, 
  2:i32 startIndex, 
  3:i32 limit, 
  4:bool includeSingles, 
  5:AlbumOrderBy order, 
  6:string sessionId
);
```

#### Find all by category id

##### Ruby

``` ruby
albums = WiMP::Album.by_category_id(1, {
  limit: 10,
  page: 10,
  include_singles: true,
  order_by: Album::NAME
})
```

##### Thrift

```
list<Album> getAlbumsByCategoryId(
  1:i32 categoryId, 
  2:i32 startIndex, 
  3:i32 limit, 
  4:string sessionId
);
```

#### Find all by category id

##### Ruby

``` ruby
albums = WiMP::Album.find_by_ids([1,2,3,4])
```

##### Thrift

```
list<Album> getAlbumsByIds(
  1:list<i32> albumIds, 
  2:string sessionId
);
```

#### Get booklet URL

##### Ruby

``` ruby
url = album.booklet_url
```

##### Thrift

```
string getBookletURL(
  1:i32 albumId, 
  2:string sessionId
);
```

### Artist

#### Search

##### Ruby

``` ruby
artists = WiMP::Artist.search(query, {
  limit: 10
})
```

##### Thrift

```
SearchResult search(
  1:string term, 
  2:i32 limitArtists, 
  3:i32 limitAlbums, 
  4:i32 limitTracks, 
  5:string sessionId, 
  6:i32 limitPlaylists
);
```

#### Find by artist id

##### Ruby

``` ruby
artist = WiMP::Artist.find(123)
```

##### Thrift

```
Artist getArtistById(
  1:i32 artistId, 
  2:string sessionId
);
```

#### Load meta data

##### Ruby

``` ruby
artist.load_meta_data
```

##### Thrift

```
ArtistMetaData getArtistMetaData(
  1:i32 artistId, 
  2:string sessionId
);
```

### Playlist

#### Search

##### Ruby

``` ruby
playlists = WiMP::Playlist.search(query, {
  limit: 10
})
```

##### Thrift

```
SearchResult search(
  1:string term, 
  2:i32 limitArtists, 
  3:i32 limitAlbums, 
  4:i32 limitTracks, 
  5:string sessionId, 
  6:i32 limitPlaylists
);
```

#### Add tracks using tracks

##### Ruby

``` ruby
status = playlist.add_tracks(tracks, {
  start_position: 1
})
```

#### Thrift

```
bool addTracksToUserPlaylist(
  1:string playlistUUID, 
  2:list<i32> tracks, 
  3:i32 position, 
  4:string sessionId
);
```

#### Add tracks using track ids

##### Ruby

``` ruby
status = playlist.add_track_ids(track_ids, {
  start_position: 1
})
```

##### Thrift

```
bool addTracksToUserPlaylist(
  1:string playlistUUID, 
  2:list<i32> tracks, 
  3:i32 position, 
  4:string sessionId
);
```

#### Add to favorites

##### Ruby

``` ruby
playlist.add_to_favorites
```

##### Thrift

```
oneway void addPlaylistToFavorites(
  1:string playlistUUID, 
  2:string sessionId
);
```

#### Create playlist

##### Ruby

``` ruby
playlist = WiMP::Playlist.create(title)
```

##### Thrift

```
Playlist addUserPlaylist(
  1:string title, 
  2:string sessionId
);
```

#### Move tracks

##### Ruby

``` ruby
status = playlist.move_tracks(tracks, {
  from_index: [123],
  to_index: 123
})
```

##### Thrift

```
bool moveUserPlaylistTracks(
  1:string uuid, 
  2:list<i32> fromIndex, 
  3:i32 toIndex, 
  4:string sessonId
);
```


#### Remove playlist

##### Ruby

``` ruby
status = playlist.destroy
```

##### Thrift

```
bool removeUserPlaylistByUuid(
  1:string uuid, 
  2:string sessonId
);
```

#### Remove tracks

##### Ruby

``` ruby
status = playlist.remove_tracks(tracks)
```

##### Thrift

```
bool removeUserPlaylistTracks(
  1:string uuid, 
  2:list<i32> indices, 
  3:string sessonId
);
```


#### Rename playlist

##### Ruby

``` ruby
status = playlist.rename(title)
```

##### Thrift

```
bool renameUserPlaylistByUuid(
  1:string uuid, 
  2:string title, 
  3:string sessonId
);
```


### You

#### All playlist created by you

##### Filer by PlaylistType

###### Ruby

``` ruby
playlists = WiMP::You.playlists({
  type: PlaylistType::RADIO,
  limit: 10,
  page: 1
})
```
###### Thrift

```
list<Playlist> getUserPlaylistsByType(
  1:PlaylistType type, 
  2:i32 startIndex, 
  3:i32 limit, 
  4:string sessonId
);
```

##### Find by artist id

###### Ruby

``` ruby
playlists = WiMP::You.playlists({
  artist_id: 123,
  limit: 10,
  page: 1
})
```

###### Thrift

```
list<Playlist> getProfileTrackPlayListsByArtistId(
  1:i32 artistId, 
  2:i32 startIndex, 
  3:i32 limit, 
  4:string sessonId
);
```

##### Filer by uuids

###### Ruby

``` ruby
playlists = WiMP::You.playlists({
  uuids: ["...],
  limit: 10,
  page: 1
})
```

###### Thrift

```
list<Playlist> getUserPlaylistsByUuids(
  1:list<string> uuids, 
  2:string sessonId
);
```

##### Filter by category

###### Ruby

``` ruby
playlists = WiMP::You.playlists({
  category_id: 123,
  limit: 10,
  page: 1
})
```

###### Thrift

```
list<Playlist> getPlaylistsByCategoryId(
  1:i32 categoryId, 
  2:i32 startIndex, 
  3:i32 limit, 
  4:string sessonId
);
```

##### All playlists

###### Ruby

``` ruby
playlists = WiMP::You.playlists
```

###### Thrift

```
list<Playlist> getAllUserPlaylists(
  1:string sessionId
);
```

#### Add friend

##### Ruby

``` ruby
WiMP::You.add_friend(user_id)
```

##### Thrift

```
oneway void addFriend(
  1:i32 userId, 
  2:string sessionId
);
```

#### List all friends

##### Ruby

``` ruby
friends = WiMP::You.friends
```

##### Thrift

```
list<Friend> getFriends(
  1:string sessonId
);
```

#### Get favorite albums

##### Ruby

``` ruby
albums = WiMP::You.favorite_albums({
  order: FavoriteOrderBy::ALL
})
```

##### Thrift

```
list<FavoriteAlbum> getFavoriteAlbums(
  1:FavoriteOrderBy order, 
  2:string sessionId
);
```

#### Get favorite artists

##### Ruby

``` ruby
artists = WiMP::You.favorite_artists({
  order: FavoriteOrderBy::ALL
})
```

##### Thrift

```
list<FavoriteArtist> getFavoriteArtists(
  1:FavoriteOrderBy order, 
  2:string sessionId
);
```

#### Get favorite artists

##### Ruby

``` ruby
playlists = WiMP::You.favorite_playlists({
  order: FavoriteOrderBy::ALL
})
```

##### Thrift

```
list<FavoritePlaylist> getFavoritePlaylists(
  1:FavoriteOrderBy order, 
  2:string sessionId
);
```

#### Get favorite tracks

##### Ruby

``` ruby
tracks = WiMP::You.favorite_playlists({
  order: FavoriteOrderBy::ALL
})
```

##### Thrift

```
list<FavoriteTrack> getFavoriteTracks(
  1:FavoriteOrderBy order, 
  2:string sessonId
);
```

### User

#### Find favorite album by profile id

##### Ruby

``` ruby
albums = WiMP::User.favorite_albums({
  order: FavoriteOrderBy::ALL,
  privacy_level: PrivacyLevel::ALL,
  profile_id: 123
})
```

##### Thrift

```
list<FavoriteAlbum> getFavoriteAlbumsByProfileId(
  1:i32 profileId, 
  2:PrivacyLevel paramPrivacyLevel, 
  3:FavoriteOrderBy order, 
  4:string sessionId
);
```


#### Find favorite artists by profile id

##### Ruby

``` ruby
artists = WiMP::User.favorite_albums({
  order: FavoriteOrderBy::ALL,
  privacy_level: PrivacyLevel::ALL,
  profile_id: 123
})
```

##### Thrift

```
list<FavoriteArtist> getFavoriteArtistsByProfileId(
  1:i32 profileId, 
  2:PrivacyLevel paramPrivacyLevel, 
  3:FavoriteOrderBy order, 
  4:string sessionId
);
```

#### Find favorite playlists by profile id

##### Ruby

``` ruby
playlists = WiMP::User.favorite_playlists({
  order: FavoriteOrderBy::ALL,
  privacy_level: PrivacyLevel::ALL,
  profile_id: 123
})
```

##### Thrift

```
list<FavoritePlaylist> getFavoritePlaylistsByProfileId(
  1:i32 profileId, 
  2:PrivacyLevel paramPrivacyLevel, 
  3:FavoriteOrderBy order, 
  4:string sessonId
);
```

#### Find favorite tracks by profile id

##### Ruby

``` ruby
tracks = WiMP::User.favorite_tracks({
  order: FavoriteOrderBy::ALL,
  privacy_level: PrivacyLevel::ALL,
  profile_id: 123
})
```

##### Thrift

```
list<FavoriteTrack> getFavoriteTracksByProfileId(
  1:i32 profileId, 
  2:PrivacyLevel paramPrivacyLevel, 
  3:FavoriteOrderBy order, 
  4:string sessonId
);
```

#### Find posts by profile id

##### Ruby

``` ruby
posts = WiMP::User.favorite_tracks({
  limit: 10,
  page: 1,
  profile_id: 123
})
```

##### Thrift

```
list<WallPost> getWallPosts(
  1:i32 profileId, 
  2:i32 startIndex, 
  3:i32 offset, 
  4:string sessonId
);
```

### Category

#### Find by id

##### Ruby

``` ruby
category = WiMP::Category.find(123)
```

##### Thrift

```
Category getCategoryById(
  1:i32 categoryId, 
  2:string sessionId
);
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/wimp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## FAQ

### Can I port this library to language X?

Yes. WiMP uses [thrift](http://thrift.apache.org/) behind the scene, 
which means that code to over 7 languages can be generated.

Take a look in the resources folder for more information.

### Can I stream music?

The WiMP API has support for streaming, but this library doesn't.

### What methods from the offical API aren't implemented?

Take a look at the resources for a complete list.