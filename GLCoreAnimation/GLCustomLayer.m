//
//  GLCustomLayer.m
//  GLCoreAnimation
//
//  Created by hyq on 15/12/9.
//  Copyright © 2015年 Grey. All rights reserved.
//

#import "GLCustomLayer.h"

@implementation GLCustomLayer
- (void)drawInContext:(CGContextRef)ctx{
    NSLog(@"custom layer");
    
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);
    
    CGContextMoveToPoint(ctx, 20, 20);
    CGContextAddLineToPoint(ctx,80, 20);
    CGContextAddLineToPoint(ctx,80, 80);
    CGContextAddLineToPoint(ctx,20, 80);
    CGContextAddLineToPoint(ctx,20, 20);

    CGContextDrawPath(ctx, kCGPathFillStroke);
    
}
@end
