//
//  DescriptionModalViewController.m
//  Bares
//
//  Created by Gorka Magaña on 06/06/14.
//  Copyright (c) 2014 Ironhack. All rights reserved.
//

#import "DescriptionModalViewController.h"

@interface DescriptionModalViewController ()
@property (weak, nonatomic) IBOutlet UITextView *barDescriptionTextView;
@end

@implementation DescriptionModalViewController

- (IBAction)closeModalButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.barDescriptionTextView.text = self.bar.description;
}

@end
