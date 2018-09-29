//
//  Card.m
//  Machismo
//
//  Created by Huy Nguyen on 9/11/18.
//  Copyright © 2018 CS193p. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray*) otherCards
{
    int score = 0;
    
    for (Card* card in otherCards)
    {
        if ([card.contents isEqualToString:self.contents])
        {
            score = 1;
        }
    }
    
    
    return score;
}

@end
