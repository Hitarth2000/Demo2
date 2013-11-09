//
//  ZoomableView.h
//  Demo2
//
//  Created by Glare51 on 11/8/13.
//  Copyright (c) 2013 Glare51. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZoomableView : UIView
{
    BOOL twoFingerTapIsPossible,multipleTouches;
    
    
    
}

@property (nonatomic, assign) float previousScale;
@property (nonatomic, assign) float scale;

- (void)setTransformWithoutScaling:(CGAffineTransform)newTransform;


-(void)resize:(CGFloat)scale;


@end
