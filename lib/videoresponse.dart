class VideoResponse {
  String regionCode;
  String kind;
  String nextPageToken;
  PageInfo pageInfo;
  String etag;
  List<ItemsItem> items;

  VideoResponse(
      {this.regionCode,
      this.kind,
      this.nextPageToken,
      this.pageInfo,
      this.etag,
      this.items});

  factory VideoResponse.fromJson(Map<String, dynamic> youtubeJson) {
    PageInfo pageInfo = PageInfo.fromJson(youtubeJson['pageInfo']);
    var list = youtubeJson['items'] as List;
    List<ItemsItem> items = list.map((i) => ItemsItem.fromJson(i)).toList();

    return VideoResponse(
      pageInfo: pageInfo,
      items: items,
      regionCode: youtubeJson['regionCode'],
      kind: youtubeJson['kind'],
      nextPageToken: youtubeJson['nextPageToken'],
      etag: youtubeJson['etag'],
    );
  }
}

class PageInfo {
  int totalResults;
  int resultsPerPage;

  PageInfo({this.totalResults, this.resultsPerPage});

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
        totalResults: json['totalResults'],
        resultsPerPage: json['resultsPerPage']);
  }
}

class ItemsItem {
  String kind;
  String etag;
  Snippet snippet;
  Id id;

  ItemsItem({this.kind, this.etag, this.snippet, this.id});

  factory ItemsItem.fromJson(Map<String, dynamic> json) {
    Snippet snippet = Snippet.fromJson(json['snippet']);
    Id id = Id.fromJson(json['id']);

    return ItemsItem(
        snippet: snippet, id: id, kind: json['kind'], etag: json['etag']);
  }
}

class Id {
  String kind;
  String videoId;

  Id({this.kind, this.videoId});

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(kind: json['kind'], videoId: json['videoId']);
  }
}

class Snippet {
  String publishedAt;
  String description;
  String title;
  String channelId;
  String channelTitle;
  String liveBroadcastContent;
  Thumbnails thumbnails;

  Snippet(
      {this.publishedAt,
      this.description,
      this.title,
      this.channelId,
      this.channelTitle,
      this.liveBroadcastContent,
      this.thumbnails});

  factory Snippet.fromJson(Map<String, dynamic> json) {
    Thumbnails thumbnails = Thumbnails.fromJson(json['thumbnails']);

    return Snippet(
        thumbnails: thumbnails,
        publishedAt: json['publishedAt'],
        description: json['description'],
        title: json['title'],
        channelId: json['channelId'],
        channelTitle: json['channelTitle'],
        liveBroadcastContent: json['liveBroadcastContent']);
  }
}

class Thumbnails {
  ThumbnailDetail thumbnailDefault;
  ThumbnailDetail medium;
  ThumbnailDetail high;

  Thumbnails({this.thumbnailDefault, this.medium, this.high});

  factory Thumbnails.fromJson(Map<String, dynamic> json) {
    ThumbnailDetail d = ThumbnailDetail.fromJson(json['default']);
    ThumbnailDetail m = ThumbnailDetail.fromJson(json['medium']);
    ThumbnailDetail h = ThumbnailDetail.fromJson(json['high']);

    return Thumbnails(
      thumbnailDefault: d,
      medium: m,
      high: h
    );
  }
}

class ThumbnailDetail {
  int width;
  String url;
  int height;

  ThumbnailDetail({this.width, this.url, this.height});

  factory ThumbnailDetail.fromJson(Map<String, dynamic> json) {
    return ThumbnailDetail(
        width: json['width'], url: json['url'], height: json['height']);
  }
}
