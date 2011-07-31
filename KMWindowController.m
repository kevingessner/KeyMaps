//
//  KMWindowController.m
//  KeyMaps
//
//  Created by Kevin Gessner on 11/15/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "KMWindowController.h"
#import <DDHidLib/DDHidLib.h>


@implementation KMWindowController

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	NSString *output = @"";
	
	for(DDHidKeyboard *keyboard in [DDHidKeyboard allKeyboards]) {
		CFStringRef fnusagemap = IORegistryEntrySearchCFProperty([keyboard ioDevice], kIOServicePlane, (CFStringRef)@"FnFunctionUsageMap", kCFAllocatorDefault, kIORegistryIterateRecursively);
		if(!fnusagemap) fnusagemap = (CFStringRef)@"No special keys found";
		output = [output stringByAppendingString:[NSString stringWithFormat:@"%@:\n%@\n\n", [keyboard productName], fnusagemap]];
	}
	
	[textField setStringValue:output];
	
}

@end
