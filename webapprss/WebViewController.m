//
//  WebViewController.m
//  OSLibrary
//
//  Created by Daniel Vela on 6/29/11.
//  Copyright 2011 veladan. All rights reserved.
//

#import "WebViewController.h"


@implementation WebViewController

@synthesize web;
@synthesize url = _url;

- (void)setUrl:(NSString *)u {
    _url = u;
	NSURLRequest* request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:_url]];
	[web loadRequest:request];
}

- (void)viewDidLoad {
	UIBarButtonItem* moreButton = [[UIBarButtonItem alloc]
                        initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                             target:self
                                             action:@selector(moreTouched)];
	[self.navigationItem setRightBarButtonItem:moreButton];
    [super viewDidLoad];
	web.delegate = self;
}

-(void)moreTouched {
	UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:
                                  NSLocalizedString(@"",@"")
															 delegate:self
                                                    cancelButtonTitle:
                                  NSLocalizedString(@"Cancelar",@"")
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:
                                  NSLocalizedString(@"Abrir en Safari",@"")
                                  ,nil];
	actionSheet.actionSheetStyle = UIActionSheetStyleDefault;
	[actionSheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet
clickedButtonAtIndex:(NSInteger)buttonIndex {
	// the user clicked one of the OK/Cancel buttons
	if (buttonIndex == 0) {
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
	} else {
	}
}

-(void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
	web.delegate = nil;
	self.web = nil;
}

- (void)dealloc {
	web.delegate = nil;
}

#pragma mark - UIWebView delegate

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSString *errorMessage = [error localizedDescription];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Web"
														message:errorMessage
													   delegate:nil
											  cancelButtonTitle:@"OK"
											  otherButtonTitles:nil];
    [alertView show];
}

- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;    
}

@end
