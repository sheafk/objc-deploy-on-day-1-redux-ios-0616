//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()

@property (nonatomic, strong) NSMutableArray *board;

@end


@implementation FISTicTacToeGame

-(instancetype)init
{
    self = [super init];
    if(self) {
        [self resetBoard];
    }
                                                    //Need to figure out how to add to board. Use self.board to call the mutable array. Now we have to add arrays to it.
    return self;
}


-(void)resetBoard
{
    self.board = [[NSMutableArray alloc]init];
    [self.board addObject:[NSMutableArray arrayWithObjects:@"", @"", @"", nil]];
    [self.board addObject:[NSMutableArray arrayWithObjects:@"", @"", @"", nil]];
    [self.board addObject:[NSMutableArray arrayWithObjects:@"", @"", @"", nil]];
    
    //[self.board removeAllObjects];
    //[self.board addObject:makeArrayEmpty];
   // NSLog(@"What does the board look like: %@",self.board);
}

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    
    NSString *isThereXOrO = self.board[column][row];
    
    return isThereXOrO;
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    NSString *isThereXOrO = self.board[column][row];
    
    BOOL freeSpace = ([isThereXOrO  isEqual: @""]);
    //NSLog(@"Bool value: %d", freeSpace);
    
    return freeSpace;
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    self.board[column][row] = @"X";
    //NSLog(@"What does the board look like: %@", _board.self);
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{
   self.board[column][row] = @"O";

}

-(NSString *)winningPlayer {
    
    NSArray *allXes = @[ @"X", @"X", @"X" ];
    NSArray *allOs = @[ @"O", @"O", @"O" ];
    
    //NSLog(@"Find first object: %@", [self.board firstObject]);
    //NSLog(@"Let's look at self.board[0] %@", self.board[0]); // first column
    //NSLog(@"Let's look at self.board[1] %@", self.board[1]); // second column
    //NSLog(@"Let's look at self.board[2] %@", self.board[2]); // third column
    
    NSMutableArray *topRow = [[NSMutableArray alloc]initWithObjects:self.board[0][0], self.board[1][0], self.board[2][0], nil];
    //[topRow addObject:self.board[0][0]];
    //[topRow addObject:self.board[1][0]];
    //[topRow addObject:self.board[2][0]];
    //NSLog(@"Top Row: %@", topRow);
    
    NSMutableArray *middleRow = [[NSMutableArray alloc]initWithObjects:self.board[0][1], self.board[1][1], self.board[2][1], nil];
    //[middleRow addObject:self.board[0][1]];
    //[middleRow addObject:self.board[1][1]];
    //[middleRow addObject:self.board[2][1]];
    //NSLog(@"Middle Row: %@", middleRow);
    
    NSMutableArray *bottomRow = [[NSMutableArray alloc]initWithObjects:self.board[0][2], self.board[1][2], self.board[2][2],  nil];
    //[bottomRow addObject:self.board[0][2]];
    //[bottomRow addObject:self.board[1][2]];
    //[bottomRow addObject:self.board[2][2]];
    //NSLog(@"Bottom Row: %@", bottomRow);
    
    NSMutableArray *diagonalOne = [[NSMutableArray alloc]initWithObjects:self.board[0][0], self.board[1][1], self.board[2][2],  nil];
    NSMutableArray *diagonalTwo = [[NSMutableArray alloc]initWithObjects:self.board[2][0], self.board[1][1], self.board[0][2],  nil];
    
    NSString *winner = @"";
    
    if (([self.board[0] isEqualToArray: allOs]) || ([self.board[1] isEqualToArray: allOs]) || ([self.board[2] isEqualToArray: allOs]) || ([topRow isEqualToArray: allOs]) || ([middleRow isEqualToArray: allOs]) || ([bottomRow isEqualToArray: allOs]) || ([diagonalOne isEqualToArray: allOs]) || ([diagonalTwo isEqualToArray: allOs])){
        winner = @"O";
        NSLog(@"O WINS! %@", winner);
        return winner;
    }
    
    
    else if ([self.board[0] isEqualToArray: allXes] || ([self.board[1] isEqualToArray: allXes]) || ([self.board[2] isEqualToArray: allXes]) || ([topRow isEqualToArray: allXes]) || ([middleRow isEqualToArray: allXes]) || ([bottomRow isEqualToArray: allXes]) || ([diagonalOne isEqualToArray: allXes]) || ([diagonalTwo isEqualToArray: allXes])) {
        winner = @"X";
        NSLog(@"X WINS!");
        return winner;
    }

return winner;
}

//Make some kinf of round counter if round is equal to 9 (board is filled) but the winningPlayer method does not return @"X" or @"O" then it should say "DRAW".



-(BOOL)isADraw //Right now it is calling a draw too soon when I set the if statment to YES. Figure out how to get a couple of rounds and then detect a draw when there is, in face, a draw.
{
    if ((![self.board[0] containsObject:@""]) && (![self.board[1] containsObject:@""]) && (![self.board[2] containsObject:@""])){
        return YES;
    }

    //for (NSUInteger i = 0; i < 10; i++) {
       // if ((i == 9) && [self.winningPlayer isEqualToString:@""])
       // return YES;
    
    return nil;
}

@end

