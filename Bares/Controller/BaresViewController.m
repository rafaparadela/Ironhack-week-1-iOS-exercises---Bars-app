//
//  BaresViewController.m
//  Bares
//
//  Created by Gorka Magaña on 06/06/14.
//  Copyright (c) 2014 Ironhack. All rights reserved.
//

#import "BaresViewController.h"
#import "DescriptionModalViewController.h"

@interface BaresViewController ()
@property (weak, nonatomic) IBOutlet UILabel *barNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *barImageView;
@property (weak, nonatomic) IBOutlet UILabel *barStarsLabel;
@property (weak, nonatomic) IBOutlet UILabel *barAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *barShortDescriptionLabel;

@end

@implementation BaresViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}






#pragma mark - Bars navigation
- (IBAction)loadPreviousBarIntoViewController:(UIButton *)sender {
    
}
- (IBAction)loadNextBarIntoViewController:(UIButton *)sender {
    
}





#pragma mark - Show description modal
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[DescriptionModalViewController class]]) {
        DescriptionModalViewController *descriptionModalViewController = (DescriptionModalViewController *)segue.destinationViewController;
        
//        descriptionModalViewController.bar = @"kaka";
    }
}


@end
