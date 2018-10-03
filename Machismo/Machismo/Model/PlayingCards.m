//
//  PlayingCards.m
//  Machismo
//
//  Created by Huy Nguyen on 9/22/18.
//  Copyright © 2018 CS193p. All rights reserved.
//

#import "PlayingCards.h"

@implementation PlayingCards

@synthesize suit = _suit;

//override getter method of contents property derived from parent class to return suitable info
- (NSString *)contents {
    NSArray *ranks = [PlayingCards rankStrings];
    return [ranks[self.rank] stringByAppendingString:self.suit];
    
}

- (int)match:(NSArray *)otherCards {
    int sum = 0;
    
    for (PlayingCards *card in otherCards)
    {
        if ([self.suit isEqualToString:card.suit])
        {
            
            NSLog(@"suit of self:%@ vs card:%@", self.suit, card.suit);
            sum += 1;
        }
        
        if (self.rank == card.rank)
        {
            NSLog(@"rank of self:%lu vs card:%lu", self.rank, card.rank);
            sum += 4;
        }
    }
    
    if ([otherCards count] == 2)
    {
        PlayingCards* firstCard = (PlayingCards*)[otherCards firstObject];
        PlayingCards* lastCard = (PlayingCards*)[otherCards lastObject];
        
        if ([[firstCard suit] isEqualToString:[lastCard suit]])
        {
            NSLog(@"3");
            sum += 1;
        }
        
        if ([firstCard rank] == [lastCard rank])
        {
            NSLog(@"4");
            sum += 4;
        }
    }
    
    return sum;
}

//return valid suits and ranks

+ (NSArray *)validSuits {
    return @[@"♣︎", @"♠︎", @"♥︎", @"♦︎"];
}


+ (NSArray *)rankStrings {
    return @[@"?", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13"];
}


//check before setting suit
- (void)setSuit:(NSString *)suit {
    if([[PlayingCards validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

//return suit
- (NSString *) suit {
    return _suit?_suit:@"?";
}

//maxrank method -
+ (NSUInteger)maxRank {
    return [[self rankStrings] count]-1;
}

//use maxrank to set rank properly

- (void)setRank:(NSUInteger)rank {
    if(rank <= [PlayingCards maxRank]) {
        _rank = rank;
    }
}


@end
