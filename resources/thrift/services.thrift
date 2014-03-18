namespace rb WiMP.Gen

enum AlbumOrderBy {
  POPULARITY = 1,
  POPULARITY_THIS_WEEK = 2,
  ALBUM_NAME = 3,
  ARTIST_NAME = 4,
  RELEASE_DATE = 5
}

enum PlaylistType {
  PRIVATE = 1,
  EDITORIAL = 2,
  ARTIST = 3,
  USER = 4,
  RADIO = 5
}

enum PrivacyLevel {
  ALL = 1,
  PUBLIC = 2,
  FRIENDS = 3
}

enum FavoriteOrderBy {
  NAME = 1,
  ARTIST_NAME = 2,
  DATE_ADDED = 3,
  INDEX = 4
}

enum AlbumFilter {
  ALL = 1,
  ALLBUTSINGLES = 2,
  ONLYEPS = 3,
  ONLYSINGLES = 4,
  ONLYALBUMS = 5,
  ALLBUTALBUMS = 6,
  ONLYOWNALBUMS = 7,
  ALLBUTOWN = 8,
  ONLYOWNSINGLESANDEPS = 9
}

struct Profile {
  1: required i32 profileId;
  2: required i32 userId;
  3: optional string phoneNumber;
  4: required i64 registrationDate;
  5: required string sessionId;
  6: optional string mobileOperator;
  7: required string subscriptionStatus;
  8: required i32 channelId;
  9: required bool clientAuthorizedForOfflineContent;
  10: required bool validForStreaming;
  11: required i64 subscriptionEndDate;
  12: required i32 playListSharingLevel;
  13: required i32 artistSharingLevel;
  14: required i32 trackSharingLevel;
  15: required i32 albumSharingLevel;
  16: required string username;
  17: required i64 allowOfflineUntil;
  18: required i32 registrationType;
  19: required i64 facebookUid;
  20: required string subscriptionType;
  21: required bool hasPremiumAccess;
  22: required bool enableFacebookScrobbling;
  23: required i32 highestAudioEncoding;
  24: required i64 lastUpdatedFavArtist;
  25: required i64 lastUpdatedFavTrack;
  26: required i64 lastUpdatedFavAlbum;
  27: required i64 lastUpdatedFavPlaylist;
  28: required i64 lastUpdatedLibraryPlaylists;
  29: required i32 partnerId;
}

struct Artist {
  1: required string artistName;
  2: required string artistBio;
  3: required i32 artistId;
  4: optional string info;
  5: optional string link;
}

struct RecordLabel {
  1: required string recordLabelName;
  2: required i32 recordLabelId;
  3: required string recordProvider;
  4: required i32 recordProviderId;
  5: required string recordSubLabel;
  6: required i32 recordSubLabelId;
}

struct Track {
  1: required string title;
  2: required string artist;
  3: required i32 artistId;
  4: required i32 albumId;
  5: required string album;
  6: optional string copyright;
  7: required i32 duration;
  8: optional string smallAlbumCover;
  9: optional string mediumAlbumCover;
  10: optional string largeAlbumCover;
  11: required i32 id;
  12: optional string contentAccessString;
  13: required i32 volumeNumber;
  14: optional i32 trackNumber;
  15: optional string version;
  16: required i64 salesStartDate;
  17: required bool salesReady;
  18: required bool streamReady;
  19: required double price;
  20: optional string currencyCode;
  21: required bool albumOnly;
  22: required bool albumBroken;
  23: optional string priceCode;
  24: required string albumCalculatedType;
  25: required bool allowStreaming;
  26: required i32 albumNrOfVolumes;
  27: required i32 popularity;
  28: required i32 popularityThisWeek;
  29: required double searchScore;
  30: required RecordLabel recordLabel;
  31: required i32 salesPriceRuleId;
  32: required i64 streamStartDate;
  33: required string previewURL;
  34: optional string customizableAlbumCover;
  35: required bool premiumOnlyStreaming;
  36: required i32 popularityLevel;
  37: required string revisedCopyright;
}

struct Album {
  1: required i32 id;
  2: required bool allowStreaming;
  3: required string artist;
  4: required i32 artistId;
  5: required string calculatedType;
  6: required string copyright;
  7: required i32 duration;
  8: required string genre;
  9: optional string largeAlbumCover;
  10: required i32 numberOfTracks;
  11: required i32 numberOfVolumes;
  12: required bool partialData;
  13: required i32 partialNrOfTracks;
  14: required RecordLabel recordLabel;
  15: required i64 salesStartDate;
  16: required bool streamReady;
  17: required string title;
  18: optional string version;
  19: optional string currencyCode;
  20: optional string desc;
  21: optional string details;
  22: optional string mediumAlbumCover;
  23: optional string smallAlbumCover;
  24: required i32 popularity;
  25: required i32 popularityThisWeek;
  26: required double price;
  27: required string priceCode;
  28: required i64 releaseDate;
  29: required string releaseYear;
  30: required i32 salesPriceRuleId;
  31: required bool salesReady;
  32: required double searchScore;
  33: required string trackBundleType;
  34: required bool trackOnly;
  35: required i64 streamStartDate;
  36: optional string customizableAlbumCover;
  37: optional string bookletURL;
  38: required bool premiumOnlyStreaming;
  39: required string revisedCopyright;
}

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

struct SearchResult {
  1: optional list<Artist> artists;
  2: optional list<Track> tracks;
  3: optional list<Album> albums;
  4: optional list<Playlist> playlist;
}

struct AlbumReview {
  1: required string review;
  2: required string summary;
  3: required string sourceName;
}

struct SimilarAlbum {
  1: required i32 albumId;
  2: required string title;
  3: required string artistName;
  4: required i32 artistId;
}

struct SimilarAlbumList {
  1: required list<SimilarAlbum> similarAlbums;
  2: required string sourceName;
}

struct AlbumMetadata {
  1: required i32 albumId;
  2: required string title;
  3: required i32 artistId;
  4: required AlbumReview albumReview;
  5: required SimilarAlbumList similarAlbumList;
}

struct SimilarArtist {
  1: required i32 artistId;
  2: required string artistName;
}

struct SimilarArtistList {
  1: required list<SimilarArtist> similarArtistList;
  2: required string sourceName;
}

struct RelatedArtist {
  1: required i32 artistId;
  2: required string artistName;
  3: required i32 relationType;
}

struct RelatedArtistList {
  1: required list<RelatedArtist> relatedArtistList;
  2: required string sourceName;
}

struct ArtistLink {
  1: required string url;
}

struct ArtistLinkList {
  1: required list<ArtistLink> artistLinks;
  2: required string sourceName;
}

struct ArtistBiography {
  1: required string biographySummary;
  2: required string biography;
  3: required string sourceName;
}

struct ArtistMetaData {
  1: required i32 artistId;
  2: required string artistName;
  3: required ArtistBiography artistBiography;
  4: required SimilarArtistList similarArtists;
  5: required RelatedArtistList relatedArtists;
  6: required ArtistLinkList artistLinks;
}

struct Category {
  1: required i32 id;
  2: optional string name;
  8: required i64 lastUpdated;
  9: required i32 contentType;
  10: optional string desc;
  11: required bool hasProductDescriptions;
  12: optional string imageURL;
}

struct CategoryTree {
  1: optional Category category;
  2: optional map<i32, list<Category>> children;
}

struct FavoriteAlbum {
  1: optional i32 dateAdded;
  2: required Album album;
  3: required i32 profileId;
}

struct FavoriteArtist {
  1: required i64 dateAdded;
  2: required Artist artist;
  3: required list<Album> albums;
  4: required i32 profileId;
}

struct FavoritePlaylist {
  1: required i64 dateAdded;
  2: required Playlist playlist;
  3: required i32 profileId;
}

struct FavoriteTrack {
  1: required i64 dateAdded;
  2: required Track track;
  3: required i32 profileId;
}

struct WallPost {
  1: required i32 id;
  2: required i32 profileId;
  3: required i64 postDate;
  4: required i32 action;
  5: required string artifactId;
  6: required string artifactTitle;
  7: optional string artifactParentTitle; 
}

struct Friend {
  1: required i32 id;
  2: required i64 lastUpdatedFavourites;
  3: required i64 facebookUid;
  4: required i64 madeFriendDate;
  5: required i64 lastVisitedFriendDate;
  6: required bool blocked;
  7: required string friendType;
  8: required string nick;
  9: required i32 friendProfileId;
  10: required i32 nrOfSharedAlbums;
  11: required i32 nrOfSharedTracks;
  12: required i32 nrOfSharedPlayLists;
  13: required i32 nrOfSharedArtists;
}

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