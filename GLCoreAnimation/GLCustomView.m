//
//  GLCustomView.m
//  GLCoreAnimation
//
//  Created by hyq on 15/12/9.
//  Copyright © 2015年 Grey. All rights reserved.
//

#import "GLCustomView.h"
#import "GLCustomLayer.h"
@implementation GLCustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (id)initWithFrame:(CGRect)frame{
    NSLog(@"GLCustomView initWithFrame");
    if(self = [super initWithFrame:frame]){
        GLCustomLayer *layer = [[GLCustomLayer alloc]init];
        layer.bounds = CGRectMake(0, 0, 380, 380);
        layer.position = CGPointMake(190, 190);
        layer.backgroundColor = [UIColor blueColor].CGColor;
        
        
        [layer setNeedsDisplay];

        [self.layer addSublayer:layer];
        

    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    NSLog(@"GLCustomView drawRect");
    [super drawRect:rect];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    NSLog(@"GLCustomView drawLayer");
    [super drawLayer:layer inContext:ctx];
}

@end
