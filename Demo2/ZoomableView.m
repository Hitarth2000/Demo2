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


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.originalFrame = frame;
        
        //CATiledLayer *tiledLayer = (CATiledLayer *)[self layer];
        /*
         levelsOfDetail and levelsOfDetailBias determine how the layer is rendered at different zoom levels. This only matters while the view is zooming, because once the the view is done zooming a new TiledPDFView is created at the correct size and scale.
         */
        
        //self.layer.borderColor = [UIColor blackColor].CGColor;
        //self.layer.borderWidth = 0.5f;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];

	if(self)
    {
        self.originalFrame = self.frame;
    }
	return self;
}


// The layer's class should be CATiledLayer.
+ (Class)layerClass
{
    return [CATiledLayer class];
}

//- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)context
//{
//    CGRect rect = CGContextGetClipBoundingBox(context);
//    [updatedRects addObject:[NSValue valueWithCGRect:rect]];
//
//    CGContextSaveGState(context);
//    CGContextTranslateCTM(context, rect.origin.x, rect.origin.y);
//    // ...draw into context...
//    CGContextRestoreGState(context);
//}


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


//-(void)resize:(CGFloat)scale
//{
//    self.transform = CGAffineTransformMakeScale((1*scale)-250, (1*scale)-350);
//
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
//}

- (void)drawRect:(CGRect)rect
{
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//
//    CGRect bounds = self.bounds;
//    bounds.size.width /= _scale;
//    bounds.size.height /= _scale;
//
//    CGContextScaleCTM(ctx, bounds.size.width/_scale,bounds.size.height/_scale);
//        [@"This is testing for just test the numberOfLines.!" drawAtPoint:CGPointMake(0, 0) withFont:[UIFont systemFontOfSize:15]];
//    
//    [self drawString:nil withFont:[UIFont systemFontOfSize:16] inRect:rect];
    
    // Parameters used for drawing.
    const CGFloat lineWidth = .5;
    const CGFloat spaceToBB = 0;   
    const CGFloat lineColor[4] = { 0, 0, 0, 1 };
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextSetStrokeColor(ctx, lineColor);
    //CGContextSetShadow(ctx, CGSizeMake(shadowOffset, shadowOffset), shadowBlur);
    
    CGRect innerRect = rect;
    
    innerRect.size.width -= 2*spaceToBB;
    innerRect.size.height -= 2*spaceToBB;
    innerRect.origin.x += spaceToBB;
    innerRect.origin.y += spaceToBB;
    
//    UIBezierPath *path =
//    [UIBezierPath bezierPathWithRoundedRect:innerRect
//                          byRoundingCorners:UIRectCornerAllCorners
//                                cornerRadii:CGSizeMake(0, 0)
//     ];
//    [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:0];
    
//    CGContextAddPath(ctx, path.CGPath);
//    CGContextStrokePath(ctx);
}

- (void) drawString: (NSString*) s withFont: (UIFont*) font inRect: (CGRect) contextRect
{
    /*
     Logic :1
     */
    
    //    CGFloat fontHeight = font.pointSize;
    //    CGFloat yOffset = (contextRect.size.height - fontHeight) / 2.0;
    //    CGRect textRect = CGRectMake(0, yOffset, contextRect.size.width, fontHeight);
    //    [s drawInRect: textRect withFont: font lineBreakMode: NSLineBreakByClipping  alignment: NSTextAlignmentCenter];
    
    
    /*
     Logic :2
     */
    NSString *text = @"A bit of text to drawA bit of text to draw.";
    CGSize size = [text sizeWithFont:font constrainedToSize:CGSizeMake(100, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    NSLog(@"Size :%f %f",size.width,size.height);

    CGRect textFrame = (CGRect)
    {
        .size.width = contextRect.size.width,
        .size.height = contextRect.size.height,
    };
    CGSize textSize = [text sizeWithFont:font constrainedToSize:textFrame.size lineBreakMode:NSLineBreakByWordWrapping];
    CGRect newTextFrame = CGRectInset(textFrame, 0, (textFrame.size.height - textSize.height) / 2);
    [text drawInRect:newTextFrame withFont:font lineBreakMode:NSLineBreakByWordWrapping alignment:NSTextAlignmentCenter];
    
}


@end
