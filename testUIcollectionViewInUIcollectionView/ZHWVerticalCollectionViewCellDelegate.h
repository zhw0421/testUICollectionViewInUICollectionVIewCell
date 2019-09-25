//
//  ZHWVerticalCollectionViewCellDelegate.h
//  testUIcollectionViewInUIcollectionView
//
//  Created by Zhang,Hongwei(RM) on 2019/9/25.
//  Copyright © 2019 Zhang,Hongwei(RM). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHWBaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol ZHWVerticalCollectionViewCellDelegate <NSObject>

- (void)scrollViewDidEndScrollSelectedModel:(ZHWBaseModel *)selectedModel;


@end

NS_ASSUME_NONNULL_END
