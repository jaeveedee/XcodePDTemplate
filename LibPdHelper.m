//
//  LibPdHelper.m
//  XcodeLibPDTemplate
//
//  Created by Jay Van Dyke on 6/24/14.
//  Copyright (c) 2014 JVDev. All rights reserved.
//  www.jayvandyke.com

#import "LibPdHelper.h"
#import <UIKit/UIKit.h>

@interface LibPdHelper (){
    PdDispatcher *dispatcher;
    
    void *p;
}

@end

@implementation LibPdHelper

- (id)initWithPatch:(NSString *)patch
{
    self = [super init];
    if (self) {
        NSString *mainPatch = patch;
        
        //open the patch
        p = [PdBase openFile:mainPatch path:[[NSBundle mainBundle]resourcePath]];
        if(!p){
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Uh Oh!"
                                                                           message:@"Something went wrong. Please quit and restart."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [self.superclass presentViewController:alert animated:YES completion:nil];
        }
        
        dispatcher = [[PdDispatcher alloc] init];
        
        [PdBase setDelegate:dispatcher];
        
        
    }
    return self;
}

- (void)addListener:(NSString *)listener
{
    [dispatcher addListener:self forSource:listener];
}

- (void)receiveBangFromSource:(NSString *)source
{
    NSLog(@"bang");
}

- (void)receiveFloat:(float)received fromSource:(NSString *)source
{
    [self.delegate floatReceiver:received from:source];
}

- (void)receiveList:(NSArray *)list fromSource:(NSString *)source
{
    [self.delegate listReceiver:list from:source];
}

- (void)receiveMessage:(NSString *)message withArguments:(NSArray *)arguments fromSource:(NSString *)source
{
    [self.delegate messageReceiver:message args:arguments from:source];
}

- (void)receiveSymbol:(NSString *)symbol fromSource:(NSString *)source
{
    [self.delegate symbolReceiver:symbol from:source];
}

- (void)bangSender:(NSString *)receiver
{
    [PdBase sendBangToReceiver:receiver];
}

- (void)floatSender:(float)f to:(NSString *)r
{
    [PdBase sendFloat:f toReceiver:r];
}



@end
