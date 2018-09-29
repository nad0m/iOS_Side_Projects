//
//  PlayingCardDeck.m
//  Machismo
//
//  Created by Huy Nguyen on 9/22/18.
//  Copyright © 2018 CS193p. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCards.h"

@implementation PlayingCardDeck

- (instancetype)init {
    
    self = [super init];
    
    if (self)
    {
        
        for (NSString *suit in [PlayingCards validSuits])
        {
            for (NSUInteger rank = 1; rank <= [PlayingCards maxRank]; rank++)
            {
                PlayingCards *card = [[PlayingCards alloc] init];
                [card setRank:rank];
                [card setSuit:suit];
                [self addCard:card];
                
            }
        }
    }
    return self;
}

@end
