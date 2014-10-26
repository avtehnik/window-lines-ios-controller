//
//  HCAudioViewController.h
//  homecontroller
//
//  Created by av_tehnik on 9/9/14.
//  Copyright (c) 2014 vitaliy pitvalo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCAudioViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *sourceSelector;
@property (weak, nonatomic) IBOutlet UISlider *mainVolume;
@property (weak, nonatomic) IBOutlet UISlider *centerVolume;
@property (weak, nonatomic) IBOutlet UISlider *subwofwerVolume;
@property (weak, nonatomic) IBOutlet UISlider *frontLeftVlume;
@property (weak, nonatomic) IBOutlet UISlider *frontRigthVolume;
@property (weak, nonatomic) IBOutlet UISlider *rearLeftVolume;
@property (weak, nonatomic) IBOutlet UISlider *rearRigthVolume;

@end
