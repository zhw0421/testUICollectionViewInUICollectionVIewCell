//
//  ZHWViewController.m
//  testUIcollectionViewInUIcollectionView
//
//  Created by Zhang,Hongwei(RM) on 2019/9/17.
//  Copyright © 2019 Zhang,Hongwei(RM). All rights reserved.
//

#import "ZHWViewController.h"
#import "ZHWVerticalCollectionViewCell.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ZHWViewController ()

@end

@implementation ZHWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.verticalCollectionView];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
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
    NSArray *indexPaths = [self.verticalCollectionView indexPathsForVisibleItems];
    NSIndexPath *indexPath = indexPaths.firstObject;
    NSLog(@"zhw verticalCollectionView的indexPath == %@",indexPath);
}
#pragma mark -- UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"ZHWVerticalCollectionViewCell";
    ZHWVerticalCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    [cell updateData];
    return cell;
}

-(UICollectionView *)verticalCollectionView{
    if (!_verticalCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionInset = UIEdgeInsetsZero;
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
        _verticalCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:layout];
        _verticalCollectionView.delegate = self;
        _verticalCollectionView.dataSource = self;
        _verticalCollectionView.pagingEnabled = YES;
        _verticalCollectionView.showsVerticalScrollIndicator = NO;
        _verticalCollectionView.scrollsToTop = NO;
        //注册Cell，必须要有
        [_verticalCollectionView registerClass:[ZHWVerticalCollectionViewCell class] forCellWithReuseIdentifier:@"ZHWVerticalCollectionViewCell"];
        _verticalCollectionView.backgroundColor = [UIColor whiteColor];
    }
    return _verticalCollectionView;
}

@end
