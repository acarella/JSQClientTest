//
//  AsyncSocketSingleton.m
//  ChatTest
//
//  Created by Vikas Shah on 8/14/15.
//  Copyright (c) 2015 Vikas Shah. All rights reserved.
//

#import "AsyncSocketSingleton.h"

#define SOCKET_HOST @"127.0.0.1"
#define SOCKET_PORT 3000

static GCDAsyncSocket *sock = nil;

@implementation AsyncSocketSingleton

+ (instancetype)sharedSingleton {
    static dispatch_once_t t;
    static AsyncSocketSingleton *sharedSingleton = nil;
    dispatch_once(&t, ^{
        sharedSingleton = [[AsyncSocketSingleton alloc] init];
    });
    return sharedSingleton;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        sock = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
        return self;
    }
    return nil;
}

- (void)connect {
    NSError *err = nil;
    if (![sock connectToHost:SOCKET_HOST onPort:SOCKET_PORT error:&err]) { // Asynchronous!
        // If there was an error, it's likely something like "already connected" or "no delegate set"
        NSLog(@"I goofed: %@", err);
    }
}

- (void)disconnect {
    [sock disconnectAfterReadingAndWriting];
}

- (void)read {
    [sock readDataWithTimeout:-1 tag:1];
}

- (void)sendMessage:(NSData *)writeData {
    [sock writeData:writeData withTimeout:-1 tag:1];
}

#pragma mark - Delegate Methods

- (void)socket:(GCDAsyncSocket *)sender didConnectToHost:(NSString *)host port:(UInt16)port {
    NSLog(@"Cool, I'm connected! That was easy.");
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    NSLog(@"Read data: %@", data);
}

- (void)socket:(GCDAsyncSocket *)sock didReadPartialDataOfLength:(NSUInteger)partialLength tag:(long)tag {
    
}

- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag {
    
}

- (void)socket:(GCDAsyncSocket *)sock didWritePartialDataOfLength:(NSUInteger)partialLength tag:(long)tag {
    
}

@end