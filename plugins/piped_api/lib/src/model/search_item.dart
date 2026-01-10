//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:piped_api/src/model/stream_item.dart';
import 'package:piped_api/src/model/channel_item.dart';
import 'package:piped_api/src/model/playlist_item.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:one_of/one_of.dart';

part 'search_item.g.dart';

/// SearchItem
///
/// Properties:
/// * [type] - The type of the playlist item. Always playlist.
/// * [duration] - The duration of the video in seconds.
/// * [thumbnail] - The thumbnail of the playlist.
/// * [title] - The title of the video.
/// * [uploaded] - The date in unix epoch the video was uploaded.
/// * [uploadedDate] - The relative date the video was uploaded on.
/// * [uploaderAvatar] - The avatar of the channel of the video.
/// * [uploaderName] - The name of the channel of the video.
/// * [uploaderUrl] - The relative URL of the channel of the video.
/// * [uploaderVerified] - Whether or not the channel has a verified badge.
/// * [url] - The relative URL of the playlist.
/// * [views] - The number of views the video has.
/// * [isShort] - Whether or not the video is a short video.
/// * [shortDescription] - The short description of the video.
/// * [description] - The description of the channel.
/// * [name] - The name of the playlist.
/// * [subscribers] - The number of subscribers the channel has.
/// * [verified] - Whether the channel is verified.
/// * [videos] - The number of videos in the playlist.
@BuiltValue()
abstract class SearchItem implements Built<SearchItem, SearchItemBuilder> {
  /// One Of [ChannelItem], [PlaylistItem], [StreamItem]
  OneOf get oneOf;

  dynamic get data => oneOf.value;

  static const String discriminatorFieldName = r'type';

  static const Map<String, Type> discriminatorMapping = {
    r'channel': ChannelItem,
    r'playlist': PlaylistItem,
    r'stream': StreamItem,
  };

  SearchItem._();

  factory SearchItem([void updates(SearchItemBuilder b)]) = _$SearchItem;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SearchItemBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SearchItem> get serializer => _$SearchItemSerializer();
}

extension SearchItemDiscriminatorExt on SearchItem {
  String? get discriminatorValue {
    if (this is ChannelItem) {
      return r'channel';
    }
    if (this is PlaylistItem) {
      return r'playlist';
    }
    if (this is StreamItem) {
      return r'stream';
    }
    return null;
  }
}

extension SearchItemBuilderDiscriminatorExt on SearchItemBuilder {
  String? get discriminatorValue {
    if (this is ChannelItemBuilder) {
      return r'channel';
    }
    if (this is PlaylistItemBuilder) {
      return r'playlist';
    }
    if (this is StreamItemBuilder) {
      return r'stream';
    }
    return null;
  }
}

class _$SearchItemSerializer implements PrimitiveSerializer<SearchItem> {
  @override
  final Iterable<Type> types = const [SearchItem, _$SearchItem];

  @override
  final String wireName = r'SearchItem';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SearchItem object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {}

  @override
  Object serialize(
    Serializers serializers,
    SearchItem object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final oneOf = object.oneOf;
    return serializers.serialize(oneOf.value,
        specifiedType: FullType(oneOf.valueType))!;
  }

  @override
  SearchItem deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SearchItemBuilder();
    Object? oneOfDataSrc;
    final serializedList = (serialized as Iterable<Object?>).toList();
    final discIndex =
        serializedList.indexOf(SearchItem.discriminatorFieldName) + 1;
    final discValue = serializers.deserialize(serializedList[discIndex],
        specifiedType: FullType(String)) as String;
    oneOfDataSrc = serialized;
    final oneOfTypes = [
      ChannelItem,
      PlaylistItem,
      StreamItem,
    ];
    Object oneOfResult;
    Type oneOfType;
    switch (discValue) {
      case r'channel':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(ChannelItem),
        ) as ChannelItem;
        oneOfType = ChannelItem;
        break;
      case r'playlist':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(PlaylistItem),
        ) as PlaylistItem;
        oneOfType = PlaylistItem;
        break;
      case r'stream':
        oneOfResult = serializers.deserialize(
          oneOfDataSrc,
          specifiedType: FullType(StreamItem),
        ) as StreamItem;
        oneOfType = StreamItem;
        break;
      default:
        throw UnsupportedError(
            "Couldn't deserialize oneOf for the discriminator value: ${discValue}");
    }
    result.oneOf = OneOfDynamic(
        typeIndex: oneOfTypes.indexOf(oneOfType),
        types: oneOfTypes,
        value: oneOfResult);
    return result.build();
  }
}
