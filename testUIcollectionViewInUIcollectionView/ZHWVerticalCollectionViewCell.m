//
//  ZHWVerticalCollectionViewCell.m
//  testUIcollectionViewInUIcollectionView
//
//  Created by Zhang,Hongwei(RM) on 2019/9/18.
//  Copyright © 2019 Zhang,Hongwei(RM). All rights reserved.
//

#import "ZHWVerticalCollectionViewCell.h"
#import "ZHWHorizontalCollectionViewCell.h"
#import "ZHWBaseModel.h"

#define K_Cell @"ZHWHorizontalCollectionViewCell"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ZHWVerticalCollectionViewCell ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation ZHWVerticalCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.horizontalCollectionView];
        self.horizontalCollectionView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

-(void)updateData:(NSMutableArray *)horizontalDataArr verticalIndex :(NSInteger)verticalIndex{
    self.horizontalDataArr = horizontalDataArr;
    self.verticalIndex = verticalIndex;
    [self.horizontalCollectionView reloadData];
    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    ZHWBaseModel *selectBaseModel;
    for (int i = 0 ;i<self.horizontalDataArr.count;i++) {
        ZHWBaseModel *baseModel = self.horizontalDataArr[i];
        if (baseModel.isSelectedModel) {
            scrollIndexPath = [NSIndexPath indexPathForRow:baseModel.coordinatesX inSection:0];
            selectBaseModel = baseModel;
        }
        baseModel.coordinatesY = verticalIndex;
        baseModel.coordinatesX = i;

    }
    if (!selectBaseModel) {
        selectBaseModel = self.horizontalDataArr[scrollIndexPath.row];
        selectBaseModel.isSelectedModel = YES;
    }
    [self.horizontalCollectionView scrollToItemAtIndexPath:scrollIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        // 停止类型3
        BOOL dragToDragStop = scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
        if (dragToDragStop) {
            [self scrollViewDidEndScroll];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    BOOL scrollToScrollStop = !scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
    if (scrollToScrollStop) {
        [self scrollViewDidEndScroll];
    }
}

#pragma mark -- scrollViewDidEndScroll 获取当前选中的item
-(void)scrollViewDidEndScroll{
    NSArray *indexPaths = [self.horizontalCollectionView indexPathsForVisibleItems];
    NSIndexPath *indexPath = indexPaths.firstObject;
    ZHWBaseModel *selectedModel = self.horizontalDataArr[indexPath.row];
    for (ZHWBaseModel *baseModel in self.horizontalDataArr) {
        if ([baseModel isEqual:selectedModel]) {
            baseModel.isSelectedModel = YES;
        }else{
            baseModel.isSelectedModel = NO;
        }
    }
    if (_delegate && [_delegate conformsToProtocol:@protocol(ZHWVerticalCollectionViewCellDelegate)] && [_delegate respondsToSelector:@selector(horiziontalCellScrollViewDidEndScroll:)]) {
        [_delegate horiziontalCellScrollViewDidEndScroll:selectedModel];
    }
}

#pragma mark ====== UICollectionViewDelegate ======
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.horizontalDataArr.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZHWHorizontalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:K_Cell forIndexPath:indexPath];
    ZHWBaseModel *baseModel = self.horizontalDataArr[indexPath.row];
    [cell fillZHWBaseModel:baseModel];
    [self.delegate horiziontalCellForItemAtIndexPath];
    return cell;
}

- (UICollectionView *)horizontalCollectionView {
    if (!_horizontalCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsZero;
        layout.sectionInset = UIEdgeInsetsZero;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
        _horizontalCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _horizontalCollectionView.delegate = self;
        _horizontalCollectionView.dataSource = self;
        _horizontalCollectionView.pagingEnabled = YES;
        _horizontalCollectionView.showsHorizontalScrollIndicator = NO;
        _horizontalCollectionView.scrollsToTop = NO;
        [_horizontalCollectionView registerClass:[ZHWHorizontalCollectionViewCell class] forCellWithReuseIdentifier:K_Cell];
        _horizontalCollectionView.backgroundColor = [UIColor whiteColor];
    }
    return _horizontalCollectionView;
}

-(NSMutableArray *)horizontalDataArr{
    if (!_horizontalDataArr) {
        _horizontalDataArr = [NSMutableArray array];
    }
    return _horizontalDataArr;
}

@end
