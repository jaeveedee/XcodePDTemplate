//
//  LibPdHelper.m
//  XcodeLibPDTemplate
//
//  Created by Jay Van Dyke on 6/24/14.
//  Copyright (c) 2014 JVDev. All rights reserved.
//

#import "LibPdHelper.h"

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
        NSString *mainPatch = patch;//change pd patch name here
        
        //open the patch
        p = [PdBase openFile:mainPatch path:[[NSBundle mainBundle]resourcePath]];
        if(!p){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                            message:@"Pd patch not instantiated"
                                                           delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        
        dispatcher = [[PdDispatcher alloc] init];
        
        [PdBase setDelegate:dispatcher];
        
        //add listeners here
        //[dispatcher addListener:self forSource:@"listener"];
        
    }
    return self;
}

- (void)receiveBangFromSource:(NSString *)source
{
    //receiving bangs
    NSLog(@"bang");
    [self.delegate bangReceiver:source];
}

- (void)receiveFloat:(float)received fromSource:(NSString *)source
{
    //receiving floats
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
    NSString *sy = symbol;
    NSString *s = source;
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
