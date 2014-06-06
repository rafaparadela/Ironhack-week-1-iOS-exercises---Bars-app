//
//  Bar.h
//  Bares
//
//  Created by Gorka Magaña on 06/06/14.
//  Copyright (c) 2014 Ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bar : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic) NSUInteger *stars;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSDictionary *position;
@property (nonatomic, strong) NSString *photoURL;

- (id)initWithName:(NSString *)name;
- (id)initWithName:(NSString *)name andAddress:(NSString *)address;
- (id)initWithName:(NSString *)name andAddress:(NSString *)address andPosition:(NSDictionary *)position;

@end
