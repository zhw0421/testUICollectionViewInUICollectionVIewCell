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
        [self addSubview:self.videoViewContainer];
        [self addSubview:self.zhwContentView];
        [self addSubview:self.zhwProgressView];
        [self addSubview:self.zhwSelectEpisodesView];
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

-(ZHWContentView *)zhwContentView{
    if (!_zhwContentView) {
        _zhwContentView = [[ZHWContentView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _zhwContentView.backgroundColor = [UIColor clearColor];
    }
    return _zhwContentView;
}

-(ZHWProgressView *)zhwProgressView{
    if (!_zhwProgressView) {
        _zhwProgressView = [[ZHWProgressView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _zhwProgressView.backgroundColor = [UIColor clearColor];
        _zhwProgressView.hidden = YES;
    }
    return _zhwProgressView;
}

-(ZHWSelectEpisodesView *)zhwSelectEpisodesView{
    if (!_zhwSelectEpisodesView) {
        _zhwSelectEpisodesView = [[ZHWSelectEpisodesView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _zhwSelectEpisodesView.backgroundColor = [UIColor clearColor];
        _zhwSelectEpisodesView.hidden = YES;
    }
    return _zhwSelectEpisodesView;
}


@end
