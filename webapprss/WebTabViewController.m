//
//  WebTabViewController.m
//  webapprss
//
//  Created by Daniel Vela on 7/19/13.
//  Copyright (c) 2013 veladan. All rights reserved.
//

#import "WebTabViewController.h"

@interface WebTabViewController ()

@end

@implementation WebTabViewController

- (void)createWebController {
    self.webController = [[WebViewController alloc]
                          initWithNibName:@"WebViewController"
                          bundle:nil];
    [self addChildViewController:self.webController];
    self.webController.view.frame = self.view.frame;
    [self.view addSubview:self.webController.view];
}

- (void)viewDidLoad {
    [super viewDidLoad];

	[self createWebController];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.webController.view.frame = self.view.frame;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
