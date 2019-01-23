//
//  FUDLoginViewModel.m
//  FUDTestMVVM
//
//  Created by 兰福东 on 2019/1/22.
//  Copyright © 2019 fudo. All rights reserved.
//

#import "FUDLoginViewModel.h"
#import "FUDUser.h"

@interface FUDLoginViewModel ()

@property (nonatomic, strong) FUDUser *user;
@property (nonatomic, assign) BOOL isLogin;

@end

@implementation FUDLoginViewModel

- (instancetype)initWithUser:(FUDUser *)user {
    self = [super init];
    if (self) {
        _user = user;
    }
    return self;
}

- (void)login {
    if ([self.user.name isEqualToString:@"FUDTestMVVM"] && [self.user.password isEqualToString:@"123456"]) {
        self.isLogin = YES;
    } else {
        self.isLogin = NO;
    }
}

@end
