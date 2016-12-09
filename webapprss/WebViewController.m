//
//  WebViewController.m
//  OSLibrary
//
//  Created by Daniel Vela on 6/29/11.
//  Copyright 2011 veladan. All rights reserved.
//

#import "WebViewController.h"
#import "OSLoadingViewController.h"

@interface WebViewController () {
    BOOL firstLoad;
}

@property (nonatomic, strong) OSLoadingViewController* loadingController;

@end

@implementation WebViewController

@synthesize web;
@synthesize url = _url;

- (void)setUrl:(NSString *)u {
    firstLoad = YES;
    _url = u;
	NSURLRequest* request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:_url]];
    [web loadRequest:request];
}

- (void)setLocalPath:(NSString*)localPath {

    // let url = bundle.URLForResource("index", withExtension: "html", subdirectory: "htmlFileFolder")
    // let html = try String(contentsOfURL: url)
    // let base = url.URLByDeletingLastPathComponent
    // webView.loadHTMLString(html, baseURL: base)


  //  NSURL* path = [[NSBundle mainBundle]
    //                  URLForResource:@"index" withExtension:@"html" subdirectory:localPath];
    //NSString* html = [NSString stringWithContentsOfURL:path usedEncoding:nil error:nil];
    //NSURL* base = [path URLByDeletingLastPathComponent];

    //[web loadHTMLString:html baseURL:base];

    //NSString *htmlFile = [[NSBundle mainBundle] pathForResource:@"_site/index" ofType:@"html"];
    //NSString* htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    //[web loadHTMLString:htmlString baseURL: [[NSBundle mainBundle] bundleURL]];

    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:localPath]];

    [web loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)viewDidLoad {
	UIBarButtonItem* moreButton = [[UIBarButtonItem alloc]
                        initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                             target:self
                                             action:@selector(moreTouched)];
	[self.navigationItem setRightBarButtonItem:moreButton];
    [super viewDidLoad];
    web.delegate = self;
    web.suppressesIncrementalRendering = YES;

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
    if (firstLoad) {
        [self hideLoadingView];
        firstLoad = NO;
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    if (firstLoad) {
        [self showLoadingView];
    }
}

#pragma mark - loading view methods

- (void)showLoadingView {
    [self.loadingController showLoadingView];
}

- (void)hideLoadingView {
    [self.loadingController hideLoadingView];
}

- (OSLoadingViewController*)loadingController {
    if (_loadingController == nil) {
        _loadingController = [[OSLoadingViewController alloc] init];
        _loadingController.parentView = self.view;
    }
    
    return _loadingController;
}
@end
