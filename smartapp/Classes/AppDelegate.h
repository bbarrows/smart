//
//  AppDelegate.h
//  smart-gap
//
//  Created by Bradley Barrows on 12/6/11.
//  Copyright BitTorrent 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#ifdef PHONEGAP_FRAMEWORK
	#import <PhoneGap/PhoneGapDelegate.h>
#else
	#import "PhoneGapDelegate.h"
#endif

@class Reachability;

@interface AppDelegate : PhoneGapDelegate {
    Reachability* internetReachable;
    Reachability* hostReachable;
	NSString* invokeString;
}

// invoke string is passed to your app on launch, this is only valid if you 
// edit smart-gap.plist to add a protocol
// a simple tutorial can be found here : 
// http://iphonedevelopertips.com/cocoa/launching-your-own-application-via-a-custom-url-scheme.html

@property (copy)  NSString* invokeString;

@end

