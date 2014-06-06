//
//  Bars.h
//  Bares
//
//  Created by Gorka Magaña on 06/06/14.
//  Copyright (c) 2014 Ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bar.h"

@interface Bars : NSObject

- (id)initWithFileName:(NSString *)fileName;
- (NSArray *)allBars;
- (Bar *) firstBar;
- (Bar *) nextBar;
- (Bar *) previousBar;


@end
