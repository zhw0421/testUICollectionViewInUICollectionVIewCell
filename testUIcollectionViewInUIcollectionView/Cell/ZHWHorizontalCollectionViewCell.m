//
//  ZHWHorizontalCollectionViewCell.m
//  testUIcollectionViewInUIcollectionView
//
//  Created by Zhang,Hongwei(RM) on 2019/9/18.
//  Copyright © 2019 Zhang,Hongwei(RM). All rights reserved.
//

#import "ZHWHorizontalCollectionViewCell.h"
@interface ZHWHorizontalCollectionViewCell ()

@end

@implementation ZHWHorizontalCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];
        [self addSubview:self.videoViewContainer];
        [self addSubview:self.zhwContentView];
    }
    return self;
}

-(void)fillZHWBaseModel:(ZHWBaseModel *)model{
    self.model = model;
    
}

-(UIView *)videoViewContainer{
    if (!_videoViewContainer) {
        _videoViewContainer = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _videoViewContainer.backgroundColor = [UIColor grayColor];
    }
    return _videoViewContainer;
}

-(UIView *)zhwContentView{
    if (!_zhwContentView) {
        _zhwContentView = [[ZHWContentView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _zhwContentView.backgroundColor = [UIColor clearColor];
    }
    return _zhwContentView;
}


@end
