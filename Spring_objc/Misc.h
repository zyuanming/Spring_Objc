//
//  Misc.h
//  SpringApp
//
//  Created by ming on 15/2/9.
//  Copyright (c) 2015年 yooke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface Misc : NSObject

+ (CGFloat)degreesToRadians:(CGFloat)degrees;
+ (void)delay:(double)delay withAction:(void (^)(void))action;

@end


@interface NSString (Spring)

- (NSData *)htmlToAttributedString:(NSString *)text;

@end