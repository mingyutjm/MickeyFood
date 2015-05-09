//
//  SendOrder.m
//  SJFood
//
//  Created by 叶帆 on 15/3/28.
//  Copyright (c) 2015年 Ye Fan. All rights reserved.
//

#import "SendOrder.h"

@implementation SendOrder
@synthesize togetherDate,togetherId,address,adminName,price,isDiscount,discountPrice,message,reserveTime;

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init])
    {
        for (NSString *key in [dict allKeys])
        {
            NSString *value = [dict objectForKey:key];
            if([value isKindOfClass:[NSNumber class]])
                value = [NSString stringWithFormat:@"%@",value];
            else if([value isKindOfClass:[NSNull class]])
                value = @"";
            @try {
                [self setValue:value forKey:key];
            }
            @catch (NSException *exception) {
                NSLog(@"试图添加不存在的key:%@到实例:%@中.",key,NSStringFromClass([self class]));
            }
        }
    }
    return self;
}


@end
