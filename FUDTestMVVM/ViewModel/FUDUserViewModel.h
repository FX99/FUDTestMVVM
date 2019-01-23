//
//  FUDUserViewModel.h
//  FUDTestMVVM
//
//  Created by 兰福东 on 2019/1/23.
//  Copyright © 2019 fudo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FUDUser;

NS_ASSUME_NONNULL_BEGIN

@interface FUDUserViewModel : NSObject

- (instancetype)initWithUser:(FUDUser *)user;
- (NSString *)introduction;
- (NSString *)birthday;
- (NSString *)userName;
- (NSString *)sexString;

+ (NSArray<FUDUserViewModel *> *)viewModels;
- (void)downloadThumbnailCompletion:(void (^)(UIImage *image))completion;

@end

NS_ASSUME_NONNULL_END
