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
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardCollection;
@property (weak, nonatomic) IBOutlet UISwitch *modeSwitch;

@end

@implementation ViewController


- (CardMatchingGame*)game {
    if (!_game)
    {
        int mode = 2;
        if ([self.modeSwitch isOn])
        {
            mode = 3;
        }
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardCollection count]
                                                  usingDeck:[self createDeck]
                                                   withMode:mode];
    }
    return _game;
}

- (PlayingCardDeck*)createDeck {
    PlayingCardDeck *deck = [[PlayingCardDeck alloc] init];
    return deck;
}

- (IBAction)cardButton:(UIButton*)sender {
    NSUInteger chooseButtonIndex = [self.cardCollection indexOfObject:sender];
    [self.game chooseCardAtIndex:chooseButtonIndex];
    [self updateUI];
    
}

- (IBAction)reDeal:(id)sender {
    self.game = nil;
    self.game = [self game];
    
    [self updateUI];
}

- (void)updateUI {
    for (UIButton *cardButton in self.cardCollection)
    {
        NSUInteger index = [self.cardCollection indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:index];
        [cardButton setTitle:[self getTitleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self getImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        if ([[(PlayingCards*)card suit] isEqualToString:@"♥︎"] || [[(PlayingCards*)card suit] isEqualToString:@"♦︎"])
        {
            [cardButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        } else {
            [cardButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %ld", self.game.score]];
    
}

- (NSString *)getTitleForCard:(Card*)card {
    if (card.isChosen) {
        return card.contents;
    }
    
    return @"";
}

- (UIImage *)getImageForCard:(Card*)card {
    if (card.isChosen) {
        return [UIImage imageNamed:@"blank"];
    }
    
    return [UIImage imageNamed:@"back"];
}

@end
