//
//  PlayingCards.h
//  Machismo
//
//  Created by Huy Nguyen on 9/22/18.
//  Copyright © 2018 CS193p. All rights reserved.
//

#import "Card.h"

@interface PlayingCards : Card

@property (nonatomic, strong)NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray*)validSuits;
+ (NSUInteger)maxRank;
@end
