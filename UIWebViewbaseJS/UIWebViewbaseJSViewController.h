//
//  UIWebViewbaseJSViewController.h
//  UIWebViewbaseJS
//
//  Created by Tony Ngo on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebViewbaseJSViewController : UIViewController<UIWebViewDelegate> {
    
}

@property (nonatomic, readwrite, retain) IBOutlet UIWebView *webView;

- (IBAction)sliderTouchUpInside:(id)sender;

- (void)setPercent:(NSInteger)percent;

- (IBAction)tappedButton:(id)sender;
@end
