//
//  HCAudioViewController.m
//  homecontroller
//
//  Created by av_tehnik on 9/9/14.
//  Copyright (c) 2014 vitaliy pitvalo. All rights reserved.
//

#import "HCAudioViewController.h"

@implementation HCAudioViewController



-(void)viewDidLoad{
    
    [self.volumes insertObject:[NSNumber numberWithInteger:1]atIndex:0];
    [self.volumes insertObject:[NSNumber numberWithInteger:1]atIndex:1];
    [self.volumes insertObject:[NSNumber numberWithInteger:1]atIndex:2];
    [self.volumes insertObject:[NSNumber numberWithInteger:1]atIndex:3];
    [self.volumes insertObject:[NSNumber numberWithInteger:1]atIndex:4];
    [self.volumes insertObject:[NSNumber numberWithInteger:1]atIndex:5];
    [self.volumes insertObject:[NSNumber numberWithInteger:1]atIndex:6];
    [self.volumes insertObject:[NSNumber numberWithInteger:1]atIndex:7];
    
    self.mainVolume.continuous = NO;
    self.centerVolume.continuous = NO;
    self.subwofwerVolume.continuous = NO;
    self.frontLeftVlume.continuous = NO;
    self.frontRigthVolume.continuous = NO;
    self.rearLeftVolume.continuous = NO;
    self.rearRigthVolume.continuous = NO;

    
    
}


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
    
    
}
- (IBAction)source:(UISegmentedControl*)control {
    
    int srcIndex = [control selectedSegmentIndex];
    
    dispatch_queue_t taskQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(taskQ,^{
                       NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.17/source?source=%d",srcIndex]];
                       NSData *data = [NSData dataWithContentsOfURL:url];
                       NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                       NSLog(@"src %d , ret=%@",srcIndex, ret);
                   });

    
    
    
}


-(void)setVolume:(int)chanel value:(int) value {
    
    NSLog(@" %i %i ",[[self.volumes objectAtIndex:chanel] integerValue], value);
    
    if([[self.volumes objectAtIndex:chanel] integerValue] != value){
    
    dispatch_queue_t taskQ = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(taskQ,
                  ^{
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.17/volume?channel=%i&value=%i",chanel ,value ]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@" channel %i, value %i, ret=%@",chanel,value, ret);
                   });
    
    }
    
    
    [self.volumes insertObject:[NSNumber numberWithInteger:value] atIndex:chanel];

    NSLog(@" %i 2 %i ",[[self.volumes objectAtIndex:chanel] integerValue], value);
    
}

- (IBAction)allVolume:(UISlider*)sender{
    [self setVolume:sender.tag value:sender.value];
}


@end
