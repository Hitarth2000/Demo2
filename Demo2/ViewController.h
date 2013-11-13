//
//  ViewController.h
//  Demo2
//
//  Created by Glare51 on 11/2/13.
//  Copyright (c) 2013 Glare51. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ZoomableView.h"
#import "SCView.h"
#import "SubLable.h"
#import "BoothVC.h"
@interface ViewController : UIViewController <UIScrollViewDelegate,UIGestureRecognizerDelegate>

{
    IBOutlet SCView                 * scroll;
    
    IBOutlet ZoomableView           * view1;
    IBOutlet UILabel                * lbl;
    
    IBOutlet UIView                 * viewMain;
    
    
    
    
    
    float previousScale;
    
}

- (IBAction) clickonButton :(id)sender;

@property (nonatomic, retain) NSMutableArray            * arrayViews;
@property (nonatomic, retain) NSMutableArray            * arrayTitles;
@property (nonatomic, retain) BoothVC                   * booth;

@end
