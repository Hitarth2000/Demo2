//
//  ViewController.m
//  Demo2
//
//  Created by Glare51 on 11/2/13.
//  Copyright (c) 2013 Glare51. All rights reserved.
//

#import "ViewController.h"


#define FONT_HEIGHT_SMALL     15
#define FONT_HEIGHT_MIDIUM    20
#define FONT_HEIGHT_BIG       25


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _booth = [[BoothVC alloc] initWithNibName:@"BoothVC" bundle:nil];
    
    scroll.scrollEnabled = YES;
    scroll.minimumZoomScale=1;
    scroll.maximumZoomScale=10;
    [scroll setContentSize:CGSizeMake(scroll.frame.size.width , scroll.frame.size.height)];
    scroll.delegate=self;
    
    
    _arrayTitles = [[NSMutableArray alloc] initWithObjects:
                    @"Booth 1.",
                    @"Booth 2 Booth 2.",
                    @"Booth 3 Booth 3 Booth 3.",
                    @"Booth 4 Booth 4 Booth 4 Booth 4.",
                    @"Booth 5 Booth 5 Booth 5 Booth 5 Booth 5.",
                    @"Booth 6 Booth 6 Booth 6 Booth 6 Booth 6 Booth 6.",
                    @"Booth 7 Booth 7 Booth 7 Booth 7 Booth 7 Booth 7 Booth 7.",
                    @"Booth 8 Booth 8 Booth 8 Booth 8 Booth 8 Booth 8 Booth 8 Booth 8.",
                    @"Booth 9 Booth 9 Booth 9 Booth 9 Booth 9 Booth 9 Booth 9 Booth 9 Booth 9.",
                    @"Booth 10 Booth 10 Booth 10 Booth 10 Booth 10 Booth 10 Booth 10 Booth 10 Booth 10.",
                    nil];
    
   _arrayViews = [NSMutableArray arrayWithCapacity:1];
   [_arrayViews addObject:[NSValue valueWithCGRect:CGRectMake(5,5,50,50)]];
   [_arrayViews addObject:[NSValue valueWithCGRect:CGRectMake(60,5,80,80)]];
   [_arrayViews addObject:[NSValue valueWithCGRect:CGRectMake(150,5,50,100)]];
   [_arrayViews addObject:[NSValue valueWithCGRect:CGRectMake(210,5,30,40)]];
   [_arrayViews addObject:[NSValue valueWithCGRect:CGRectMake(10,110,80,100)]];
   [_arrayViews addObject:[NSValue valueWithCGRect:CGRectMake(100,110,30,90)]];
   [_arrayViews addObject:[NSValue valueWithCGRect:CGRectMake(140,110,50,50)]];
   [_arrayViews addObject:[NSValue valueWithCGRect:CGRectMake(200,110,40,150)]];
   [_arrayViews addObject:[NSValue valueWithCGRect:CGRectMake(10,270,100,70)]];
   [_arrayViews addObject:[NSValue valueWithCGRect:CGRectMake(120,270,120,70)]];
    
    
    
    for (int i=0; i< _arrayViews.count; i++)
    {
        UILongPressGestureRecognizer    * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        longPress.delegate = self;
        longPress.minimumPressDuration = 1;
        
        UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerTap:)];
        twoFingerTap.delegate = self;
        [twoFingerTap setNumberOfTapsRequired:2];
        
        // manage View
        CGRect frame = [[_arrayViews objectAtIndex:i] CGRectValue];
        ZoomableView * inView = [[ZoomableView alloc] initWithFrame:frame];
        inView.userInteractionEnabled = TRUE;
        inView.autoresizesSubviews = FALSE;
        inView.backgroundColor = [UIColor grayColor];
        inView.tag = i+1;
        
        // manage lbl
        SubLable * lblTitle = [[SubLable alloc] initWithFrame:CGRectMake(0, 0, inView.frame.size.width, inView.frame.size.height)];
        lblTitle.text = [_arrayTitles objectAtIndex:i];
        lblTitle.textColor = [UIColor blackColor];
        lblTitle.backgroundColor = [UIColor clearColor];
        lblTitle.font = [UIFont systemFontOfSize:FONT_HEIGHT_SMALL];
        lblTitle.numberOfLines = 0;
        lblTitle.textAlignment = NSTextAlignmentCenter;
        lblTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        lblTitle.userInteractionEnabled = FALSE;
        [inView addSubview:lblTitle];
        
        [inView addGestureRecognizer:longPress];
        [inView addGestureRecognizer:twoFingerTap];
        
        [self titleVisibility:lblTitle];
        [viewMain addSubview:inView];
    }
    
}
- (void)viewDidAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark
#pragma mark    Guesture methods

- (void)handleTwoFingerTap:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@" handleTwoFingerTap ");
    
//    UIView * v = gestureRecognizer.view;
//    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Bootn No:%d",v.tag]
//                                                     message:nil
//                                                    delegate:self
//                                           cancelButtonTitle:@"Dismiss"
//                                           otherButtonTitles:nil, nil];
//    [alert show];
    
    
   
    CGRect frame = self.view.bounds;
    frame.size.width = self.view.bounds.size.width - 20;
    frame.size.height = self.view.bounds.size.height - 20;
    frame.origin.x = 10;
    frame.origin.y = 10;
    
    _booth.view.frame = frame;
    _booth.view.layer.borderColor = [UIColor blackColor].CGColor;
    _booth.view.layer.borderWidth = 1;
    
    [self.view addSubview:_booth.view];
    
    _booth.view.alpha = 0;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.5];
    [_booth.view setAlpha:1.0];
    [UIView commitAnimations];
    
//    float newScale = [scroll zoomScale] / 1;
//    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
//    [viewMain zoomToRect:zoomRect animated:YES];
}

- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{
    NSLog(@" handleLongPress ");
    UIView * touchView = (UIView*) gestureRecognizer.view;
    
    for(UIView * view in viewMain.subviews)
    {
        [view setBackgroundColor:[UIColor lightGrayColor]];
    }
    
    touchView.backgroundColor = [UIColor redColor];
    
    
    /*
     Logic to add "You are here Lable" during long press event
     */
    for(UIView * view in viewMain.subviews)
        if([view isKindOfClass:[UILabel class]])
            [view removeFromSuperview];

    CGRect frame;
    frame.origin.x = touchView.frame.origin.x+(touchView.frame.size.width-100)/2;//viewMain.frame.origin.x +
    frame.origin.y =touchView.frame.origin.y+touchView.frame.size.height;//viewMain.frame.origin.y +
    frame.size.width = 100;
    frame.size.height = 21;

    UILabel * lblTest = [[UILabel alloc] initWithFrame:frame];
    lblTest.text = @"You are here.";
    lblTest.font = [UIFont systemFontOfSize:12];
    lblTest.numberOfLines = 0;
    lblTest.backgroundColor = [UIColor yellowColor];
    lblTest.textColor = [UIColor blackColor];
    lblTest.textAlignment = NSTextAlignmentCenter;
    [viewMain addSubview:lblTest];
    
}



#pragma mark
#pragma mark    ScrollView Delegate


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return viewMain;
}


- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
//    NSLog(@"Scale :%f",scale);
//    view.contentScaleFactor = scale;
// 
//     for (UIView * innerView in view.subviews)
//     {
//         innerView.contentScaleFactor = scale;
//         if([innerView isKindOfClass:[UIView class]])
//         for (UIView * inner in innerView.subviews)
//         {
//             inner.contentScaleFactor = scale;
//         }
//     }
    
    
    
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
//    float zoomScale = scale;
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
    
    
    
    /*
     Logic :7 dynamica manage all view + lable
     */
    for (UIView * subView in viewMain.subviews)
    {
        //float xPosition ,yPosition;
        if([subView isKindOfClass:[ZoomableView class]])
        {
            /*
            subView.layer.borderWidth = 0.5;
            subView.bounds = CGRectMake(subView.bounds.origin.x,subView.bounds.origin.y,
                                        subView.bounds.size.width*zoomScale, subView.bounds.size.height*zoomScale);
            subView.layer.affineTransform = CGAffineTransformMakeScale(1.0/zoomScale, 1.0/zoomScale);
            */
            
            subView.layer.borderWidth = 1.0/scale;
            
            //xPosition = subView.frame.origin.x;
            //yPosition = subView.frame.origin.y;
            [self reScaleLable:subView];
        }
        
        // manage "You are here" lable
        if([subView isKindOfClass:[UILabel class]])
        {
            NSLog(@"Frame :%f %f",subView.frame.origin.x,subView.frame.origin.y);
            NSLog(@"Bound :%f %f",subView.bounds.origin.x,subView.bounds.origin.y);
            
//            CGRect frame;
//            frame.origin.x = xPosition * scale;
//            frame.origin.y = yPosition * scale;
//            frame.size.width = 100;
//            frame.size.height = 21;
            //subView.frame = frame;
            
            subView.bounds = CGRectMake(subView.frame.origin.x,
                                        subView.frame.origin.y,
                                        100,
                                        21);
            subView.layer.affineTransform = CGAffineTransformMakeScale(1.0/scale, 1.0/scale);
        }
    }
    
    
    
    
    
    
    [scroll setContentSize:CGSizeMake(scale * scroll.frame.size.width, scale * scroll.frame.size.height)];
    
//    NSLog(@"View1 W:%f & H:%f",view1.frame.size.width,view1.frame.size.height);
//    NSLog(@"mainView W:%f & H:%f",viewMain.frame.size.width,viewMain.frame.size.height);
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
//    float zoom = scrollView.zoomScale;
//    
//    for (UIView * innerView in viewMain.subviews)
//    {
//        if([innerView isKindOfClass:[ZoomableView class]])
//            [self adjustZoomableView:(ZoomableView *)innerView toZoomScale:zoom];
//        
//    }
    
}

#pragma mark
#pragma mark    Custom methods


- (void)adjustZoomableView:(ZoomableView *)zoomableView toZoomScale:(float)zoomScale
{
    zoomableView.bounds = CGRectMake(0, 0,
                                     (zoomableView.originalFrame.size.width*zoomScale),
                                     (zoomableView.originalFrame.size.height*zoomScale));
    zoomableView.layer.affineTransform = CGAffineTransformMakeScale(1.0/zoomScale, 1.0/zoomScale);
}

- (void) reScaleLable : (UIView*) view
{
    for (UIView * inView in view.subviews)
    {
        if([inView isKindOfClass:[SubLable class]])
        {
            [self rearangeLable:(SubLable*)inView];
        }
    }
}

- (void) rearangeLable : (SubLable*) lblTitle
{
    float zoomScale = scroll.zoomScale;
    
    
    if (zoomScale > 2.0 && zoomScale <=4.0)
        lblTitle.font = [UIFont systemFontOfSize:FONT_HEIGHT_MIDIUM];
    else if (zoomScale > 4.0)
        lblTitle.font = [UIFont systemFontOfSize:FONT_HEIGHT_BIG];
    else
        lblTitle.font = [UIFont systemFontOfSize:FONT_HEIGHT_SMALL];
    
    
    lblTitle.bounds = CGRectMake(lblTitle.frame.origin.x,
                                 lblTitle.frame.origin.y,
                                 lblTitle.frame.size.width*zoomScale,
                                 lblTitle.frame.size.height*zoomScale);
    lblTitle.layer.affineTransform = CGAffineTransformMakeScale(1.0/zoomScale, 1.0/zoomScale);
    
    [self titleVisibility:lblTitle];

}

- (void) titleVisibility : (SubLable*) titleLable
{
    float zoomScale = scroll.zoomScale;
    CGRect zoomFrame = titleLable.frame;
    zoomFrame.size.width = titleLable.frame.size.width*zoomScale;
    zoomFrame.size.height = titleLable.frame.size.height*zoomScale;
    
    NSString * title = titleLable.text;
    CGSize size = [title sizeWithFont:titleLable.font
                    constrainedToSize:CGSizeMake(zoomFrame.size.width,MAXFLOAT)
                        lineBreakMode:NSLineBreakByWordWrapping];
    
    if (size.height <= zoomFrame.size.height)
        titleLable.hidden = FALSE;
    else
        titleLable.hidden = TRUE;
}


@end
