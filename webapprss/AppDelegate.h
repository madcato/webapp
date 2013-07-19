//
//  AppDelegate.h
//  webapprss
//
//  Created by Daniel Vela on 7/19/13.
//  Copyright (c) 2013 veladan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSNetwork.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, OSNetworkDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
