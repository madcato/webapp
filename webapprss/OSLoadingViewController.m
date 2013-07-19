//
//  OSLoadingViewController.m
//  OSLibrary
//
//  Created by Daniel Vela on 14/08/12.
//
//

#import "OSLoadingViewController.h"

const CGFloat waitingViewHeight = 40.0;
const CGFloat waitingViewWidth = 122.0;

@implementation OSLoadingViewController

-(id)init {
    self = [super init];
    _color = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
    return self;
}

-(void)showLoadingView {
    
    if(loadingView != nil) {
        [self hideLoadingView];
    }
    CGRect parentFrame = self.parentView.frame;
    loadingView = [[UIView alloc]initWithFrame:CGRectMake((parentFrame.size.width / 2) - (waitingViewWidth / 2), (parentFrame.size.height / 2) - (waitingViewHeight /2), waitingViewWidth, waitingViewHeight)];
    
    loadingView.opaque = NO;
    loadingView.layer.opacity = 1;
    loadingView.backgroundColor = [UIColor clearColor];
    loadingView.layer.cornerRadius = 15;
    
    UIActivityIndicatorView* activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    CGRect frame = activity.frame;
    frame.origin.x = 11;
    frame.origin.y = 11;
    activity.frame = frame;
    [activity startAnimating];
    [loadingView addSubview:activity];
    
    UILabel* texto = [[UILabel alloc] init];
    frame.origin.x = 22 + frame.size.width;;
    frame.origin.y = 0;
    frame.size.width = 100;
    frame.size.height = 40;
    texto.frame = frame;
    texto.text = NSLocalizedString(@"Cargando...", @"");
    texto.textColor = [UIColor grayColor];
    [loadingView addSubview:texto];
    
    [self.parentView addSubview:loadingView];
    
}

-(void)hideLoadingView {
    [loadingView removeFromSuperview];
    
    loadingView = nil;
}

@end
