//
//  FUDLoginViewModel.h
//  FUDTestMVVM
//
//  Created by 兰福东 on 2019/1/22.
//  Copyright © 2019 fudo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FUDUser;

NS_ASSUME_NONNULL_BEGIN

@interface FUDLoginViewModel : NSObject

@property (nonatomic, strong, readonly) FUDUser *user;
@property (nonatomic, assign, readonly) BOOL isLogin;

- (instancetype)initWithUser:(FUDUser *)user;
- (void)login;

@end

NS_ASSUME_NONNULL_END
