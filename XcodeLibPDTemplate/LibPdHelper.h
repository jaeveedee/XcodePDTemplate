//
//  LibPdHelper.h
//  XcodeLibPDTemplate
//
//  Created by Jay Van Dyke on 6/24/14.
//  Copyright (c) 2014 JVDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PdDispatcher.h"

@protocol LibPDDelegate <NSObject>

@optional
- (void)floatReceiver:(float)f from:(NSString *)src;
- (void)bangReceiver:(NSString *)src;
- (void)listReceiver:(NSArray *)l from:(NSString *)src;
- (void)messageReceiver:(NSString *)m args:(NSArray *)arg from:(NSString *)src;
- (void)symbolReceiver:(NSString *)sym from:(NSString *)src;

//add more for your purposes

@end

@interface LibPdHelper : NSObject <PdListener>

@property (weak, nonatomic) id delegate;

- (void)bangSender:(NSString *)receiver;
- (void)floatSender:(float)f to:(NSString *)r;
- (id)initWithPatch:(NSString *)patch;

@end
