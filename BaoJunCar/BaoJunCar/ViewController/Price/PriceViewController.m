//
//  PriceViewController.m
//  BaoJunCar
//
//  Created by doujingxuan on 13-11-6.
//  Copyright (c) 2013年 doujingxuan. All rights reserved.
//

#import "PriceViewController.h"

@interface PriceViewController ()

@end

@implementation PriceViewController

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
    self.title = @"配置价格";
	// Do any additional setup after loading the view.
    UIButton * backButton = [NavButton createPopButtonWithImage:@"baojun_630"];
    [backButton addTarget:self action:@selector(backClicked:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barButton = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = barButton;
    self.imageView.image = [UIImage imageNamed:@"630_15"];
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
-(IBAction)segControllerClicked:(id)sender
{
    UISegmentedControl * controller = (UISegmentedControl*)sender;
    switch (controller.selectedSegmentIndex) {
        case 0:{
            self.imageView.image = [UIImage imageNamed:@"630_15"];
        }
            break;
        case 1:{
            self.imageView.image = [UIImage imageNamed:@"630_18"];
        }
            break;
        default:
            break;
    }
}
@end
