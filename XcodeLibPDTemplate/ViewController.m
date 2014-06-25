//
//  ViewController.m
//  XcodeLibPDTemplate
//
//  Created by Jay Van Dyke on 6/24/14.
//  Copyright (c) 2014 JVDev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
}

@property (strong, nonatomic) LibPdHelper *pdHelper;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initPD];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initPD
{
    _pdHelper = [[LibPdHelper alloc] initWithPatch:@"main.pd"];
    _pdHelper.delegate = self;
    [_pdHelper addListener:@"receiveBang"];
}

- (IBAction)play:(id)sender {
    [_pdHelper bangSender:@"sentBang"];
}

- (void)bangReceiver:(NSString *)src
{
    NSLog(@"bang from %@", src);
    float r1 = arc4random() % 11 * 0.1;
    float r2 = arc4random() % 11 * 0.1;
    float r3 = arc4random() % 11 * 0.1;
    
    self.view.backgroundColor = [UIColor colorWithRed:r1 green:r2 blue:r3 alpha:1];
}
@end
