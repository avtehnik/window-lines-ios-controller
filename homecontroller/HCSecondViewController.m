//
//  HCSecondViewController.m
//  homecontroller
//
//  Created by av_tehnik on 10/14/13.
//  Copyright (c) 2013 vitaliy pitvalo. All rights reserved.
//

#import "HCSecondViewController.h"
#import "HCRomAdvancedViewController.h"
@interface HCSecondViewController ()

@end

@implementation HCSecondViewController

- (IBAction)roomMore:(id)sender {
    
   HCRomAdvancedViewController *arvc = [[HCRomAdvancedViewController alloc] init];
    
    
     [self presentViewController:arvc animated:YES completion: nil];
    
}

-(void)tvCommand:(NSString*) key{

     dispatch_queue_t taskQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_async(taskQ,
                   ^{

    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.5/home/keyreceiver.php?key=%@",key]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
                   });

}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)ligthOffKitchen:(id)sender {
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.54/password/?pg=4&n=3"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (IBAction)flipKitchenTable:(id)sender {
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.54/password/?pg=4&n=2"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}
- (IBAction)flipBathroom:(id)sender {
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.54/password/?pg=4&n=4"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);

}

- (IBAction)flipHall:(id)sender {
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.54/password/?pg=4&n=5"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
    
}


- (IBAction)shutdown:(id)sender {
    
    
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.5/home/shutdown.php"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
    
    
}
- (IBAction)wakeup:(id)sender {
    
   // dispatch_queue_t taskQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //dispatch_async(taskQ,
    //               ^{
                       
                       NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.5/home/wakeup.php"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
    //});//end block
    
}
- (IBAction)roomFlip:(id)sender {
    
    
    dispatch_queue_t taskQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(taskQ,
                   ^{
                       
                       NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.33/light?task=toggle"]];
                       NSData *data = [NSData dataWithContentsOfURL:url];
                       NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                       NSLog(@"ret=%@ %d", ret, [sender tag]);
                   });
    


    
//     dispatch_queue_t taskQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    
//    dispatch_async(taskQ,
//                   ^{
//                       
//    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.5/ligth/snake.php"]];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    NSLog(@"ret=%@", ret);
//    });

    
}
- (IBAction)flipServerRoom:(id)sender {
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.54/password/?pg=4&n=1"]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
}

- (IBAction)volumeUp:(id)sender {
    [self tvCommand:@"VOLUP"];
}

- (IBAction)volumeDown:(id)sender {
    [self tvCommand:@"VOLDOWN"];
}

- (IBAction)chPlus:(id)sender {
    [self tvCommand:@"CHUP"];
}

- (IBAction)chMinus:(id)sender {
    [self tvCommand:@"CHDOWN"];
}

- (IBAction)pip:(id)sender {
    [self tvCommand:@"PIP_ONOFF"];
}

- (IBAction)flipHDMI:(id)sender {
    [self tvCommand:@"HDMI"];
}

- (IBAction)tv:(id)sender {
    [self tvCommand:@"TV"];
}

- (IBAction)tvOff:(id)sender {
    [self tvCommand:@"POWEROFF"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
