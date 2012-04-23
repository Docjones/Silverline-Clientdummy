  //
//  AppDelegate.m
//  Client
//
//  Created by Marc Rink on 01.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "Client.h"

@implementation AppDelegate

@synthesize window = _window;
- (id)init
{
  self = [super init];
  if (self) {
    clients=[[NSMutableArray alloc] init];
    for (int i=0; i<10; i++) {
      Client *c=[[Client alloc] init];
      [clients addObject:c];
      [c release];
    }
  }
  return self;
}
- (void)dealloc {
  [clients removeAllObjects];
  [clients release];
  [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
}

-(void)sendMessageToClients:(NSString *)msg {
  [clients makeObjectsPerformSelector:@selector(sendMessage:) withObject:msg];
}
- (IBAction)moveUp:(id)sender {
  [self sendMessageToClients:@"P|M|0|-1|\r\n"];
}
- (IBAction)moveDown:(id)sender {
  [self sendMessageToClients:@"P|M|0|1|\r\n"];
}
- (IBAction)moveRight:(id)sender {
  [self sendMessageToClients:@"P|M|1|0|\r\n"];
}
- (IBAction)moveLeft:(id)sender {
  [self sendMessageToClients:@"P|M|-1|0|\r\n"];
}

- (IBAction)connect:(id)sender {
  [self sendMessageToClients:@"A|C|name|pass|email|\r\n"];
}

- (IBAction)quit:(id)sender {
  [self sendMessageToClients:@"Q\r\n"];
}

- (IBAction)disconnect:(id)sender {
  [clients makeObjectsPerformSelector:@selector(disconnect)];
}
@end
