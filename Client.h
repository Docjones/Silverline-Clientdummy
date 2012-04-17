//
//  Client.h
//  Client
//
//  Created by Marc Rink on 01.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AsyncSocket.h"

@interface Client : NSObject {

  AsyncSocket *_socket;
}
-(void)sendMessage:(NSString *)msg;

@end
