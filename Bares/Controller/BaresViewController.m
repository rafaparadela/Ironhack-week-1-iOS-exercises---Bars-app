//
//  BaresViewController.m
//  Bares
//
//  Created by Gorka Magaña on 06/06/14.
//  Copyright (c) 2014 Ironhack. All rights reserved.
//

#import "BaresViewController.h"
#import "DescriptionModalViewController.h"
#import "Bars.h"
#import "Bar.h"

@interface BaresViewController ()
@property (weak, nonatomic) IBOutlet UILabel *barNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *barImageView;
@property (weak, nonatomic) IBOutlet UILabel *barStarsLabel;
@property (weak, nonatomic) IBOutlet UILabel *barAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *barShortDescriptionLabel;
@property (strong, nonatomic) Bars *bars;
@property (strong, nonatomic) Bar *bar;

@end

@implementation BaresViewController


- (Bars *)bars {
    if (!_bars) {
        _bars = [[Bars alloc] initWithFileName:@"bars_list"];
    }
    return _bars;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadInfoInViewWithBar:[self.bars firstBar]];
}




#pragma mark - Load data in view
- (void)loadInfoInViewWithBar:(Bar *)bar {
    self.barNameLabel.text = bar.name;
    self.barAddressLabel.text = bar.address;
    self.barShortDescriptionLabel.text = bar.description;
    
    // Load image
    NSURL *imageURL = [NSURL URLWithString:bar.photoURL];
    NSData *imageContents = [NSData dataWithContentsOfURL:imageURL];
    UIImage *barImage = [UIImage imageWithData:imageContents];
    self.barImageView.image = barImage;
    
    // Load stars
    NSMutableString *stars = [[NSMutableString alloc] init];
    for (int i = 0; i < bar.stars; i++) {
        [stars appendString:@"★"];
    }
    self.barStarsLabel.text = stars;
    
    self.bar = bar;
}




#pragma mark - Bars navigation
- (IBAction)loadPreviousBarIntoViewController:(UIButton *)sender {
    [self loadInfoInViewWithBar:[self.bars previousBar]];
}
- (IBAction)loadNextBarIntoViewController:(UIButton *)sender {
    [self loadInfoInViewWithBar:[self.bars nextBar]];
}





#pragma mark - Show description modal
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[DescriptionModalViewController class]]) {
        DescriptionModalViewController *descriptionModalViewController = (DescriptionModalViewController *)segue.destinationViewController;
        
        descriptionModalViewController.bar = self.bar;
    }
}


@end
