//
//  Card.h
//  Machismo
//
//  Created by Huy Nguyen on 9/11/18.
//  Copyright © 2018 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString* contents;

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

- (int) match:(NSArray*) otherCards;
@end
