//
//  AppDelegate.h
//  Client
//
//  Created by Marc Rink on 01.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Client.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
  //Client *client;
  NSMutableArray *clients;
}
- (IBAction)moveUp:(id)sender;
- (IBAction)moveDown:(id)sender;
- (IBAction)moveRight:(id)sender;
- (IBAction)moveLeft:(id)sender;

- (IBAction)disconnect:(id)sender;

@property (assign) IBOutlet NSWindow *window;

@end
