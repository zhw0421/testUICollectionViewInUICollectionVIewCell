//
//  ZHWViewController.m
//  testUIcollectionViewInUIcollectionView
//
//  Created by Zhang,Hongwei(RM) on 2019/9/17.
//  Copyright © 2019 Zhang,Hongwei(RM). All rights reserved.
//

#import "ZHWViewController.h"
#import "ZHWVerticalCollectionViewCell.h"
#import "ZHWBaseModel.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ZHWViewController ()

@end

@implementation ZHWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.verticalCollectionView];
    [self initData];
    [self.verticalCollectionView reloadData];
}

-(void)initData{
    ZHWBaseModel *baseModel;
    NSMutableArray *arr;
    for (int i = 0; i < 10; i++) {
        arr = [NSMutableArray array];
        for (int j = 0; j < 3; j++) {
            baseModel = [[ZHWBaseModel alloc] init];
            baseModel.coordinatesX = j;
            baseModel.coordinatesY = i;
            [arr addObject:baseModel];
        }
        [self.dataArr addObject:arr];
    }
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
    NSArray *horizonArr = self.dataArr[indexPath.row];
    ZHWBaseModel *verticalModel = [horizonArr firstObject];
    NSLog(@"zhw 竖向滑动选中的verticalModel x== %ld y = %ld",(long)verticalModel.coordinatesX, verticalModel.coordinatesY);
}
#pragma mark -- UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArr.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


#pragma mark ZHWVerticalCollectionViewCellDelegate

-(void)scrollViewDidEndScrollSelectedModel:(ZHWBaseModel *)selectedModel{
    NSLog(@"zhw 横向滑动选中的horizonModelx== %ld y = %ld",selectedModel.coordinatesX,selectedModel.coordinatesY);
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"ZHWVerticalCollectionViewCell";
    ZHWVerticalCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    [cell updateData:self.dataArr[indexPath.row]];
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

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
@end
