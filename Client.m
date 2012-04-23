//
//  Client.m
//  Client
//
//  Created by Marc Rink on 01.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Client.h"
#import "AsyncSocket.h"

@implementation Client

- (id)init {
  self = [super init];
  if (self) {
    NSLog(@"Initializing Client...");
    NSError *error;

    _socket=[[AsyncSocket alloc] initWithDelegate:self];
    if(![_socket connectToHost:@"127.0.0.1" onPort:9999 error:&error]) 		{
			NSLog(@"Error starting server: %@", error);
		}
  }
  return self;
}

-(void)onSocket:(AsyncSocket *)sock willDisconnectWithError:(NSError *)err {
  NSLog(@"Error occured: %@", err);
}

-(void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag {
  NSLog(@"Wrote data");
}

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
	NSData *strData = [data subdataWithRange:NSMakeRange(0, [data length] - 2)];
	NSString *msg = [[NSString alloc] initWithData:strData encoding:NSUTF8StringEncoding];

  NSLog(@"Message from Server: %@",msg);
    
}


-(void)sendMessage:(NSString *)msg {
  NSLog(@"Sending: %@", msg);
  [_socket writeData:[msg dataUsingEncoding:NSUTF8StringEncoding] withTimeout:15 tag:0];
  [_socket readDataToData:[AsyncSocket CRLFData]  withTimeout:15 tag:0];
}

-(void)disconnect {
  [_socket disconnect];
}

- (void)dealloc {
  [_socket release];
  [super dealloc];
}
@end
