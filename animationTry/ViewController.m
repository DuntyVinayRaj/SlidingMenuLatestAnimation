//
//  ViewController.m
//  animationTry
//
//  Created by Vinay Raj on 23/07/14.
//  Copyright (c) 2014 Vinay Raj. All rights reserved.
//

#import "ViewController.h"
#import "BaseController.h"
#import "TopController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnMenu;
@property (nonatomic, strong)BaseController *bc;
@property (nonatomic, strong) TopController *tc;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.bc = [self.storyboard instantiateViewControllerWithIdentifier:@"bc"];
    self.bc.view.frame = self.view.frame; //CGRectMake(0, 0, 320, 568);
    [self.view addSubview:self.bc.view];
    
    
    self.tc = [self.storyboard instantiateViewControllerWithIdentifier:@"tc"];
    self.tc.view.frame = self.view.frame;
    self.tc.view.tag = 0;
    [self.view addSubview:self.tc.view];
    
    
    [self.view bringSubviewToFront:self.btnMenu];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resize) name:@"resize" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)resize
{
    [UIView animateWithDuration:0.2 animations:^{
        self.tc.view.tag = 0;
                    self.tc.view.center = CGPointMake(self.tc.view.center.x - 100, self.tc.view.center.y);
                        self.tc.view.transform = CGAffineTransformMakeScale(1, 1);
//        CGRect tcFrame = self.tc.view.frame;
//        
//        tcFrame.origin.y -= 175;
//        tcFrame.origin.x -= 150;
//        
//        tcFrame.size.height += 350;
//        tcFrame.size.width += 150;
//        self.tc.view.frame = tcFrame;
        
    }];
}


- (IBAction)menuClicked:(id)sender {
    

    
    if( self.tc.view.tag == 0 )
    {
        [UIView animateWithDuration:0.2 animations:^{
            
            self.tc.view.tag = 1;
            
            self.tc.view.center = CGPointMake(self.tc.view.center.x + 100, self.tc.view.center.y);
                self.tc.view.transform = CGAffineTransformMakeScale(0.45, 0.35);
//            CGRect tcFrame = self.tc.view.frame;
//            
//            tcFrame.origin.y += 175;
//            tcFrame.origin.x += 150;
//            
//            tcFrame.size.height -= 350;
//            tcFrame.size.width -= 150;
//            self.tc.view.frame = tcFrame;
            
        }];
    }
    else
    {
        [self resize];
    }
}


@end
