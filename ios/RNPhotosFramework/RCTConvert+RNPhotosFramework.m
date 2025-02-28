#import <React/RCTConvert.h>
#import "RCTConvert+RNPhotosFramework.h"

@import Photos;
@implementation RCTConvert(ReactNativePhotosFramework)

//We want to be able to reverse the enum. From ENUM => String.
//So we extend the built in RCT_ENUM_CONVERTER-macro
#define RCT_ENUM_CONVERTER_WITH_REVERSED(type, values, default, getter) \
+ (type)type:(id)json                                     \
{                                                         \
static NSDictionary *mapping;                           \
static dispatch_once_t onceToken;                       \
dispatch_once(&onceToken, ^{                            \
mapping = values;                                     \
});                                                     \
return [RCTConvertEnumValue(#type, mapping, @(default), json) getter]; \
}                                                        \
+ (NSDictionary *)type##ValuesReversed                        \
{                                                         \
    static NSDictionary *mapping;                           \
    static dispatch_once_t onceToken;                       \
    dispatch_once(&onceToken, ^{                            \
        NSArray *keys = values.allKeys;                     \
        NSArray *valuesArray = [values objectsForKeys:keys notFoundMarker:[NSNull null]];    \
        mapping = [NSDictionary dictionaryWithObjects:keys forKeys:valuesArray];\
    });                                                     \
    return mapping;                                         \
}


RCT_ENUM_CONVERTER_WITH_REVERSED(PHAuthorizationStatus, (@{
                                                           @"notDetermined" : @(PHAuthorizationStatusNotDetermined),
                                                           @"restricted" : @(PHAuthorizationStatusRestricted),
                                                           @"denied" : @(PHAuthorizationStatusDenied),
                                                           @"authorized" : @(PHAuthorizationStatusAuthorized)
                                                        }), PHAuthorizationStatusNotDetermined, integerValue)


RCT_ENUM_CONVERTER_WITH_REVERSED(RNPFAssetCountType, (@{
                                                        @"estimated": @(RNPFAssetCountTypeEstimated),
                                                        @"exact": @(RNPFAssetCountTypeExact)
                                                        }), RNPFAssetCountTypeEstimated, integerValue)

RCT_ENUM_CONVERTER_WITH_REVERSED(PHAssetBurstSelectionType, (@{
                                                        @"none": @(PHAssetBurstSelectionTypeNone),
                                                        @"autoPick": @(PHAssetBurstSelectionTypeAutoPick),
                                                        @"userPick": @(PHAssetBurstSelectionTypeUserPick)
                                                        }), PHAssetBurstSelectionTypeNone, integerValue)

RCT_ENUM_CONVERTER_WITH_REVERSED(PHAssetMediaType, (@{
                                        @"image": @(PHAssetMediaTypeImage),
                                        @"video": @(PHAssetMediaTypeVideo),
                                        @"audio": @(PHAssetMediaTypeAudio),
                                        @"unknown": @(PHAssetMediaTypeUnknown)
                                        
                                        }), PHAssetMediaTypeImage, integerValue)

RCT_ENUM_CONVERTER_WITH_REVERSED(PHAssetMediaSubtype, (@{
                                           @"none": @(PHAssetMediaSubtypeNone),
                                           @"photoPanorama": @(PHAssetMediaSubtypePhotoPanorama),
                                           @"photoHDR": @(PHAssetMediaSubtypePhotoHDR),
                                           @"photoScreenshot": @(PHAssetMediaSubtypePhotoScreenshot),
                                           @"photoLive": @(PHAssetMediaSubtypePhotoLive),
                                           @"videoStreamed": @(PHAssetMediaSubtypeVideoStreamed),
                                           @"videoHighFrameRate": @(PHAssetMediaSubtypeVideoHighFrameRate),
                                           @"videoTimeLapse": @(PHAssetMediaSubtypeVideoTimelapse),
                                           @"photoDepthEffect": @(PHAssetMediaSubtypePhotoDepthEffect),
                                           }), PHAssetMediaSubtypeNone, integerValue)


RCT_ENUM_CONVERTER_WITH_REVERSED(PHAssetCollectionType, (@{
                                             @"album": @(PHAssetCollectionTypeAlbum),
                                             @"smartAlbum": @(PHAssetCollectionTypeSmartAlbum),
                                             @"moment": @(PHAssetCollectionTypeMoment)
                                             
                                             }), PHAssetCollectionTypeAlbum, integerValue)

RCT_ENUM_CONVERTER_WITH_REVERSED(PHAssetCollectionSubtype, (@{
                                                @"any" : @(PHCollectionListSubtypeAny),
                                                @"albumRegular": @(PHAssetCollectionSubtypeAlbumRegular),
                                                @"syncedEvent": @(PHAssetCollectionSubtypeAlbumSyncedEvent),
                                                @"syncedFaces": @(PHAssetCollectionSubtypeAlbumSyncedFaces),
                                                @"syncedAlbum": @(PHAssetCollectionSubtypeAlbumSyncedAlbum),
                                                @"imported": @(PHAssetCollectionSubtypeAlbumImported),
                                                
                                                @"albumMyPhotoStream": @(PHAssetCollectionSubtypeAlbumMyPhotoStream),
                                                @"albumCloudShared": @(PHAssetCollectionSubtypeAlbumCloudShared),
                                                
                                                @"smartAlbumGeneric": @(PHAssetCollectionSubtypeSmartAlbumGeneric),
                                                @"smartAlbumPanoramas": @(PHAssetCollectionSubtypeSmartAlbumPanoramas),
                                                @"smartAlbumVideos": @(PHAssetCollectionSubtypeSmartAlbumVideos),
                                                @"smartAlbumFavorites": @(PHAssetCollectionSubtypeSmartAlbumFavorites),
                                                @"smartAlbumTimelapses": @(PHAssetCollectionSubtypeSmartAlbumTimelapses),
                                                @"smartAlbumAllHidden": @(PHAssetCollectionSubtypeSmartAlbumAllHidden),
                                                @"smartAlbumRecentlyAdded": @(PHAssetCollectionSubtypeSmartAlbumRecentlyAdded),
                                                @"smartAlbumBursts": @(PHAssetCollectionSubtypeSmartAlbumBursts),
                                                @"smartAlbumSlomoVideos": @(PHAssetCollectionSubtypeSmartAlbumSlomoVideos),
                                                @"smartAlbumUserLibrary": @(PHAssetCollectionSubtypeSmartAlbumUserLibrary),
                                                @"smartAlbumSelfPortraits": @(PHAssetCollectionSubtypeSmartAlbumSelfPortraits),
                                                @"smartAlbumScreenshots": @(PHAssetCollectionSubtypeSmartAlbumScreenshots),
                                                @"smartAlbumDepthEffect" : @(PHAssetCollectionSubtypeSmartAlbumDepthEffect),
                                                @"smartAlbumLivePhotos" : @(PHAssetCollectionSubtypeSmartAlbumLivePhotos),
                                                @"smartAlbumAnimated": @(PHAssetCollectionSubtypeSmartAlbumAnimated),
                                                @"smartAlbumLongExposures": @(PHAssetCollectionSubtypeSmartAlbumLongExposures),
                                                @"smartAlbumUnableToUpload": @(PHAssetCollectionSubtypeSmartAlbumUnableToUpload)
                                                
                                                }), PHCollectionListSubtypeAny, integerValue)

RCT_ENUM_CONVERTER_WITH_REVERSED(PHAssetSourceType, (@{
                                         @"none": @(PHAssetSourceTypeNone),
                                         @"userLibrary": @(PHAssetSourceTypeUserLibrary),
                                         @"cloudShared": @(PHAssetSourceTypeCloudShared),
                                         @"itunesSynced": @(PHAssetSourceTypeiTunesSynced)
                                         
                                         }), PHAssetSourceTypeNone, integerValue)

RCT_ENUM_CONVERTER_WITH_REVERSED(PHAssetResourceType, (@{
                                                       @"photo": @(PHAssetResourceTypePhoto),
                                                       @"video": @(PHAssetResourceTypeVideo),
                                                       @"audio": @(PHAssetResourceTypeAudio),
                                                       @"alternatePhoto": @(PHAssetResourceTypeAlternatePhoto),
                                                       @"fullSizePhoto": @(PHAssetResourceTypeFullSizePhoto),
                                                       @"fullSizeVideo": @(PHAssetResourceTypeFullSizeVideo),
                                                       @"adjustmentData": @(PHAssetResourceTypeAdjustmentData),
                                                       @"adjustmentBasePhoto": @(PHAssetResourceTypeAdjustmentBasePhoto),
                                                       @"pairedVideo": @(PHAssetResourceTypePairedVideo),
                                                       @"fullSizePairedVideo": @(PHAssetResourceTypeFullSizePairedVideo),
                                                       @"adjustmentBasePairedVideo": @(PHAssetResourceTypeAdjustmentBasePairedVideo),
                                                       @"adjustmentBaseVideo": @(PHAssetResourceTypeAdjustmentBaseVideo),
                                                       @"unknown": @(13),
                                                       @"unknown": @(14),
                                                       @"unknown": @(15),
                                                       @"appleAdjustmentEnvelope": @(16)
                                                       
                                                       }), PHAssetResourceTypePhoto, integerValue)

+ (NSArray<NSNumber *> *)PHAssetMediaTypes:(NSArray<NSString *> *)arrayWithMediaTypeStrings
{
    if(arrayWithMediaTypeStrings.count == 0){
        return nil;
    }
    NSMutableArray *arrayWithMediaTypeEnums = [NSMutableArray arrayWithCapacity:arrayWithMediaTypeStrings.count];
    for(int i = 0; i < arrayWithMediaTypeStrings.count;i++) {
        PHAssetMediaType mediaType = [RCTConvert PHAssetMediaType:[arrayWithMediaTypeStrings objectAtIndex:i]];
        [arrayWithMediaTypeEnums addObject:@(mediaType)];
    }
    return arrayWithMediaTypeEnums;
}

+(NSMutableArray * ) PHAssetMediaSubtypes:(NSArray<NSString *> *)arrayWithSubMediaTypeStrings {
    if(arrayWithSubMediaTypeStrings.count == 0){
        return nil;
    }
    NSMutableArray *arrayWithSubMediaTypes = [NSMutableArray array];
    for(int i = 0; i < arrayWithSubMediaTypeStrings.count;i++) {
        PHAssetMediaSubtype mediaSubTyp = [RCTConvert PHAssetMediaSubtype:[arrayWithSubMediaTypeStrings objectAtIndex:i]];
        [arrayWithSubMediaTypes addObject:[NSNumber numberWithInt:mediaSubTyp]];
    }
    return arrayWithSubMediaTypes;
}

+(int) PHAssetSourceTypes:(NSArray<NSString *> *)arrayWithSourceTypeStrings {
    if(arrayWithSourceTypeStrings.count == 0){
        return PHAssetSourceTypeNone;
    }
    int sourceTypes = 0;
    for(int i = 0; i < arrayWithSourceTypeStrings.count;i++) {
        PHAssetSourceType sourceType = [RCTConvert PHAssetSourceType:[arrayWithSourceTypeStrings objectAtIndex:i]];
        sourceTypes = sourceTypes | sourceType;
    }
    return sourceTypes;
}

+(PHSaveAsset *)PHSaveAsset:(id)json {
    PHSaveAsset *asset = [PHSaveAsset new];
    asset.uri = [RCTConvert NSString:json[@"uri"]];
    asset.type = [RCTConvert NSString:json[@"type"]];
    asset.isNetwork = [RCTConvert BOOL:json[@"isNetwork"]];
    asset.isAsset = [RCTConvert BOOL:json[@"isAsset"]];
    return asset;
}

+(PHSaveAssetRequest *)PHSaveAssetRequest:(id)json {
    PHSaveAssetRequest *assetRequest = [PHSaveAssetRequest new];
    assetRequest.type = [RCTConvert NSString:json[@"type"]];
    assetRequest.source = [RCTConvert PHSaveAsset:json[@"source"]];
    return assetRequest;
}

+(NSArray<PHSaveAssetRequest *> *)PHSaveAssetRequestArray:(id)json {
    NSArray *inputArray = [RCTConvert NSArray:json];
    NSMutableArray *outputArray = [NSMutableArray arrayWithCapacity:inputArray.count];
    for(int i = 0; i < inputArray.count; i++) {
        [outputArray addObject:[self PHSaveAssetRequest:[inputArray objectAtIndex:i]]];
    }
    return outputArray;
}


+(PHSaveAssetFileRequest *)PHSaveAssetFileRequest:(id)json {
    PHSaveAssetFileRequest *assetRequest = [PHSaveAssetFileRequest new];
    assetRequest.uriString = [RCTConvert NSString:json[@"uri"]];
    assetRequest.uri = [RCTConvert NSURLRequest:json[@"uri"]];
    assetRequest.localIdentifier = [RCTConvert NSString:json[@"localIdentifier"]];
    assetRequest.mediaType = [RCTConvert NSString:json[@"mediaType"]];
    assetRequest.fileName = [RCTConvert NSString:json[@"fileName"]];
    assetRequest.dir = [RCTConvert NSString:json[@"dir"]];
    assetRequest.loadOptions = [RCTConvert NSDictionary:json[@"loadOptions"]];
    assetRequest.postProcessOptions = [RCTConvert NSDictionary:json[@"postProcessOptions"]];
    assetRequest.exif = [RCTConvert NSDictionary:json[@"exif"]];

    if(assetRequest.dir == nil) {
        NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString * basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
        assetRequest.dir = basePath;
    }
    
    if([assetRequest.mediaType isEqualToString:@"video"]) {
        assetRequest.videoRequestOptions = [RNPFHelpers getVideoRequestOptionsFromParams:assetRequest.loadOptions];
    }

    return assetRequest;
}

+(NSArray<PHSaveAssetFileRequest *> *)PHSaveAssetFileRequestArray:(id)json {
    NSArray *inputArray = [RCTConvert NSArray:json];
    NSMutableArray *outputArray = [NSMutableArray arrayWithCapacity:inputArray.count];
    for(int i = 0; i < inputArray.count; i++) {
        [outputArray addObject:[self PHSaveAssetFileRequest:[inputArray objectAtIndex:i]]];
    }
    return outputArray;
}

+ (CLLocation *)CLLocation:(id)json {
    json = [self NSDictionary:json];
    //Required:
    double lat = [RCTConvert double:json[@"lat"]];
    double lng = [RCTConvert double:json[@"lng"]];
    
    //Optional:
    double altitude = 0;
    NSString *altitudeValue = json[@"altitude"];
    if(altitudeValue != nil) {
        altitude = [RCTConvert double:altitudeValue];
    }
    
    double course = 0;
    NSString *courseValue = json[@"heading"];
    if(courseValue != nil) {
        course = [RCTConvert double:courseValue];
    }
    
    double speed = 0;
    NSString *speedValue = json[@"speed"];
    if(speedValue != nil) {
        speed = [RCTConvert double:speedValue];
    }
    
    NSDate *timeStamp = [NSDate date];
    NSString *timeStampValue = json[@"timeStamp"];
    if(timeStampValue) {
        timeStamp = [RCTConvert NSDate:timeStampValue];
    }
    
    return [[CLLocation alloc] initWithCoordinate:CLLocationCoordinate2DMake(lat, lng) altitude:altitude horizontalAccuracy:0 verticalAccuracy:0 course:course speed:speed timestamp:timeStamp];
}

@end
