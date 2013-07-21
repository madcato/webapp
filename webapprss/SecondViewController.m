//
//  SecondViewController.m
//  webapprss
//
//  Created by Daniel Vela on 7/19/13.
//  Copyright (c) 2013 veladan. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webController.url = @"http://webapprss.herokuapp.com/restaurantList/index.html";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
