//
//  UIResponder+Router.h
//  MinVideo
//
//  Created by Zhang,Hongwei(RM) on 2018/12/21.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (Router)
- (void)routerWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;
@end

NS_ASSUME_NONNULL_END
