//
//  WebTabViewController.m
//  webapprss
//
//  Created by Daniel Vela on 7/19/13.
//  Copyright (c) 2013 veladan. All rights reserved.
//

#import "WebTabViewController.h"

const NSInteger kFiveMinutes = 300;

@interface WebTabViewController () {
    NSDate* lastLoadDate;
}

@end

@implementation WebTabViewController

- (void)createWebController {
    self.webController = [[WebViewController alloc]
                          initWithNibName:@"WebViewController"
                          bundle:nil];
    [self addChildViewController:self.webController];
    [self.view addSubview:self.webController.view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self createWebController];
    lastLoadDate = [NSDate date];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.webController.view.frame = self.view.frame;
    if ([lastLoadDate timeIntervalSinceNow] < -kFiveMinutes) {
        [self.webController.web reload];
        lastLoadDate = [NSDate date];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
