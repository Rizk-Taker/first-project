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
    self.questions = [[NSMutableArray alloc] initWithArray:@[@"Where is the coolest place you've been to?", @"If you could only bring one thing with you to a deserted island, what would it be?", @"What is your favorite movie of all time?"]];
  
    [self login];

}

-(void)login {

    NSLog(@"Please enter your full name to log in");
    self.currentUser = [self requestKeyboardInput];

    [self menu];
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
    
    NSLog(@"Would you like generic or specific questions?\rOur categories are:\rGeneric\rSports\rProgramming\rTravel\rArt");
    NSString *reply = [self requestKeyboardInput];
    
    if ([[reply lowercaseString] isEqualToString:@"sports"]) {
        NSArray *sportsQuestions = @[@"What is your favorite sport?", @"What is your favorite sports team?", @"Who is your favorite athlete?"];
        for (NSString *question in sportsQuestions) {
            NSLog(@"%@", question);
            self.response = [self requestKeyboardInput];
            NSMutableDictionary *currentUserDict = self.motherDict[self.currentUser];
            [currentUserDict setObject:self.response forKey:question];
        }
    }
    else if ([[reply lowercaseString] isEqualToString:@"food"]) {
        NSArray *foodQuestions = @[@"Do you consider yourself a foodie?", @"What is your favorite cuisine?", @"What is your least favorite food?"];
        for (NSString *question in foodQuestions) {
            NSLog(@"%@", question);
            self.response = [self requestKeyboardInput];
            NSMutableDictionary *currentUserDict = self.motherDict[self.currentUser];
            [currentUserDict setObject:self.response forKey:question];
        }
    }
    else if ([[reply lowercaseString] isEqualToString:@"programming"]) {
        NSArray *programmingQuestions = @[@"What's been your favorite part of Flatiron so far?", @"Why did you choose the iOS track?", @"What projects interest you?"];
        for (NSString *question in programmingQuestions) {
            NSLog(@"%@", question);
            self.response = [self requestKeyboardInput];
            NSMutableDictionary *currentUserDict = self.motherDict[self.currentUser];
            [currentUserDict setObject:self.response forKey:question];
        }
    }
    else if ([[reply lowercaseString] isEqualToString:@"travel"]) {
        NSArray *travelQuestions = @[@"If you could leave tomorrow, where would you travel to?", @"What's been you favorite destination so far?", @"How many continents have you been to?"];
        for (NSString *question in travelQuestions) {
            NSLog(@"%@", question);
            self.response = [self requestKeyboardInput];
            NSMutableDictionary *currentUserDict = self.motherDict[self.currentUser];
            [currentUserDict setObject:self.response forKey:question];
        }
    }
    else if ([[reply lowercaseString] isEqualToString:@"generic"]) {
        for (NSString *question in self.questions) {
        NSLog(@"%@", question);
        self.response = [self requestKeyboardInput];
        NSMutableDictionary *currentUserDict = self.motherDict[self.currentUser];
        [currentUserDict setObject:self.response forKey:question];
        }
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
