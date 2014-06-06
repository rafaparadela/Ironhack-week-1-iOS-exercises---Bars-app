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
@property (nonatomic) NSUInteger currentBarIndexInList;

@end

@implementation Bars

#pragma mark - Lazy instantiation
- (NSMutableArray *)barsList {
    if (!_barsList) {
        _barsList = [[NSMutableArray alloc] init];
    }
    return _barsList;
}

- (NSUInteger)currentBarIndexInList{
    if(!_currentBarIndexInList){
        _currentBarIndexInList = 1;
    }
    return _currentBarIndexInList;
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

- (Bar *)firstBar{
    if([[self barsList] count]){
        self.currentBarIndexInList = 1;
        return (Bar *)[self.barsList firstObject];
    }
    else{
        return nil;
    }
}

- (Bar *)nextBar{
    if([[self barsList] count] > self.currentBarIndexInList ){
        ++self.currentBarIndexInList;
        return [self barsList][self.currentBarIndexInList];
    }
    else{
        return [self firstBar];
    }
}

- (Bar *)previousBar{
    if(self.currentBarIndexInList > 0 ){
        --self.currentBarIndexInList;
        return [self barsList][self.currentBarIndexInList];
    }
    else{
        self.currentBarIndexInList = [[self barsList] count];
        return (Bar *)[self.barsList lastObject];
    }
}

@end
