//
//  ScrollViewOverlayWithZoomingAppDelegate.h
//  ScrollViewOverlayWithZooming
//
//  Created by ito on 平成23/06/29.
//  Copyright 23 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScrollViewOverlayWithZoomingViewController;

@interface ScrollViewOverlayWithZoomingAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet ScrollViewOverlayWithZoomingViewController *viewController;

@end
