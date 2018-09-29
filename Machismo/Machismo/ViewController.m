//
//  ViewController.m
//  Machismo
//
//  Created by Huy Nguyen on 9/10/18.
//  Copyright © 2018 CS193p. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCards.h"
#import "Card.h"

@interface ViewController ()

@property (strong, nonatomic) Deck *deck;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@end

@implementation ViewController

- (Deck*)deck {
    if (!_deck)
    {
        _deck = [self createDeck];
    }
    return _deck;
}

- (PlayingCardDeck*)createDeck {
    PlayingCardDeck *deck = [[PlayingCardDeck alloc] init];
    return deck;
}

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)cardButton:(UIButton*)sender {

    sender.selected = !sender.selected;
    
    if (sender.isSelected)
    {
        Card *card = [self.deck drawRandomCard];
        if (card) {
            [sender setBackgroundImage:[UIImage imageNamed:@"blank"]
                              forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
            
            if ([[(PlayingCards*)card suit]  isEqual: @"♥︎"] || [[(PlayingCards*)card suit]  isEqual: @"♦︎"]) {
                [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            } else {
                [sender setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
        }
        
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"back"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    
    self.flipCount++;
}

@end
