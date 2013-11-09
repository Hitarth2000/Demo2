//
//  SCView.m
//  Demo2
//
//  Created by Glare51 on 11/9/13.
//  Copyright (c) 2013 Glare51. All rights reserved.
//

#import "SCView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SCView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (void)layoutSubviews
{
//    NSLog(@"SCView layoutSubviews %f",self.zoomScale);
//    CGAffineTransform transform = CGAffineTransformMakeScale(1.0/self.zoomScale, 1.0/self.zoomScale);
//    
//    for(UIView *view in self.subviews)
//    {
//        //view.transform = transform;
//        self.layer.sublayerTransform = CATransform3DMakeAffineTransform(transform);
//    }
}

@end
