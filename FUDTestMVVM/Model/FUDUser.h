//
//  FUDUser.h
//  FUDTestMVVM
//
//  Created by 兰福东 on 2019/1/22.
//  Copyright © 2019 fudo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FUDSex) {
    FUDSexUnknown,
    FUDSexMale,
    FUDSexFemale
};

@interface FUDUser : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, assign) FUDSex sex;
@property (nonatomic, assign) NSInteger birthYear;
@property (nonatomic, assign) NSInteger birthMonth;
@property (nonatomic, assign) NSInteger birthDay;
@property (nonatomic, copy) NSString *thumbnail;

@end

NS_ASSUME_NONNULL_END
