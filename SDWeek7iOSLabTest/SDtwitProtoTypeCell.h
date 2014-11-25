//
//  SDtwitProtoTypeCell.h
//  SDWeek7iOSLabTest
//
//  Created by Seamus Deacy on 25/11/2014.
//  Copyright (c) 2014 s deacy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SDtwitProtoTypeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel        *userLabel;
@property (weak, nonatomic) IBOutlet UILabel        *dateLabel;
@property (weak, nonatomic) IBOutlet UITextField    *tweetTextField;
@property (weak, nonatomic) IBOutlet UILabel        *hashTagsLabel;

@end
