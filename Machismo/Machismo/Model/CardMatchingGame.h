//
//  CardMatchingGame.h
//  Machismo
//
//  Created by Huy Nguyen on 9/29/18.
//  Copyright © 2018 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

// Designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck*)deck
                         withMode:(int)mode;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (Card*)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@property (nonatomic, readonly) int mode;

@end
