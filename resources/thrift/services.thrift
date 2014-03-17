service ClientApiLoginService {
  map<string, string> getClientConfig(1:string partnerUsername, 2:string partnerPassword, 3:string clientName);
  Profile simpleLogin(1:string userName, 2:string password, 3:string partnerUsername, 4:string partnerPassword, 5:string clientName, 6:string clientUniqueKey);
  Profile recoverPassword(1:string userName, 2:string partnerUsername, 3:string partnerPassword);
  Profile loginWithToken(1:string userName, 2:string password, 3:string partnerUsername, 4:string partnerPassword, 5:string clientName);
}

service ClientApiService { 
  SearchResult search(1:string term, 2:i32 limitArtists, 3:i32 limitAlbums, 4:i32 limitTracks, 5:string sessionId, 6:i32 limitPlaylists);
  oneway void addAlbumToFavorites(1:i32 albumId, 2:string sessionId);
  oneway void addArtistToFavorites(1:i32 artistId, 2:string sessionId);
  oneway void addFriend(1:i32 userId, 2:string sessionId);
  oneway void addPlaylistToFavorites(1:string playlistUUID, 2:string sessionId);
  oneway void addTrackToFavorites(1:i32 trackId, 2:string sessionId);
  bool addTracksToUserPlaylist(1:string playlistUUID, 2:list<i32> tracks, 3:i32 position, 4:string sessionId);
  Playlist addUserPlaylist(1:string title, 2:string sessionId);
  Album getAlbumById(1:i32 albumId, 2:string sessionId);
  AlbumMetadata getAlbumMetaData(1:i32 albumId, 2:string sessionId);
  list<Album> getAlbumsByArtistId(1:i32 artistId, 2:i32 limit, 3:AlbumOrderBy order, 4:string sessionId, 5:AlbumFilter filter);
  list<Album> getAlbumsByArtistIdWithPaging(1:i32 artistId, 2:i32 startIndex, 3:i32 limit, 4:bool includeSingles, 5:AlbumOrderBy order, 6:string sessionId);
  list<Album> getAlbumsByCategoryId(1:i32 categoryId, 2:i32 startIndex, 3:i32 limit, 4:string sessionId);
  list<Album> getAlbumsByIds(1:list<i32> albumIds, 2:string sessionId);
  list<Playlist> getAllUserPlaylists(1:string sessionId);
  Artist getArtistById(1:i32 artistId, 2:string sessionId);
  ArtistMetaData getArtistMetaData(1:i32 artistId, 2:string sessionId);
  string getBookletURL(1:i32 albumId, 2:string sessionId);
  list<Category> getCategories(1:i32 categoryId, 2:string sessionId, 3:i32 startIndex, 4:i32 limit);
  CategoryTree getCategoryAndSubCategories(1:i32 categoryId, 2:i32 depth, 3:string sessionId);
  Category getCategoryById(1:i32 categoryId, 2:string sessionId);
  list<FavoriteAlbum> getFavoriteAlbums(1:FavoriteOrderBy order, 2:string sessionId);
  list<FavoriteAlbum> getFavoriteAlbumsByProfileId(1:i32 profileId, 2:PrivacyLevel paramPrivacyLevel, 3:FavoriteOrderBy order, 4:string sessionId);
  list<FavoriteArtist> getFavoriteArtists(1:FavoriteOrderBy order, 2:string sessionId);
  list<FavoriteArtist> getFavoriteArtistsByProfileId(1:i32 profileId, 2:PrivacyLevel paramPrivacyLevel, 3:FavoriteOrderBy order, 4:string sessionId);
  list<FavoritePlaylist> getFavoritePlaylists(1:FavoriteOrderBy order, 2:string sessionId);
  list<FavoritePlaylist> getFavoritePlaylistsByProfileId(1:i32 profileId, 2:PrivacyLevel paramPrivacyLevel, 3:FavoriteOrderBy order, 4:string sessonId);
  list<FavoriteTrack> getFavoriteTracks(1:FavoriteOrderBy order, 2:string sessonId);
  list<FavoriteTrack> getFavoriteTracksByProfileId(1:i32 profileId, 2:PrivacyLevel paramPrivacyLevel, 3:FavoriteOrderBy order, 4:string sessonId);
  list<WallPost> getWallPosts(1:i32 profileId, 2:i32 startIndex, 3:i32 offset, 4:string sessonId);
  list<Friend> getFriends(1:string sessonId);
  i64 getLastUpdatedFavAlbum(1:string sessonId);
  i64 getLastUpdatedFavArtist(1:string sessonId);
  i64 getLastUpdatedFavPlaylist(1:string sessonId);
  i64 getLastUpdatedFavTrack(1:string sessonId);
  i64 getLastUpdatedPlaylist(1:string sessonId);
  list<Playlist> getPlaylistsByCategoryId(1:i32 categoryId, 2:i32 startIndex, 3:i32 limit, 4:string sessonId);
  list<Playlist> getProfileTrackPlayListsByArtistId(1:i32 artistId, 2:i32 startIndex, 3:i32 limit, 4:string sessonId);
  list<Playlist> getProfileTrackPlayListsInclidingArtistId(1:i32 artistId, 2:i32 startIndex, 3:i32 limit, 4:string sessonId);
  list<Track> getTopTracksByArtistId(1:i32 artistId, 2:i32 limit, 3:bool onlyAsMainArtist, 4:string sessonId);
  Track getTrackById(1:i32 trackId, 2:string sessonId);
  list<Track> getTracksByAlbumId(1:i32 albumId, 2:string sessonId);
  list<Track> getTracksByCategoryId(1:i32 categoryId, 2:i32 startIndex, 3:i32 limit, 4:string sessonId);
  Playlist getUserPlaylistByUuid(1:string uuid, 2:string sessonId);
  list<Playlist> getUserPlaylistsByType(1:PlaylistType type, 2:i32 startIndex, 3:i32 limit, 4:string sessonId)
  list<Playlist> getUserPlaylistsByUuids(1:list<string> uuids, 2:string sessonId)
  bool moveUserPlaylistTracks(1:string uuid, 2:list<i32> fromIndex, 3:i32 toIndex, 4:string sessonId);
  bool removeUserPlaylistByUuid(1:string uuid, 2:string sessonId);
  bool removeUserPlaylistTracks(1:string uuid, 2:list<i32> indices, 3:string sessonId);
  bool renameUserPlaylistByUuid(1:string uuid, 2:string title, 3:string sessonId);
  list<Track> suggestTracksByArtistIds(1:list<i32> artistIds, 2:i32 limit, 3:string sessonId);
  list<Track> suggestTracksByTrackIds(1:list<i32> trackIds, 2:i32 limit, 3:string sessonId);
}