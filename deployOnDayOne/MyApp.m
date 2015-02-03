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
//  [self questionList];
    NSArray *genericQuestions = @[@"Where are you?", @"Whats your fav color?", @"Whats your fav animal?"];
    NSMutableArray *questions = [NSMutableArray arrayWithArray:genericQuestions];
    self.motherDict = [[NSMutableDictionary alloc] init];
    self.questionsAndAnswers = [[NSMutableDictionary alloc] init];
    [self login];
    [self menu];
    }

-(void)login {
    
    NSLog(@"Log in");

    NSString *name = [self requestKeyboardInput];
        if (!self.motherDict[name]) {
            [self.motherDict setObject:self.questionsAndAnswers forKey:name];
        }
}

-(void)logout {
    NSLog(@"You have been logged out.");
    [self login];
}

-(NSString *)menu {
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

//-(NSMutableArray *)questionList {
//    NSArray *genericQuestions = @[@"Where are you?", @"Whats your fav color?", @"Whats your fav animal?"];
//    NSMutableArray *questions = [NSMutableArray arrayWithArray:genericQuestions];
//    return self.questions;
//}

-(void)optionOne {
    for (NSString *question in self.questions) {
        NSLog(@"%@", question);
        NSString *response = [self requestKeyboardInput];
        [self.questionsAndAnswers setObject:response forKey:question];
    }
    [self menu];
}
-(void)optionTwo {
        NSLog(@"What question would you like to add?");
        NSString *newQuestion = [self requestKeyboardInput];
        [self.questions addObject:newQuestion];
        NSLog(@"Thanks! We've added your question to our interview");
        NSLog(@"%@", self.questions);
    [self menu];
}

-(void)optionThree {
    NSLog(@"Not implimented yet.");
    [self menu];
}

-(void)optionFour {
    [self logout];
}

/*

    
    NSMutableArray *questions = [[NSMutableArray alloc] init];
 
    
    
    if ([menuChoice isEqualToString:@"1"])
    {
        questions = [NSMutableArray arrayWithArray:genericQuestions];
        for (NSString *question in questions) {
            NSLog(@"%@", question);
            NSString *response = [self requestKeyboardInput];
            [questionsAndAnswers setObject:response forKey:question];
        }

        
        NSLog(@"%@", motherDict);
        
    }
    else if ([menuChoice isEqualToString:@"2"])
    {
        NSLog(@"Enter your new question");
        NSString *inputNewQuestion = [self requestKeyboardInput];
        [questions addObject:inputNewQuestion];
        NSLog(@"The array is ..... %@",questions);
        [self oneLargeMethod];
    }
    else if ([menuChoice isEqualToString:@"3"])
    {
        NSLog(@"You choose three.");
    }

}
*/

// DON'T MODIFY ME
-(NSString *)requestKeyboardInput {
    char string[4096]; //Technically there should be some safety on this to avoid an error if you write too much.
    fgets(string, sizeof(string), stdin);
    NSString *result = [NSString stringWithUTF8String:string];
    return [result stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
}

@end
