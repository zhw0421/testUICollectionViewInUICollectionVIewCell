//
//  ZHWHorizontalCollectionViewCell.m
//  testUIcollectionViewInUIcollectionView
//
//  Created by Zhang,Hongwei(RM) on 2019/9/18.
//  Copyright © 2019 Zhang,Hongwei(RM). All rights reserved.
//

#import "ZHWHorizontalCollectionViewCell.h"
#import "UIResponder+Router.h"
#import "ZHWConsts.h"
@interface ZHWHorizontalCollectionViewCell ()

@end

@implementation ZHWHorizontalCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];
        [self addSubview:self.videoViewContainer];
        [self addSubview:self.nextEpisodeBtn];
        self.titleLabel.frame = CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 60);
    }
    return self;
}

- (void)setTextStr:(NSString *)textStr {
    if (_textStr != textStr) {
        _textStr = textStr;
        self.titleLabel.text = textStr;
    }
}

-(void)fillZHWBaseModel:(ZHWBaseModel *)model{
    self.model = model;
    NSString *textStr = [NSString stringWithFormat:@"x == %ld y == %ld",(long)self.model.coordinatesX,(long)self.model.coordinatesY];
    self.titleLabel.text = textStr;
    [_nextEpisodeBtn setTitle:@"下一集" forState:UIControlStateNormal];
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

-(UIButton *)nextEpisodeBtn{
    if (!_nextEpisodeBtn) {
        _nextEpisodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextEpisodeBtn setTitle:@"--" forState:UIControlStateNormal];
        [_nextEpisodeBtn setBackgroundColor:[UIColor blueColor]];
        _nextEpisodeBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 150)/2, ([UIScreen mainScreen].bounds.size.height - 80)/2, 150, 80);
        [_nextEpisodeBtn addTarget:self action:@selector(tapNextEpisodeBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextEpisodeBtn;
}

-(void)tapNextEpisodeBtn{
    [_nextEpisodeBtn routerWithEventName:ZHWForceScrollerNextEpisode userInfo:[NSDictionary dictionary]];
}

-(UIView *)videoViewContainer{
    if (!_videoViewContainer) {
        _videoViewContainer = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _videoViewContainer.backgroundColor = [UIColor grayColor];
    }
    return _videoViewContainer;
}

@end
