#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    SENTopicTypeAll = 1,
    SENTopicTypePicture = 10,
    SENTopicTypeWord = 29,
    SENTopicTypeVoice = 31,
    SENTopicTypeVideo = 41,
} SENTopicType;


/** 顶部标签栏高度 */
UIKIT_EXTERN CGFloat const SENTitlesViewH;
/** 顶部标签栏Y值 */
UIKIT_EXTERN CGFloat const SENTitlesViewY;

/** cell间距 */
UIKIT_EXTERN CGFloat const SENTopicCellMargin;
/** cell文字内容Y值 */
UIKIT_EXTERN CGFloat const SENTopicCellTextY;
/** cell底部标签栏高度 */
UIKIT_EXTERN CGFloat const SENTopicCellBottomBarH;

/** cell中，允许图片显示的最大高度 */
UIKIT_EXTERN CGFloat const SENTopicCellPictureMaxH;
/** 图片超过最大高度时，所用的固定高度 */
UIKIT_EXTERN CGFloat const SENTopicCellPictureFixedH;
