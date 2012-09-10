//
//  UIWebViewbaseJSViewController.m
//  UIWebViewbaseJS
//
//  Created by Tony Ngo on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIWebViewbaseJSViewController.h"

@implementation UIWebViewbaseJSViewController

@synthesize webView=webView_;

- (IBAction)sliderTouchUpInside:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    [self setPercent:slider.value];
}

- (void)setPercent:(NSInteger)percent
{
    NSString *javascript = [NSString stringWithFormat:@"ExampleApp.setPercent(%i)", percent];
    [webView_ stringByEvaluatingJavaScriptFromString:javascript];
}

- (IBAction)tappedButton:(id)sender {
    NSLog(@"tapped");
    [self.webView stringByEvaluatingJavaScriptFromString:@"location.href = 'myApp://param=20';alert(0);"];

}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *url = [[request URL] absoluteString];
    
    static NSString *urlPrefix = @"myApp://";
    
    if ([url hasPrefix:urlPrefix]) {
        NSString *paramsString = [url substringFromIndex:[urlPrefix length]];
        NSArray *paramsArray = [paramsString componentsSeparatedByString:@"&"];
        int paramsAmount = [paramsArray count];
        
        for (int i = 0; i < paramsAmount; i++) {
            NSArray *keyValuePair = [[paramsArray objectAtIndex:i] componentsSeparatedByString:@"="];
            NSString *key = [keyValuePair objectAtIndex:0];
            NSString *value = nil;
            if ([keyValuePair count] > 1) {
                value = [keyValuePair objectAtIndex:1];
            }
            
            if (key && [key length] > 0) {
                if (value && [value length] > 0) {
                    if ([key isEqualToString:@"param"]) {
                        NSLog(@"value %@ - key %@",value,key);
                        if ([value isEqualToString:@"10"]) {
                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tui day" message:value delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
                            [alert show];
                        }
                    }
                }
            }
        }
        
        return NO;
    }
    else {
        return YES;
    }
}


#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self setPercent:50];
}

#pragma mark - Initialization

- (void)dealloc
{
    [webView_ release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // disable bounces
    for (id subview in webView_.subviews)
        if ([[subview class] isSubclassOfClass: [UIScrollView class]])
            ((UIScrollView *)subview).bounces = NO;
    
    [webView_ loadRequest:[NSURLRequest requestWithURL:
                           [[NSBundle mainBundle] URLForResource:@"index"
                                                   withExtension:@"html"
                                                    subdirectory:@"html"]]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
