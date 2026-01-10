import 'package:built_collection/built_collection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart' as yexp;
import 'package:pstube/data/models/models.dart';
import 'package:pstube/data/models/search_data.dart';

final youtubeServiceProvider = Provider<YoutubeService>((ref) {
  final youtube = yexp.YoutubeExplode();
  return YoutubeService(youtube: youtube);
});

class YoutubeService {
  YoutubeService({required this.youtube});

  final yexp.YoutubeExplode youtube;

  Future<StreamList<SearchData>?> search({
    required String query,
  }) async {
    try {
      final searchResults = await youtube.search.getVideos(query);
      if (searchResults.isEmpty) return null;

      final results = <SearchData>[];
      for (final result in searchResults) {
        results.add(SearchData(
          data: _convertToVideoData(result),
        ));
      }

      return StreamList(
        streams: results.toBuiltList(),
        nextpage: null,
      );
    } catch (e) {
      return null;
    }
  }

  Future<StreamList<SearchData>?> searchNextPage({
    required String nextpage,
    required String query,
  }) async {
    return null;
  }

  VideoData _convertToVideoData(yexp.Video video) {
    return VideoData(
      thumbnails: Thumbnails(videoId: video.id.value),
      title: video.title,
      id: VideoId(video.id.value),
      duration: video.duration?.inSeconds,
      durationString: video.duration?.toString(),
      uploader: video.author,
      uploaderId:
          video.channelId != null ? UploaderId(video.channelId!.value) : null,
      views: video.engagement.viewCount,
      uploadDate: video.uploadDate?.toIso8601String(),
    );
  }

  void close() {
    youtube.close();
  }
}
