//
//  BarsTests.m
//  Bares
//
//  Created by Gorka Magaña on 06/06/14.
//  Copyright (c) 2014 Ironhack. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Bar.h"
#import "Bars.h"

@interface BarsTests : XCTestCase

@end

@implementation BarsTests

#define BARSLIST_FILENAME @"bars_list"

- (void)testCanCreateBarsListFromFile{
    Bars * bars = [[Bars alloc] initWithFileName:BARSLIST_FILENAME];
    
    XCTAssertNotNil(bars);
}

- (void)testCanReadBarsFromFile{
    
    Bars * bars = [[Bars alloc] initWithFileName:BARSLIST_FILENAME];
    
    NSString *pathToBarsPList = [[NSBundle mainBundle] pathForResource:BARSLIST_FILENAME ofType:@"plist"];
    NSArray *contentsOfBarsPList = [NSArray arrayWithContentsOfFile:pathToBarsPList];
    
    XCTAssertEqual([[bars allBars] count], [contentsOfBarsPList count]);
    XCTAssertTrue([[bars allBars][0] isKindOfClass:[Bar class]]);
}

- (void)testBarsListsBarHasAllDataSet {
    Bars *bars = [[Bars alloc] initWithFileName:BARSLIST_FILENAME];
    
    for (Bar *bar in [bars allBars]) {
        XCTAssertTrue([bar.name isKindOfClass:[NSString class]]);
        XCTAssertTrue([bar.address isKindOfClass:[NSString class]]);
        XCTAssertTrue(bar.stars > 0);
        XCTAssertTrue([bar.description isKindOfClass:[NSString class]]);
        XCTAssertTrue([bar.position isKindOfClass:[NSDictionary class]]);
        XCTAssertTrue([bar.photoURL isKindOfClass:[NSString class]]);
    }
}


@end
