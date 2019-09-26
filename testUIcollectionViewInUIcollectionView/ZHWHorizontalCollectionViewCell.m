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
        self.titleLabel.frame = CGRectMake(0, ([UIScreen mainScreen].bounds.size.height - 60)/2, [UIScreen mainScreen].bounds.size.width, 60);
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
    NSString *textStr = [NSString stringWithFormat:@"x == %li y == %li",self.model.coordinatesX,self.model.coordinatesY];
    self.titleLabel.text = textStr;
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

-(UIView *)videoViewContainer{
    if (!_videoViewContainer) {
        _videoViewContainer = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _videoViewContainer.backgroundColor = [UIColor grayColor];
    }
    return _videoViewContainer;
}

@end
