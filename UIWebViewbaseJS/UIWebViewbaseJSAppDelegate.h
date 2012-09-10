//
//  UIWebViewbaseJSAppDelegate.h
//  UIWebViewbaseJS
//
//  Created by Tony Ngo on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIWebViewbaseJSViewController;

@interface UIWebViewbaseJSAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UIWebViewbaseJSViewController *viewController;

@end
