//
//  HCFirstViewController.m
//  homecontroller
//
//  Created by av_tehnik on 10/14/13.
//  Copyright (c) 2013 vitaliy pitvalo. All rights reserved.
//

#import "HCFirstViewController.h"

@interface HCFirstViewController ()

@end

@implementation HCFirstViewController
- (IBAction)open:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.5:81"];
    
    NSString* str = @"teststring";
    NSData *postData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    // Create the request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:[NSString stringWithFormat:@"%d", postData.length] forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [connection start];
}


- (IBAction)close:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.5:81"];
    
    NSString* str = @"teststring";
    NSData *postData = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    // Create the request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"DELETE"];
    [request setValue:[NSString stringWithFormat:@"%d", postData.length] forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [connection start];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)positionDidChanged:(UISlider*)sender {
    
    
    NSURL *url = [NSURL URLWithString:[ NSString stringWithFormat:  @"http://192.168.1.5:81/?servo=%d&position=%d&callback=cccc",sender.tag, (int)sender.value ]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSString *ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"ret=%@", ret);
    
    NSLog(@"slider %d  value = %i",sender.tag,  (int)sender.value );
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
