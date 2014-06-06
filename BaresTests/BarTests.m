//
//  BarTests.m
//  Bares
//
//  Created by Gorka Magaña on 06/06/14.
//  Copyright (c) 2014 Ironhack. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Bar.h"

@interface BarTests : XCTestCase

@end

@implementation BarTests

- (void)testCanCreateABar {
    Bar *bar = [[Bar alloc] init];
    
    XCTAssertNotNil(bar);
}

- (void)testCanCreateABarWithName {
    NSString *thisTestBarName = @"Jardín Vertical";
    Bar *bar = [[Bar alloc] initWithName:thisTestBarName];
    
    XCTAssertNotNil(bar);
    XCTAssertEqualObjects(bar.name, thisTestBarName);
}

- (void)testCanCreateABarWithNameAndAddress {
    NSString *thisTestBarName = @"Pepis bar";
    NSString *thisTestBarAddress = @"Calle de la Mora";
    Bar *bar = [[Bar alloc] initWithName:thisTestBarName andAddress:thisTestBarAddress];
    
    XCTAssertNotNil(bar);
    XCTAssertEqualObjects(bar.name, thisTestBarName);
    XCTAssertEqualObjects(bar.address, thisTestBarAddress);
}

- (void)testCanCreateABarWithNameAndAddressAndPosition {
    NSString *thisTestBarName = @"Pepis bar";
    NSString *thisTestBarAddress = @"Calle de la Mora";
    NSDictionary *thisTestBarPosition = @{@"Latitude": @40.405417, @"Longitude": @3.704599};
    
    Bar *bar = [[Bar alloc] initWithName:thisTestBarName andAddress:thisTestBarAddress andPosition:thisTestBarPosition];
    
    XCTAssertNotNil(bar);
    XCTAssertEqualObjects([bar name], thisTestBarName);
    XCTAssertEqualObjects(bar.address, thisTestBarAddress);
    XCTAssertEqualObjects(bar.position, thisTestBarPosition);

}

@end
