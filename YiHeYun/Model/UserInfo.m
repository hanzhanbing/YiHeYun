//
//  UserInfo.m
//  ArtEast
//
//  Created by yibao on 16/9/30.
//  Copyright © 2016年 北京艺宝网络文化有限公司. All rights reserved.
//

#import "UserInfo.h"

static UserInfo *_userInfo = nil;
static NSUserDefaults *_defaults = nil;

@implementation UserInfo

+ (instancetype)share
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _userInfo = [[UserInfo alloc] init];
        _defaults = [NSUserDefaults standardUserDefaults];
    });
    return _userInfo;
}

- (void)getUserInfo {
    
    NSDictionary *userDic = [_defaults objectForKey:@"UserInfo"];
    if (userDic) {
        [self loadUserDic:userDic];
    }
}

- (void)setUserInfo:(NSDictionary *)userDic {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:userDic forKey:@"UserInfo"];
    [defaults synchronize];
    
    [self loadUserDic:userDic];
}

- (void)loadUserDic:(NSDictionary *)userDic {
    
    self.accountId = userDic[@"accountId"];;
    self.age = userDic[@"age"];;
    self.ageRange = userDic[@"ageRange"];;
    self.attachmentIds = userDic[@"attachmentIds"];;
    self.avatorUrl = userDic[@"avatorUrl"];;
    self.desc = userDic[@"description"];;
    self.expertId = userDic[@"expertId"];;
    self.gender = userDic[@"gender"];;
    
    self.guardianMobileNo = userDic[@"guardianMobileNo"];;
    self.guardianMobileNo2 = userDic[@"guardianMobileNo2"];;
    self.guardianName = userDic[@"guardianName"];;
    self.guardianName2 = userDic[@"guardianName2"];;
    self.guardianRelationship = userDic[@"guardianRelationship"];;
    self.guardianRelationship2 = userDic[@"guardianRelationship2"];;
    self.healthyType = userDic[@"healthyType"];;
    self.healthyTypeDetail = userDic[@"healthyTypeDetail"];;
    self.ID = userDic[@"id"];;
    self.idCard = userDic[@"idCard"];;
    
    self.integralPoints = userDic[@"integralPoints"];;
    self.internalNumber = userDic[@"internalNumber"];;
    self.joinTime = userDic[@"joinTime"];
    self.level = userDic[@"level"];;
    self.memberId = userDic[@"memberId"];;
    self.memberName = userDic[@"memberName"];
    
    self.mobileNo = userDic[@"mobileNo"];;
    self.name = userDic[@"name"];;
    self.note = userDic[@"note"];
    self.oldPwd = userDic[@"oldPwd"];;
    self.orgId = userDic[@"orgId"];;
    self.password = userDic[@"password"];
    
    self.qqNo = userDic[@"qqNo"];;
    self.roleId = userDic[@"roleId"];;
    self.source = userDic[@"source"];
    self.status = userDic[@"status"];;
    self.tableName = userDic[@"tableName"];;
    self.terminalId = userDic[@"terminalId"];
    self.wechatNo = userDic[@"wechatNo"];
}

@end
