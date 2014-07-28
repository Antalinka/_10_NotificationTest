//
//  GRDoctor.m
//  _10_NotificationTest
//
//  Created by Exo-terminal on 3/14/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRDoctor.h"
#import "GRGovernment.h"

@implementation GRDoctor
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(salaryChangeNotification:)
                   name:GRGovernmentSalaryDidChangeNotification
                 object:nil];
        [nc addObserver:self
               selector:@selector(pensionChangeNotification:)
                   name:GRGovernmentAveragePriceUserInfoKey
                 object:nil];
    }
    return self;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
#pragma mark - notification

-(void)salaryChangeNotification:(NSNotification*)notification{
    
    NSNumber* value = [notification.userInfo objectForKey:GRGovernmentSalaryUserInfoKey];
    CGFloat salary = [value floatValue];
    if (salary<self.salary) {
        NSLog(@"Doctors are not happy");
    }else{
        NSLog(@"Doctors are happy");
    }
    
    self.salary = salary;
}
-(void)pensionChangeNotification:(NSNotification*)notification{
 
}
@end
