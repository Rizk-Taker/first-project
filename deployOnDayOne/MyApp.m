//
//  MyApp.m
//  deployOnDayOne
//
//  Created by Zachary Drossman on 1/28/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import "MyApp.h"


@interface MyApp()

@end

@implementation MyApp

-(void)execute {
    
    self.motherDict = [[NSMutableDictionary alloc] init];
    self.currentUser = [[NSString alloc] init];
    self.questions = [[NSMutableArray alloc] initWithArray:@[@"Where are you?", @"Whats your fav color?", @"Whats your fav animal?"]];
  
    [self login];

}


-(NSString *)login {

    NSLog(@"Please enter your full name to log in");
    self.currentUser = [self requestKeyboardInput];
    

    [self menu];
    return self.currentUser;
    
}

-(void)logout {
    NSLog(@"You have been logged out.");
    [self login];
}

-(NSString *)menu {
    NSLog(@"dictionary ..... %@", self.motherDict);
    NSLog(@"Please choose from the following four options:\r\r1. Be interviewed.\r2. Write a new interview question.\r3. Read an interview with another student.\r4. Logout\r\rSimply type in the option number you are interested in, and press enter.");
    NSInteger menuChoice = [[self requestKeyboardInput] intValue];
    switch (menuChoice) {
        case 1:
            [self optionOne];
            break;
        case 2:
            [self optionTwo];
            break;
        case 3:
            [self optionThree];
            break;
        case 4:
            [self optionFour];
            break;
        default:
            NSLog(@"Sorry, try again.");
            [self menu];
            break;
    }
    return [self requestKeyboardInput];
}

-(void)optionOne {
    if (!self.motherDict[self.currentUser]) {
        NSMutableDictionary *questionsAndAnswers = [[NSMutableDictionary alloc] init];
        self.motherDict[self.currentUser] = questionsAndAnswers;
        [self.motherDict setObject:questionsAndAnswers forKey:self.currentUser];
    }
    for (NSString *question in self.questions) {
        NSLog(@"%@", question);
        self.response = [self requestKeyboardInput];
        NSMutableDictionary *currentUserDict = self.motherDict[self.currentUser];
        [currentUserDict setObject:self.response forKey:question];
        
    }

    [self menu];
}


-(void)optionTwo {
        NSLog(@"What question would you like to add?");
        NSString *newQuestion = [self requestKeyboardInput];
        [self.questions addObject:newQuestion];
        NSLog(@"Thanks! We've added your question to our interview");
    
    [self menu];
    

    
}

-(void)optionThree {
    NSLog(@"Not implimented yet.");
    [self menu];
}

-(void)optionFour {
    [self logout];
}




// DON'T MODIFY ME
-(NSString *)requestKeyboardInput {
    char string[4096]; //Technically there should be some safety on this to avoid an error if you write too much.
    fgets(string, sizeof(string), stdin);
    NSString *result = [NSString stringWithUTF8String:string];
    return [result stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
}

@end
