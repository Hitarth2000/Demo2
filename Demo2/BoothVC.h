//
//  BoothVC.h
//  Demo2
//
//  Created by Glare51 on 11/12/13.
//  Copyright (c) 2013 Glare51. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BoothVC : UIViewController <UIScrollViewDelegate,UIGestureRecognizerDelegate>
{
    IBOutlet    UIScrollView        * scroll;
    IBOutlet    UIView              * viewMain;
    IBOutlet    UIImageView         * imgView;
    
    
    float   lastScale;
}

@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer * panGesture;


- (IBAction) clickonClose :(id)sender;

- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer;
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer;
- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;


@end
