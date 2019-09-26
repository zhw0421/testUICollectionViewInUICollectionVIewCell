//
//  ZHWContentView.m
//  testUIcollectionViewInUIcollectionView
//
//  Created by Zhang,Hongwei(RM) on 2019/9/26.
//  Copyright © 2019 Zhang,Hongwei(RM). All rights reserved.
//

#import "ZHWContentView.h"
#import "UIResponder+Router.h"
#import "ZHWConsts.h"

@implementation ZHWContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.nextEpisodeBtn];
        [self addSubview:_titleLabel];
    }
    return self;
}

-(void)fillContentViewModel:(ZHWBaseModel *)model{
    self.model = model;
    NSString *textStr = [NSString stringWithFormat:@"x == %ld y == %ld",(long)self.model.coordinatesX,(long)self.model.coordinatesY];
    self.titleLabel.text = textStr;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:18];
        self.titleLabel.frame = CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 60);

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
        [_nextEpisodeBtn setTitle:@"下一集" forState:UIControlStateNormal];

    }
    return _nextEpisodeBtn;
}

-(void)tapNextEpisodeBtn{
    [_nextEpisodeBtn routerWithEventName:ZHWForceScrollerNextEpisode userInfo:[NSDictionary dictionary]];
}

@end
