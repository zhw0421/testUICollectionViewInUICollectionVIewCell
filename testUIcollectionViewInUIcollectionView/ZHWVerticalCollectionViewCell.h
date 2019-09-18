//
//  ZHWVerticalCollectionViewCell.h
//  testUIcollectionViewInUIcollectionView
//
//  Created by Zhang,Hongwei(RM) on 2019/9/18.
//  Copyright © 2019 Zhang,Hongwei(RM). All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHWVerticalCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UICollectionView *horizontalCollectionView;

@property (nonatomic, strong) NSIndexPath *verticalIndexPath;

@property (strong, nonatomic) NSMutableArray *horizontalDataArr;

-(void)updateData:(NSMutableArray *)horizontalDataArr;

@end

NS_ASSUME_NONNULL_END
