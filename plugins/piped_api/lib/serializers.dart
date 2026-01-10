//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_import

library serializers;

import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'package:piped_api/src/model/channel_info.dart';
import 'package:piped_api/src/model/channel_item.dart';
import 'package:piped_api/src/model/comment.dart';
import 'package:piped_api/src/model/comments_page.dart';
import 'package:piped_api/src/model/exception_error.dart';
import 'package:piped_api/src/model/playlist_item.dart';
import 'package:piped_api/src/model/regions.dart';
import 'package:piped_api/src/model/search_filter.dart';
import 'package:piped_api/src/model/search_item.dart';
import 'package:piped_api/src/model/search_page.dart';
import 'package:piped_api/src/model/stream.dart';
import 'package:piped_api/src/model/stream_item.dart';
import 'package:piped_api/src/model/streams_page.dart';
import 'package:piped_api/src/model/subtitle.dart';
import 'package:piped_api/src/model/video_info.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  ChannelInfo,
  ChannelItem,
  Comment,
  CommentsPage,
  ExceptionError,
  PlaylistItem,
  Regions,
  SearchFilter,
  SearchItem,
  SearchPage,
  Stream,
  StreamItem,
  StreamsPage,
  Subtitle,
  VideoInfo,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(StreamItem)]),
        () => ListBuilder<StreamItem>(),
      )
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
