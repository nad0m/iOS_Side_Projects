//
//  Deck.h
//  Machismo
//
//  Created by Huy Nguyen on 9/11/18.
//  Copyright © 2018 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card*)card atTop:(BOOL)atTop;
- (void)addCard:(Card*)card;

- (Card*)drawRandomCard;

@end
