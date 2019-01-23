//
//  FUDUserViewModel.m
//  FUDTestMVVM
//
//  Created by 兰福东 on 2019/1/23.
//  Copyright © 2019 fudo. All rights reserved.
//

#import "FUDUserViewModel.h"
#import "FUDUser.h"

@interface FUDUserViewModel ()

@property (nonatomic, strong) FUDUser *user;

@end

@implementation FUDUserViewModel

- (instancetype)initWithUser:(FUDUser *)user {
    self = [super init];
    if (self) {
        _user = user;
    }
    return self;
}

+ (NSArray<FUDUserViewModel *> *)viewModels {
    FUDUser *user1 = [FUDUser new];
    user1.name = @"赵四";
    user1.sex = FUDSexMale;
    user1.birthYear = 1955;
    user1.birthMonth = 2;
    user1.birthDay = 4;
    user1.thumbnail = @"https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1548226473&di=a2ea60b7c8d4c09cfb2cd330402cf9b0&src=http://vpic.video.qq.com/57518785/j0372geyzic_ori_3.jpg";
    FUDUserViewModel *viewModel1 = [[FUDUserViewModel alloc] initWithUser:user1];
    
    FUDUser *user2 = [FUDUser new];
    user2.name = @"海燕";
    user2.sex = FUDSexFemale;
    user2.birthYear = 1967;
    user2.birthMonth = 7;
    user2.birthDay = 28;
    user2.thumbnail = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548236788313&di=834aafdfc064cdd7cf415c2bba071dc5&imgtype=0&src=http%3A%2F%2Fimg4.cache.netease.com%2Fhouse%2F2016%2F3%2F27%2F201603271208564ac91.jpg";
    FUDUserViewModel *viewModel2 = [[FUDUserViewModel alloc] initWithUser:user2];
    
    FUDUser *user3 = [FUDUser new];
    user3.name = @"五亿烦";
    user3.sex = FUDSexUnknown;
    user3.birthYear = 1987;
    user3.birthMonth = 5;
    user3.birthDay = 4;
    user3.thumbnail = @"http://bpic.588ku.com/element_origin_min_pic/17/07/20/1c5cce347fe1600afbd5e7582b200743.jpg";
    FUDUserViewModel *viewModel3 = [[FUDUserViewModel alloc] initWithUser:user3];
    
    return @[viewModel1, viewModel2, viewModel3];
}

- (NSString *)userName {
    switch (self.user.sex) {
        case FUDSexMale:
            return [NSString stringWithFormat:@"尼古拉斯·%@", self.user.name];
        case FUDSexFemale:
            return [NSString stringWithFormat:@"安室奈美·%@", self.user.name];
        case FUDSexUnknown:
            return [NSString stringWithFormat:@"东方不败·%@", self.user.name];
    }
}

- (NSString *)sexString {
    NSString *sex;
    switch (self.user.sex) {
        case FUDSexMale:
            sex = @"男";
            break;
        case FUDSexFemale:
            sex = @"女";
            break;
        case FUDSexUnknown:
            sex = @"保密";
            break;
    }
    return sex;
}

- (NSString *)birthday {
    return [NSString stringWithFormat:@"%ld年%ld月%ld日", self.user.birthYear, self.user.birthMonth, self.user.birthDay];
}

- (NSString *)introduction {
    return [NSString stringWithFormat:@"姓名：%@，性别：%@", self.user.name, [self sexString]];
}

- (void)downloadThumbnailCompletion:(void (^)(UIImage *image))completion {
    if (self.user.thumbnail.length == 0) {
        if (completion) {
            completion(nil);
        }
        return;
    }
    
    NSURLSessionTask *task = [NSURLSession.sharedSession dataTaskWithURL:[NSURL URLWithString:self.user.thumbnail] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                if (completion) {
                    completion(nil);
                }
            } else {
                UIImage *image = [UIImage imageWithData:data];
                if (completion) {
                    completion(image);
                }
            }
        });
    }];
    [task resume];
}

@end
