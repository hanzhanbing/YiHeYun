//
//  UserInfo.h
//  ArtEast
//
//  Created by yibao on 16/9/30.
//  Copyright © 2016年 北京艺宝网络文化有限公司. All rights reserved.
//

/**
 *  用户Modle
 *
 */

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (nonatomic,copy) NSString *accountId;
@property (nonatomic,copy) NSString *age;
@property (nonatomic,copy) NSString *ageRange;
@property (nonatomic,copy) NSString *attachmentIds;
@property (nonatomic,copy) NSString *avatorUrl;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *expertId;
@property (nonatomic,copy) NSString *gender;

@property (nonatomic,copy) NSString *guardianMobileNo;
@property (nonatomic,copy) NSString *guardianMobileNo2;
@property (nonatomic,copy) NSString *guardianName;
@property (nonatomic,copy) NSString *guardianName2;
@property (nonatomic,copy) NSString *guardianRelationship;
@property (nonatomic,copy) NSString *guardianRelationship2;
@property (nonatomic,copy) NSString *healthyType;
@property (nonatomic,copy) NSString *healthyTypeDetail;

@property (nonatomic,copy) NSString *ID;
@property (nonatomic,copy) NSString *idCard;
@property (nonatomic,copy) NSString *integralPoints;
@property (nonatomic,copy) NSString *internalNumber;
@property (nonatomic,copy) NSString *joinTime;
@property (nonatomic,copy) NSString *level;
@property (nonatomic,copy) NSString *memberId;
@property (nonatomic,copy) NSString *memberName;
@property (nonatomic,copy) NSString *mobileNo;
@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *note;
@property (nonatomic,copy) NSString *oldPwd;
@property (nonatomic,copy) NSString *orgId;
@property (nonatomic,copy) NSString *password;
@property (nonatomic,copy) NSString *qqNo;
@property (nonatomic,copy) NSString *roleId;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *tableName;
@property (nonatomic,copy) NSString *terminalId;
@property (nonatomic,copy) NSString *wechatNo;

+ (UserInfo *)share;

- (void)getUserInfo;

- (void)setUserInfo:(NSDictionary *)userDic;

@end
