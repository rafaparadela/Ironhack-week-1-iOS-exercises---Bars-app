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

- (id)init{
    return nil;
}

- (id)initWithFileName:(NSString *)fileName {
    self = [super init];
    
    if (self) {
        NSString *pathToBarsPList = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
        NSArray *contentsOfBarsPList = [NSArray arrayWithContentsOfFile:pathToBarsPList];
        
        for (NSDictionary *loopDictionary in contentsOfBarsPList) {
            if ([loopDictionary isKindOfClass:[NSDictionary class]]) {
                [self addBarToBarsList:loopDictionary];
            }
        }
    }
    
    return self;
}


- (void)addBarToBarsList:(NSDictionary *)loopDictionary {
    Bar *bar = [[Bar alloc] init];
    bar.name = loopDictionary[@"name"];
    bar.address = loopDictionary[@"address"];
    bar.stars = [loopDictionary[@"stars"] unsignedIntegerValue];
    bar.description = loopDictionary[@"description"];
    bar.position = loopDictionary[@"position"];
    bar.photoURL = loopDictionary[@"photoURL"];
    
    [self.barsList addObject:bar];
}

- (NSArray *)allBars{
    return self.barsList;
}

@end
