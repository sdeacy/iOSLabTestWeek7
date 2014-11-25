//
//  SDTweet.h
//  SDWeek7iOSLabTest
//
//  Created by Seamus Deacy on 25/11/2014.
//  Copyright (c) 2014 s deacy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDTweet : NSObject
@property (nonatomic, strong) NSString  *userName;
@property (nonatomic, strong) NSString  *date;
@property (nonatomic, strong) NSString  *tweetText;
@property (nonatomic, strong) NSString  *hashTags;

@end
