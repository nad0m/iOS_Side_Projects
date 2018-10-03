//
//  CardMatchingGame.m
//  Machismo
//
//  Created by Huy Nguyen on 9/29/18.
//  Copyright © 2018 CS193p. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, readwrite) int mode;
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, strong) NSMutableArray *compareStack;

@end

@implementation CardMatchingGame

- (NSMutableArray*)cards {
    if (!_cards)
        _cards = [[NSMutableArray alloc] init];
    
    return _cards;
        
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck withMode:(int)mode{
    self = [super init];
    
    if (self)
    {
        for (int i = 0; i < count; i++)
        {
            Card *card = [deck drawRandomCard];
            if (card)
            {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
        self.mode = mode;
        self.compareStack = [[NSMutableArray alloc] init];
    }
    
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched)
    {
        if (card.isChosen) {
            card.chosen = NO; // flip it face down
            [self.compareStack removeObject:card];
        } else {
            card.chosen = YES;
            if ([self.compareStack count] == self.mode-1)
            {
                int matchScore = [card match:self.compareStack];
                if (matchScore)
                {
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    for (Card *matchCard in self.compareStack)
                    {
                        matchCard.matched = YES;
                    }
                    [self.compareStack removeAllObjects];
                }
                
                else
                {
                    self.score -= MISMATCH_PENALTY;
                    for (Card *matchCard in self.compareStack)
                    {
                        matchCard.chosen = NO;
                    }
                    [self.compareStack removeAllObjects];
                    [self.compareStack addObject:card];
                }
                
                self.score -= COST_TO_CHOOSE;
            } else {
                [self.compareStack addObject:card];
            }
            
            
            
            
            
            
            
            
            
            /*
            if ([self.compareStack count] == self.mode-1)
            {
                int matchScore = [card match:self.compareStack];
                if (matchScore) {
                    self.score += matchScore * MATCH_BONUS;
                    card.matched = YES;
                    for (Card *matchCard in self.compareStack)
                    {
                        matchCard.matched = YES;
                    }
                } else {
                    self.score -= MISMATCH_PENALTY;
                    for (Card *matchCard in self.compareStack)
                    {
                        matchCard.chosen = NO;
                    }
                    card.chosen = NO;
                }
                [self.compareStack removeAllObjects];
            }
            [self.compareStack addObject:card];
            NSLog(@"%ld", [self.compareStack count]);
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
             */
        }
    }
    
    
}

- (Card*)cardAtIndex:(NSUInteger)index {
    if (index >= [self.cards count])
    {
        return nil;
    }
    return [self.cards objectAtIndex:index];
}

@end
