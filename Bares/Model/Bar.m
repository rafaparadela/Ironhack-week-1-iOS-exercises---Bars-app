//
//  Bar.m
//  Bares
//
//  Created by Gorka Magaña on 06/06/14.
//  Copyright (c) 2014 Ironhack. All rights reserved.
//

#import "Bar.h"

@interface Bar ()
@end

@implementation Bar

#pragma mark - Initialization
#define DEFAULT_NAME @""
#define DEFAULT_ADDRESS @""
#define DEFAULT_POSITION @{}

- (id)init {
    return [self initWithName:DEFAULT_NAME andAddress:DEFAULT_ADDRESS andPosition:DEFAULT_POSITION];
}

- (id)initWithName:(NSString *)name {
    return [self initWithName:name andAddress:DEFAULT_ADDRESS andPosition:DEFAULT_POSITION];
}

- (id)initWithName:(NSString *)name andAddress:(NSString *)address {
    return [self initWithName:name andAddress:address andPosition:DEFAULT_POSITION];
}


// Designated initializer
- (id)initWithName:(NSString *)name andAddress:(NSString *)address andPosition:(NSDictionary *)position {
    self = [super init];
    
    if (self) {
        _name = name;
        _address = address;
        _position = position;
    }
    
    return self;
}

@end
