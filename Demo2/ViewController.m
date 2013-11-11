//
//  ViewController.m
//  Demo2
//
//  Created by Glare51 on 11/2/13.
//  Copyright (c) 2013 Glare51. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    scroll.scrollEnabled = YES;
    scroll.minimumZoomScale=1;
    scroll.maximumZoomScale=15;
    [scroll setContentSize:CGSizeMake(scroll.frame.size.width , scroll.frame.size.height)];
    scroll.delegate=self;
    
    btn.titleLabel.numberOfLines = 0;
    
    
    
    
    scaleTracker=1;
//     UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerTap:)];
//    [twoFingerTap setNumberOfTouchesRequired:2];
//    [viewMain addGestureRecognizer:twoFingerTap];
}

- (void)handleTwoFingerTap:(UIGestureRecognizer *)gestureRecognizer
{
    // two-finger tap zooms out
//    float newScale = [scroll zoomScale] / ZOOM_STEP;
//    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
//    [viewMain zoomToRect:zoomRect animated:YES];
    
    
}



- (void)viewDidAppear:(BOOL)animated
{
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return viewMain;
}


- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
//    NSLog(@"Scale :%f",scale);
//    view.contentScaleFactor = scale;
//    
//    for (UIView * innerView in view.subviews)
//    {
//        innerView.contentScaleFactor = scale;
//        //NSLog(@"Class :%@",innerView.class);
//        
//       if([innerView isKindOfClass:[UIView class]])
//        for (UIView * inner in innerView.subviews)
//        {
//            inner.contentScaleFactor = scale;
//        }
//    }
    
    
    
    /*
     * Logic :2  
     *  If i add UILable manually than UILable size become big that its superview (view1). I think it happend because its super view already zoom.
     *  
     *
     */
    
    /*
     UILabel * lblTest = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, (view1.frame.size.width * scale)-10, (view.frame.size.height*scale)-10)];
    lblTest.text = @"abcdefghijklmnopqrstuvwxyz.";
    lblTest.font = [UIFont boldSystemFontOfSize:30];
    lblTest.numberOfLines = 0;
    lblTest.backgroundColor = [UIColor redColor];
    
    CGSize size = [lblTest.text sizeWithFont:lblTest.font
                           constrainedToSize:CGSizeMake(lblTest.frame.size.width, MAXFLOAT)
                               lineBreakMode:NSLineBreakByWordWrapping];
    for (UIView * innerView in view1.subviews)
    {
        [innerView removeFromSuperview];
    }
//    if (size.height <= view1.frame.size.height)
//        lblTest.hidden = FALSE;
//    else
//        lblTest.hidden = TRUE;
    NSLog(@"Lable W:%f & H:%f",lblTest.frame.size.width,lblTest.frame.size.height);
    [view1 addSubview:lblTest];
     */
    
    

    /*
     * Logic :3
     *
     *  Same as Logic:2 .When i manually set view1 frame it size become more than it superview (viewMain).
     */
    
//    scaleTracker *= scale;
//    [view1 setTransform:CGAffineTransformIdentity];
//    
//    view1.frame = CGRectMake((int)view1.frame.origin.x,
//                              (int)view1.frame.origin.y,
//                              (int)(view1.frame.size.width * scale)-20,
//                              (int)(view1.frame.size.height * scale)-20);
//    viewMain.transform = CGAffineTransformIdentity;
//    viewMain.transform = CGAffineTransformScale(viewMain.transform ,scale, scale);
//    viewMain.layer.contents = nil;
//    [viewMain setNeedsDisplayInRect:viewMain.layer.bounds];
    
    
    /*
      Logic :4
     */
//    NSString * test = lbl.text;
//    float wh = 90* scale;
//    CGSize size = [test sizeWithFont:[UIFont systemFontOfSize:12]
//                       constrainedToSize:CGSizeMake(90*scale, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
//    for(UIView * vw in view1.subviews)
//        [vw removeFromSuperview];
//    
//    UILabel * lblTest = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 90*scale,90*scale)];
//    lblTest.text = test;
//    lblTest.font = [UIFont systemFontOfSize:12];
//    lblTest.numberOfLines = 0;
//    lblTest.backgroundColor = [UIColor redColor];
//    lblTest.adjustsFontSizeToFitWidth = FALSE;
//    if (size.height <= wh)
//    {
//        [view1 addSubview:lblTest];
//    }
//    else
//    {
//        for(UIView * vw in view1.subviews)
//            [vw removeFromSuperview];
//    }
    
    
    /*
     Logic :5
     */
//    lbl.bounds = CGRectMake(5, 5, 90*zoomScale, 90*zoomScale);
//    lbl.layer.affineTransform = CGAffineTransformMakeScale(1.0/zoomScale, 1.0/zoomScale);
    
    /*
     Logic :6
     */
    
//    CATextLayer *label = [[CATextLayer alloc] init];
//    [label setFontSize:16];
//    [label setFrame:CGRectMake(5, 5, 90, 90)];
//    [label setString:@"Hello"];
//    [label setAlignmentMode:kCAAlignmentCenter];
//    [label setForegroundColor:[[UIColor blackColor] CGColor]];
//    lbl.backgroundColor = [UIColor redColor];
//    [view1.layer addSublayer:label];
    
    [scroll setContentSize:CGSizeMake(scale*scroll.	frame.size.width, scale*scroll.frame.size.height)];
    
//    NSLog(@"View1 W:%f & H:%f",view1.frame.size.width,view1.frame.size.height);
    NSLog(@"mainView W:%f & H:%f",viewMain.frame.size.width,viewMain.frame.size.height);
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    float zoom = scrollView.zoomScale;
    
    for (UIView * innerView in viewMain.subviews)
    {
        if([innerView isKindOfClass:[ZoomableView class]]) {
            [self adjustZoomableView:(ZoomableView *)innerView toZoomScale:zoom];
        } 
    }
    
    
}

- (void)adjustZoomableView:(ZoomableView *)zoomableView toZoomScale:(float)zoomScale
{
    zoomableView.bounds = CGRectMake(0, 0,
                                     floor(zoomableView.originalFrame.size.width*zoomScale),
                                     floor(zoomableView.originalFrame.size.height*zoomScale));
    zoomableView.layer.affineTransform = CGAffineTransformMakeScale(1.0/zoomScale, 1.0/zoomScale);
}

- (IBAction) clickonButton :(id)sender
{
    NSLog(@"clickonButton");
}


@end
