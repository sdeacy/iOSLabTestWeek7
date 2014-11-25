//
//  ViewController.m
//  SDWeek7iOSLabTest
//
//  Created by Seamus Deacy on 25/11/2014.
//  Copyright (c) 2014 s deacy. All rights reserved.
//

#import "ViewController.h"
#import "SDtwitProtoTypeCell.h"
#import "SDTweet.h"
#import "AFNetworking.h"



@interface ViewController ()
@property NSMutableArray *Tweets;
@property NSDictionary *responseDictionary;
@property NSMutableArray *tweetsToDisplay;



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _tweetsToDisplay = [[NSMutableArray alloc] init];
    _tableView.dataSource = self;
    [self getData];
    
}

-(void)getData{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [manager GET:@"https://raw.githubusercontent.com/zdavison/DIT.iOS1/master/Week4/sample.json"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             _responseDictionary = (NSDictionary*)responseObject;
             NSArray *tweetsArray = _responseDictionary[@"statuses"];
             NSLog(@"tweets size %d",[tweetsArray count]);
             for (id tweet in tweetsArray) {
                 SDTweet *sdTweet = [[SDTweet alloc] init];
                 
                 NSString *tweetText = tweet[@"text"];
                 
                 NSDictionary *hashTagsDict = tweet[@"entities"];
                 NSArray *hashTagsArray = hashTagsDict[@"hashtags"];
                 NSDictionary *htagsDict = hashTagsArray[0];
                 NSString *htags = htagsDict[@"text"];
                 NSLog(@"...%@",htags);
                 
                 NSDictionary *userDict = tweet[@"user"];
                 NSString *uName = userDict[@"name"];
                 NSLog(@"name : %@",uName);
                 
                 NSString *createdAt = tweet[@"created_at"];
                 
                 
                 [sdTweet setTweetText:tweetText];
                 [sdTweet setHashTags:htags];
                 [sdTweet setUserName:uName];
                 [sdTweet setDate:createdAt];
                 
                 [_tweetsToDisplay addObject:sdTweet];
                 

             }
             [_tableView reloadData];

         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error");
         }];
    
    
   

    
  
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"_tweetsToDisplay count: %d",[_tweetsToDisplay count]);
    return [_tweetsToDisplay count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SDtwitProtoTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twitProtoTypeCellIdentifier"];
    SDTweet *tweet = _tweetsToDisplay[indexPath.row];
    cell.userLabel.text = [tweet userName];
    cell.dateLabel.text = [tweet date];
    cell.hashTagsLabel .text = [tweet hashTags];
    cell.tweetTextField.text = [tweet tweetText];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
