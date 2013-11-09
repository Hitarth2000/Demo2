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
    view.contentScaleFactor = scale;
    
    for (UIView * innerView in view.subviews)
    {
        innerView.contentScaleFactor = scale;
        //NSLog(@"Class :%@",innerView.class);
        
       if([innerView isKindOfClass:[UIView class]])
        for (UIView * inner in innerView.subviews)
        {
            inner.contentScaleFactor = scale;
        }
    }
    
    
    
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
//                              (int)(view1.frame.size.width * scaleTracker),
//                              (int)(view1.frame.size.height * scaleTracker));

//    viewMain.transform = CGAffineTransformIdentity;
//    viewMain.transform = CGAffineTransformScale(viewMain.transform ,scale, scale);

    
    
    
    
    [scroll setContentSize:CGSizeMake(scale*scroll.frame.size.width, scale*scroll.frame.size.height)];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
//    float zoom = scrollView.zoomScale;
//    NSLog(@"Zoom :%f",zoom);
    
    
//    for (UIView * innerView in viewMain.subviews)
//    {
//        if([innerView isKindOfClass:[ZoomableView class]])
//            [(ZoomableView*) innerView resize:scrollView.zoomScale];
//    }
    
//    NSLog(@"View1 W:%f & H:%f",view1.frame.size.width,view1.frame.size.height);
//    NSLog(@"mainView W:%f & H:%f",viewMain.frame.size.width,viewMain.frame.size.height);
   
}



- (IBAction) clickonButton :(id)sender
{
    NSLog(@"clickonButton");
}


@end
