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
}

@end
