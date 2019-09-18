//
//  ZHWVerticalCollectionViewCell.m
//  testUIcollectionViewInUIcollectionView
//
//  Created by Zhang,Hongwei(RM) on 2019/9/18.
//  Copyright © 2019 Zhang,Hongwei(RM). All rights reserved.
//

#import "ZHWVerticalCollectionViewCell.h"
#import "ZHWHorizontalCollectionViewCell.h"
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

-(void)updateData{
    [self.horizontalCollectionView reloadData];
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
    NSLog(@"zhw horizontalCollectionView的indexPath == %@",indexPath);
}

#pragma mark ====== UICollectionViewDelegate ======
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZHWHorizontalCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:K_Cell forIndexPath:indexPath];
    cell.textStr = [NSString stringWithFormat:@"%li",indexPath.row];
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
@end
