//
//  PlayVideoController.m
//  BaoJunCar
//
//  Created by doujingxuan on 13-10-31.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

#import "PlayVideoController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface PlayVideoController ()

@end

@implementation PlayVideoController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"在线欣赏";
    UIButton * backButton = [NavButton createPopButtonWithImage:@"baojun_630"];
    [backButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = barButton;
   
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)playVideo:(id)sender
{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"video" ofType:@"mp4"];
    NSURL * url = [NSURL fileURLWithPath:path];
    MPMoviePlayerViewController *  moviePlayer = [[MPMoviePlayerViewController alloc]
                    initWithContentURL:url];
    
    [self presentViewController:moviePlayer animated:NO completion:nil];
}
-(void)backClicked:(id)sender
{
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
