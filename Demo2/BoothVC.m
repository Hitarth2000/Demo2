//
//  BoothVC.m
//  Demo2
//
//  Created by Glare51 on 11/12/13.
//  Copyright (c) 2013 Glare51. All rights reserved.
//

#import "BoothVC.h"
#import "TickleGestureRecognizer.h"
#import <QuartzCore/QuartzCore.h>

@interface BoothVC ()

@end

@implementation BoothVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    scroll.scrollEnabled = YES;
    scroll.minimumZoomScale=1;
    scroll.maximumZoomScale=10;
    [scroll setContentSize:CGSizeMake(scroll.frame.size.width , scroll.frame.size.height)];
    scroll.delegate=self;
    
    for (UIView * view in viewMain.subviews)
    {
        
        UITapGestureRecognizer * recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        recognizer.delegate = self;
        [view addGestureRecognizer:recognizer];
        [recognizer requireGestureRecognizerToFail:_panGesture];
        
        // TODO: Add a custom gesture recognizer too
        TickleGestureRecognizer * recognizer2 = [[TickleGestureRecognizer alloc] initWithTarget:self action:@selector(handleTickle:)];
        recognizer2.delegate = self;
        [view addGestureRecognizer:recognizer2];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark
#pragma mark    Click events

-(IBAction) clickonClose :(id)sender
{
    //[self.view removeFromSuperview];
    
    self.view.alpha = 1;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.5];
    [self.view setAlpha:0];
    [UIView commitAnimations];
}

#pragma mark
#pragma mark    ScrollView Delegate

//- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
//{
//    return viewMain;
//}
//
//- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
//{
//    [scroll setContentSize:CGSizeMake(scale * scroll.frame.size.width, scale * scroll.frame.size.height)];
//}
//
//- (void)scrollViewDidZoom:(UIScrollView *)scrollView
//{
//
//}

#pragma mark
#pragma mark    ScrollView Delegate


- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer
{
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
    
}
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer
{
//    NSLog(@"Scale :%f",recognizer.scale);
//    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
//    recognizer.scale = 1;
    
    if([recognizer state] == UIGestureRecognizerStateBegan)
    {
        // Reset the last scale, necessary if there are multiple objects with different scales
        lastScale = [recognizer scale];
    }
    
    if ([recognizer state] == UIGestureRecognizerStateBegan ||
        [recognizer state] == UIGestureRecognizerStateChanged) {
        
        CGFloat currentScale = [[[recognizer view].layer valueForKeyPath:@"transform.scale"] floatValue];
        
        // Constants to adjust the max/min values of zoom
        const CGFloat kMaxScale = 2.0;
        const CGFloat kMinScale = 1.0;
        
        CGFloat newScale = 1 -  (lastScale - [recognizer scale]);
        newScale = MIN(newScale, kMaxScale / currentScale);
        newScale = MAX(newScale, kMinScale / currentScale);
        CGAffineTransform transform = CGAffineTransformScale([[recognizer view] transform], newScale, newScale);
        [recognizer view].transform = transform;
        
        lastScale = [recognizer scale];  // Store the previous scale factor for the next pinch gesture call
    }
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer
{
    // Comment for panning
    // Uncomment for tickling
    //return;
    
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateEnded)
    {
        
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        /*        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor),
         recognizer.view.center.y + (velocity.y * slideFactor));*/
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x,
                                         recognizer.view.center.y);
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            recognizer.view.center = finalPoint;
        } completion:nil];
        
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{

}

- (void)handleTickle:(TickleGestureRecognizer *)recognizer
{
    
}

@end
