//
//  NLBTwitterURLActionTest.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NLBTweetbotURLAction.h"

@interface NLBTweetbotURLActionTest : XCTestCase

@end

@implementation NLBTweetbotURLActionTest

- (void)testStatusCustomSchemeURLWithURLSuccess {
    NLBTweetbotURLAction *action = [[NLBTweetbotURLAction alloc] init];
    action.callbackURL = [NSURL URLWithString:@"nlburlactionexmple://"];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://twitter.com/agata/status/451892810430439424"]];
    XCTAssertEqualObjects(@"tweetbot://agata/status/451892810430439424?callback_url=nlburlactionexmple%3A%2F%2F", url.absoluteString);
}

- (void)testStatusCustomSchemeURLWithURLDontGetCustomSchemeURL {
    NLBTweetbotURLAction *action = [[NLBTweetbotURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://twittercom/agata/status/451892810430439424"]];
    XCTAssertNil(url.absoluteString);
}

- (void)testUserCustomSchemeURLWithURLSuccess {
    NLBTweetbotURLAction *action = [[NLBTweetbotURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://twitter.com/agata"]];
    XCTAssertEqualObjects(@"tweetbot://agata/user_profile/agata", url.absoluteString);
}

- (void)testUserCustomSchemeURLWithURLDontGetCustomSchemeURL {
    NLBTweetbotURLAction *action = [[NLBTweetbotURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://twittercom/agata"]];
    XCTAssertNil(url.absoluteString);
}

@end
