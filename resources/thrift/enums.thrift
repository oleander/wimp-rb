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