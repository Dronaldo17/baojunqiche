//
//  BrowseViewController.m
//  BaoJunCar
//
//  Created by doujingxuan on 13-11-6.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

#import "BrowseViewController.h"

@interface BrowseViewController ()

@end

@implementation BrowseViewController
@synthesize image;
- (void)dealloc
{
    self.image = nil;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if (nil == self.image) {
        self.image = [[UIImage alloc] init];
    }
    UIButton * backButton = [NavButton createPopButtonWithImage:@"baojun_630"];
    [backButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = barButton;
    
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 600, 600)];
    
    imageView.image = self.image;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];
//    [self.view setBackgroundColor:[UIColor redColor]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backClicked:(id)sender
{
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)appearImage:(UIImage*)image
{
//    self.imageView.backgroundColor = [UIColor redColor];
//    self.imageView.image = image;
    
}
@end
