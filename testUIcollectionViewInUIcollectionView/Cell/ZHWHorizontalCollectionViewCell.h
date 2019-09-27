//
//  ZHWHorizontalCollectionViewCell.h
//  testUIcollectionViewInUIcollectionView
//
//  Created by Zhang,Hongwei(RM) on 2019/9/18.
//  Copyright © 2019 Zhang,Hongwei(RM). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHWBaseModel.h"
#import "ZHWContentView.h"
#import "ZHWProgressView.h"
#import "ZHWSelectEpisodesView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZHWHorizontalCollectionViewCell : UICollectionViewCell

//视频的容器
@property (nonatomic, strong) UIView *videoViewContainer;

@property (nonatomic, strong) ZHWContentView *zhwContentView;

@property (nonatomic, strong) ZHWProgressView *zhwProgressView;

@property (nonatomic, strong) ZHWSelectEpisodesView *zhwSelectEpisodesView;

@property (nonatomic, copy) NSString *textStr;

@property (nonatomic, strong) ZHWBaseModel *model;

-(void)fillZHWBaseModel:(ZHWBaseModel *)model;


@end

NS_ASSUME_NONNULL_END
