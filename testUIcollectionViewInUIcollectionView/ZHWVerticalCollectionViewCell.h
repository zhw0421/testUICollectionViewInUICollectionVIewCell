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

@property (nonatomic, strong) NSIndexPath *indexPath;

-(void)updateData;

@end

NS_ASSUME_NONNULL_END
