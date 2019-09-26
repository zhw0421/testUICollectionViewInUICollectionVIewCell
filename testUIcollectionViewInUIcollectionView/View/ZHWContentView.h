//
//  ZHWContentView.h
//  testUIcollectionViewInUIcollectionView
//
//  Created by Zhang,Hongwei(RM) on 2019/9/26.
//  Copyright © 2019 Zhang,Hongwei(RM). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHWBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZHWContentView : UIView

@property (nonatomic, strong) UIButton *nextEpisodeBtn;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) ZHWBaseModel *model;

-(void)fillContentViewModel:(ZHWBaseModel *)model;

@end

NS_ASSUME_NONNULL_END
