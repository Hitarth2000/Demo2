//
//  ZoomableView.m
//  Demo2
//
//  Created by Glare51 on 11/8/13.
//  Copyright (c) 2013 Glare51. All rights reserved.
//

#import "ZoomableView.h"

#import <QuartzCore/QuartzCore.h>

@implementation ZoomableView

CGFloat myScale;

// Create a new TiledPDFView with the desired frame and scale.
- (id)initWithFrame:(CGRect)frame scale:(CGFloat)scale
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        CATiledLayer *tiledLayer = (CATiledLayer *)[self layer];
        /*
         levelsOfDetail and levelsOfDetailBias determine how the layer is rendered at different zoom levels. This only matters while the view is zooming, because once the the view is done zooming a new TiledPDFView is created at the correct size and scale.
         */
//        tiledLayer.levelsOfDetail = 4;
//        tiledLayer.levelsOfDetailBias = 3;
//        tiledLayer.tileSize = CGSizeMake(512.0, 512.0);
//        
//        myScale = scale;
    }
    return self;
}


// The layer's class should be CATiledLayer.
+ (Class)layerClass
{
    return [CATiledLayer class];
}


- (void)layoutSubviews
{
//    NSLog(@"layoutSubviews : %f %f",self.frame.size.width,self.frame.size.height);
    
    
//    for (UIView * view in self.subviews)
//    {
//        if([view isKindOfClass:[UIView class]])
//        {
//            NSLog(@"SubView : %f %f",view.frame.size.width,view.frame.size.height);
//            CGRect frame = view.frame;
//            frame.size.width = self.bounds.size.width;
//            frame.size.height = 50;
//            view.frame = frame;
//        }
//    }
}

//- (void)setTransformWithoutScaling:(CGAffineTransform)newTransform;
//{
//    [super setTransform:newTransform];
//}

//- (void)setTransform:(CGAffineTransform)newValue;
//{
//    [super setTransform:CGAffineTransformScale(newValue, 1.0f / _previousScale, 1.0f / _previousScale)];
//}


-(void)resize:(CGFloat)scale
{
    self.transform = CGAffineTransformMakeScale((1*scale)-250, (1*scale)-350);
    
    //[self layer].anchorPoint = CGPointMake(0.0f, 0.0f);
    
//    for(UIView * v in self.subviews)
//    {
//        if([v isKindOfClass:[UILabel class]])
//        {
//           //NSLog(@"Lable %f, %f",v.frame.size.width,v.frame.size.height);
//            [v setNeedsDisplay];
//            [(UILabel*)v adjustsFontSizeToFitWidth];
//        }
//    }
}

//- (void)drawRect:(CGRect)rect
//{
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    CGRect bounds = self.bounds;
//    bounds.size.width /= _scale;
//    bounds.size.height /= _scale;
//    
//    //
//    //    CGContextScaleCTM(ctx, scale, scale);
//    //
//    //    [[UIColor blackColor] set];
//    //
//    //    CGContextSetLineWidth(ctx, 3);
//    //    CGContextStrokeRect(ctx, CGRectInset(bounds, 1.5*scale, 1.5*scale));
//    
//    CGContextScaleCTM(ctx, bounds.size.width/_scale,bounds.size.height/_scale);
//    [@"Hello!" drawAtPoint:CGPointMake(0, 0) withFont:[UIFont systemFontOfSize:15]];
//}

@end
