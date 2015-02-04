//
//  MyApp.h
//  deployOnDayOne
//
//  Created by Zachary Drossman on 1/28/15.
//  Copyright (c) 2015 Zachary Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyApp : NSObject

-(void)login;
-(void)logout;
-(NSString *)menu;
-(void)optionOne;
-(void)optionTwo;
-(void)optionThree;
-(void)optionFour;

@property (strong, nonatomic, readwrite) NSString *currentUser;
@property (strong, nonatomic, readwrite) NSString *response;
@property (strong, nonatomic) NSMutableDictionary *motherDict;
@property (strong, nonatomic) NSMutableArray *questions;


-(void)execute;


@end
