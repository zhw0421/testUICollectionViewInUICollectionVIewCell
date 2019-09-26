//
//  ZHWVerticalCollectionViewCellDelegate.h
//  testUIcollectionViewInUIcollectionView
//
//  Created by Zhang,Hongwei(RM) on 2019/9/25.
//  Copyright © 2019 Zhang,Hongwei(RM). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHWBaseModel.h"
#import "ZHWHorizontalCollectionViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@protocol ZHWVerticalCollectionViewCellDelegate <NSObject>

- (void)horiziontalCellScrollViewDidEndScroll;

//执行cellforrow返回的Cell
- (void)horiziontalCellForItemAtIndexPath;

@end

NS_ASSUME_NONNULL_END
