//
//  ViewController.m
//  SKPanoramaAlbum
//
//  Created by Somer.King on 2019/4/29.
//  Copyright © 2019 Somer.King. All rights reserved.
//

#import "ViewController.h"
#import "SKVRViewerVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)jumpToPanorama:(id)sender {
    SKVRViewerVC *panoramaVC = [[SKVRViewerVC alloc] init];
    [self.navigationController pushViewController:panoramaVC animated:YES];
}

@end
