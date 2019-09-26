//
//  UIResponder+Router.m
//  MinVideo
//
//  Created by Zhang,Hongwei(RM) on 2018/12/21.
//  Copyright © 2018年 Baidu. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)

- (void)routerWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    if (self.nextResponder) {
        [[self nextResponder] routerWithEventName:eventName userInfo:userInfo];
    }
}

@end
