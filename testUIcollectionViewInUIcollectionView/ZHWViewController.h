//
//  ZHWViewController.h
//  testUIcollectionViewInUIcollectionView
//
//  Created by Zhang,Hongwei(RM) on 2019/9/17.
//  Copyright © 2019 Zhang,Hongwei(RM). All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHWViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    
}

@property (strong, nonatomic)UICollectionView *verticalCollectionView;

@end

NS_ASSUME_NONNULL_END
