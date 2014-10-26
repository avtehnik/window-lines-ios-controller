//
//  HCAudioViewController.m
//  homecontroller
//
//  Created by av_tehnik on 9/9/14.
//  Copyright (c) 2014 vitaliy pitvalo. All rights reserved.
//

#import "HCAudioViewController.h"



@implementation HCAudioViewController



-(void)viewDidAppear:(BOOL)animated{
    [super viewDidLoad];
    
    
    
    
    dispatch_queue_t taskQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(taskQ,
                   ^{
                       NSError *error;
                       
                       NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.5:82/?task=ligth&type=state"]];
                       
                       
                       
//                       NSData *data = [NSData dataWithContentsOfURL:url];
                       NSData *data = [[NSData alloc]init];
                       
//                       [data setValue:4 forKey:@"source"];
//                       [data setValue:10.0 forKey:@"mainVolume"];
//                       [data setValue:10.0 forKey:@"centerVolume"];
//                       [data setValue:10 forKey:@"subwofwerVolume"];
//                       [data setValue:10.0 forKey:@"frontLeftVlume"];
//                       [data setValue:10.0 forKey:@"frontRigthVolume"];
//                       [data setValue:10.0 forKey:@"rearLeftVolume"];
//                       [data setValue:10.0 forKey:@"rearRigthVolume"];
                       
                       if (data!=nil) {
                           NSDictionary *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
                           NSInteger theNumber = 0;
                           NSInteger numberCopy = theNumber; // so you won't change your original value
                           NSInteger buttonindex = 0;
                           for (id key in array) {
                               theNumber = [[array objectForKey:key] intValue];
                               
                               
                           }
                       }
                       
                       
                   });
    

//    [self.frontLeftVlume setValue:30.0];
    self.sourceSelector.selectedSegmentIndex = 1;
}




-(void)setSource:(NSString*) src{
    
    dispatch_queue_t taskQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(taskQ,
                   ^{
                       NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.5:82?task=souce&value=%@",src]];
                       NSData *data = [NSData dataWithContentsOfURL:url];
                       NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                       NSLog(@"src %@ , ret=%@",src, ret);
                   });
    
}
- (IBAction)source:(UISegmentedControl*)control {
    switch ([control selectedSegmentIndex]) {
        case 0:
            [self setSource: @"5.1"];
            break;
        case 1:
            [self setSource: @"aux1"];
            break;
        case 2:
            [self setSource: @"aux2"];
            break;
        case 3:
            [self setSource: @"aux3"];
            break;
        case 4:
            [self setSource: @"aux4"];
            break;
        default:
            break;
    }
    
    
}


-(void)setVolume:(int)chanel value:(int) value {
    
//    CHAN_ALL    0
//    CHAN_FL     1
//    CHAN_FR     2
//    CHAN_RL     3
//    CHAN_RR     4
//    CHAN_CEN    5
//    CHAN_SW     6
    
    //dispatch_queue_t taskQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //dispatch_async(taskQ,
        //           ^{
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.5:82?task=volume&type=chanel&chanel=%i&value=%i",chanel ,value ]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@" channel %i, value %i, ret=%@",chanel,value, ret);
      //             });
}

- (IBAction)allVolume:(UISlider*)sender{
    [self setVolume:sender.tag value:sender.value];
}


@end
