//
//  SubLable.m
//  Demo2
//
//  Created by Glare51 on 11/12/13.
//  Copyright (c) 2013 Glare51. All rights reserved.
//

#import "SubLable.h"
#import <QuartzCore/QuartzCore.h>

@implementation SubLable

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

+ (Class)layerClass
{
    return [CATiledLayer class];
}


@end
