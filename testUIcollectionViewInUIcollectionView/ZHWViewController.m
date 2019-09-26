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
    [self initData];
}

-(void)initData{
    ZHWBaseModel *baseModel;
    NSMutableArray *arr;
    for (int i = 0; i < 10; i++) {
        arr = [NSMutableArray array];
        for (int j = 0; j < 3; j++) {
            baseModel = [[ZHWBaseModel alloc] init];
            baseModel.desc = @"zhw";
            [arr addObject:baseModel];
        }
        [self.dataArr addObject:arr];
    }
    [self.verticalCollectionView reloadData];
    [self.verticalCollectionView layoutIfNeeded];
    [self resetContainerPlayerView:nil];
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
    ZHWHorizontalCollectionViewCell * cell = [self currentSelectedCell];
    ZHWBaseModel *model = cell.model;
    NSLog(@"zhw 竖向滑动 x== %ld y = %ld",(long)model.coordinatesX, model.coordinatesY);
    [self resetContainerPlayerView:nil];
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
//获取横向的当前的indexPath
-(void)horiziontalCellScrollViewDidEndScroll:(ZHWBaseModel *)baseModel{
    
    ZHWHorizontalCollectionViewCell * cell =[self currentSelectedCell];
    ZHWBaseModel *model = cell.model;
    NSLog(@"zhw 横向滑动 x== %ld y = %ld",(long)model.coordinatesX, model.coordinatesY);
    [self resetContainerPlayerView:nil];
    
}

-(void)horiziontalCellForItemAtIndexPath{
    //    [self resetContainerPlayerView];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"ZHWVerticalCollectionViewCell";
    ZHWVerticalCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    [cell updateData:self.dataArr[indexPath.row] verticalIndex:indexPath.row];
    [self resetContainerPlayerView:cell];
    return cell;
}
//
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
        [self.view addSubview:_verticalCollectionView];
    }
    return _verticalCollectionView;
}

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(UIView *)containerPlayerView{
    if (!_containerPlayerView) {
        _containerPlayerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [self.view insertSubview:_containerPlayerView aboveSubview:self.verticalCollectionView];
        _containerPlayerView.backgroundColor = [UIColor redColor];
    }
    return _containerPlayerView;
}

-(ZHWHorizontalCollectionViewCell *)currentSelectedCell{
    CGPoint centerPoint = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    NSArray * verticalVisibleCells = [self.verticalCollectionView visibleCells];
    ZHWVerticalCollectionViewCell *verticalCell;
    for (ZHWVerticalCollectionViewCell *cell  in verticalVisibleCells) {
        CGRect verticalCellFrame = [self.verticalCollectionView convertRect:cell.frame toView:[self.verticalCollectionView superview]];
        if (CGRectContainsPoint(verticalCellFrame, centerPoint)) {
            verticalCell = cell;
            break;
        }
    }
    return [self currentHorizontalCell:verticalCell];
}

//获取当前选中的Cell
-(ZHWHorizontalCollectionViewCell *)currentHorizontalCell:(ZHWVerticalCollectionViewCell *)verticalCell{
//    ZHWHorizontalCollectionViewCell *horizontalCell;
//    NSArray * horizontalVisibleCells = [verticalCell.horizontalCollectionView visibleCells];
//    for (ZHWHorizontalCollectionViewCell *cell  in horizontalVisibleCells) {
//        if (cell.model && cell.model.isSelectedModel) {
//            horizontalCell = cell;
//            break;
//        }
//    }
    CGPoint centerPoint = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
      NSArray * cells = [verticalCell.horizontalCollectionView visibleCells];
      ZHWHorizontalCollectionViewCell *testCell;
      for (ZHWHorizontalCollectionViewCell *cell  in cells) {
          CGRect frame = [verticalCell.horizontalCollectionView convertRect:cell.frame toView:[verticalCell.horizontalCollectionView superview]];
          if (CGRectContainsPoint(frame, centerPoint)) {
              testCell = cell;
              break;
          }
      }
    
    return testCell;
}
//重置播放器的View到当前View
-(void)resetContainerPlayerView:(ZHWVerticalCollectionViewCell *)currentVerticalCell{
    ZHWHorizontalCollectionViewCell * cell;
    if (currentVerticalCell) {
        cell = [self currentHorizontalCell:currentVerticalCell];
    }else{
        cell = [self currentSelectedCell];
    }
    if (!cell) {
        return;
    }
    if([self.containerPlayerView superview]){
        if ([self.containerPlayerView superview] != cell.videoViewContainer) {
            [self.containerPlayerView removeFromSuperview];
            [cell.videoViewContainer addSubview:self.containerPlayerView];
        }
    }else{
        [cell.videoViewContainer addSubview:self.containerPlayerView];
    }
}
@end
