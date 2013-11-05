//
//  ViewController.m
//  BaoJunCar
//
//  Created by doujingxuan on 13-10-29.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

#import "ViewController.h"
#import "PlayVideoController.h"
#import "ExperienceVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
        return YES;
}
-(IBAction)videoButton:(id)sender
{
    UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PlayVideoController *controller = [stryBoard instantiateViewControllerWithIdentifier:@"PrsentOnlieVideoID"];
    UINavigationController * nav =[[UINavigationController alloc] initWithRootViewController:controller];
    nav.modalPresentationStyle =UIModalPresentationFullScreen;
    [self presentViewController:nav animated:NO completion:nil];
}
-(IBAction)experiencrButton:(id)sender
{
    UIStoryboard *stryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ExperienceVC  *controller = [stryBoard instantiateViewControllerWithIdentifier:@"ExperienceVCID"];
    UINavigationController * nav =[[UINavigationController alloc] initWithRootViewController:controller];
    nav.modalPresentationStyle =UIModalPresentationFullScreen;
    [self presentViewController:nav animated:NO completion:nil];

}
@end
