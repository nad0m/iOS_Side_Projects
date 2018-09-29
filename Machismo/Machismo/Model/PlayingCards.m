//
//  PlayingCards.m
//  Machismo
//
//  Created by Manish Giri on 9/22/15.
//  Copyright (c) 2015 Manish Giri. All rights reserved.
//

#import "PlayingCards.h"

@implementation PlayingCards

@synthesize suit = _suit;

//override getter method of contents property derived from parent class to return suitable info
- (NSString *)contents {
    NSArray *ranks = [PlayingCards rankStrings];
    return [ranks[self.rank] stringByAppendingString:self.suit];
    
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
