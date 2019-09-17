//
//  RootCell.h
//  DKSTableCollcetionView
//
//  Created by aDu on 2017/10/10.
//  Copyright © 2017年 DuKaiShun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTableCell : UICollectionViewCell
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) NSArray *dataAry;
-(void)updateData;
@end
