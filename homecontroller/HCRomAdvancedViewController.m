//
//  HCRomAdvancedViewController.m
//  homecontroller
//
//  Created by av_tehnik on 10/17/14.
//  Copyright (c) 2014 vitaliy pitvalo. All rights reserved.
//

#import "HCRomAdvancedViewController.h"

@interface HCRomAdvancedViewController ()

@end

@implementation HCRomAdvancedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    dispatch_queue_t taskQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(taskQ,
                   ^{
                       NSError *error;
                       
                       NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.5:82/?task=ligth&type=state"]];
                       NSData *data = [NSData dataWithContentsOfURL:url];
                       if (data!=nil) {
                       NSDictionary *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                       NSInteger theNumber = 0;
                       NSInteger numberCopy = theNumber; // so you won't change your original value
                       NSInteger buttonindex = 0;
                       for (id key in array) {
                           theNumber = [[array objectForKey:key] intValue];
                           numberCopy = theNumber; // so you won't change your original value
                           for(NSInteger i = 0; i < 8 ; i++) {
                               NSLog(@"bit  %@ %i ",(numberCopy & 1) ? @"1" : @"0",theNumber);
                               numberCopy >>= 1;
                               
                               //UIButton *button = (UIButton*)[[self view] viewWithTag:buttonindex ];
                               
                               //[button setTitle:(numberCopy & 1) ? @"1" : @"0" forState:UIControlStateNormal];
                               
                               buttonindex++;
                           }
                       }
                    }
                       
                       
                   });
    
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)toggle:(id)sender {
    
    dispatch_queue_t taskQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(taskQ,
                   ^{
                       
                       NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.5:82/?task=ligth&type=toggle&lamp=%d",[sender tag]]];
                       NSData *data = [NSData dataWithContentsOfURL:url];
                       NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                       NSLog(@"ret=%@ %d", ret, [sender tag]);
                   });
    
//    [sender text];
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion: nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)allon:(id)sender {
    dispatch_queue_t taskQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(taskQ,
                   ^{
                       
                       NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.5:82/?task=ligth&type=allon"]];
                       NSData *data = [NSData dataWithContentsOfURL:url];
                       NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                       NSLog(@"ret=%@ %d", ret, [sender tag]);
                   });

    
}
- (IBAction)allOff:(id)sender {
    dispatch_queue_t taskQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(taskQ,
                   ^{
                       
                       NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.5:82/?task=ligth&type=alloff"]];
                       NSData *data = [NSData dataWithContentsOfURL:url];
                       NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                       NSLog(@"ret=%@ %d", ret, [sender tag]);
                   });
}
- (IBAction)swipeAction:(UISwipeGestureRecognizer*)sender {
    
    NSLog(@" x: %f, y: %f",     [sender locationInView:self.view].x
          ,   [sender locationInView:self.view].y);
    
}
    


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
