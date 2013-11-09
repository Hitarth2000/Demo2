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

@interface ViewController : UIViewController <UIScrollViewDelegate>

{
    IBOutlet SCView     * scroll;
    IBOutlet ZoomableView           * view1;
    IBOutlet UILabel          * lbl;
    
    IBOutlet ZoomableView     * viewMain;
    
    IBOutlet UIView           * view2;
    IBOutlet UILabel          * lbl2;
    
    IBOutlet UIButton         * btn;
    
    
    float previousScale;
    
    float scaleTracker;
    
}

- (IBAction) clickonButton :(id)sender;

@end
