//
//  Bars.m
//  Bares
//
//  Created by Gorka Magaña on 06/06/14.
//  Copyright (c) 2014 Ironhack. All rights reserved.
//

#import "Bars.h"
#import "Bar.h"

@interface Bars()

@property (nonatomic, strong) NSMutableArray * barsList;

@end

@implementation Bars

#pragma mark - Lazy instantiation
- (NSMutableArray *)barsList {
    if (!_barsList) {
        _barsList = [[NSMutableArray alloc] init];
    }
    return _barsList;
}




#pragma mark - Initialization
- (id)initWithFile:(NSString *)filePath {
    self = [super init];
    
    if (self) {
        NSString *pathToBarsPList = [[NSBundle mainBundle] pathForResource:@"bars_list" ofType:@"plist"];
        NSArray *contentsOfBarsPList = [NSArray arrayWithContentsOfFile:pathToBarsPList];
        
        for (id loopBar in contentsOfBarsPList) {
            if ([loopBar isKindOfClass:[Bar class]]) {
                [self addBarToBarsList:(Bar *)loopBar];
            }
        }
    }
    
    return self;
}


- (void)addBarToBarsList:(Bar *)loopBar {
    Bar *bar = [[Bar alloc] init];
    bar.name = loopBar.name;
    bar.address = loopBar.address;
    bar.stars = loopBar.stars;
    bar.position = loopBar.position;
    bar.photoURL = loopBar.photoURL;
}

@end
