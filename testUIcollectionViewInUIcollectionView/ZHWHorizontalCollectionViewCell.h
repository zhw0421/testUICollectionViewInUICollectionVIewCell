//
//  ZHWHorizontalCollectionViewCell.h
//  testUIcollectionViewInUIcollectionView
//
//  Created by Zhang,Hongwei(RM) on 2019/9/18.
//  Copyright © 2019 Zhang,Hongwei(RM). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHWBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHWHorizontalCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel;
//视频的容器
@property (nonatomic, strong) UIView *videoViewContainer;

@property (nonatomic, copy) NSString *textStr;

@property (nonatomic, strong) ZHWBaseModel *model;

-(void)fillZHWBaseModel:(ZHWBaseModel *)model;


@end

NS_ASSUME_NONNULL_END
