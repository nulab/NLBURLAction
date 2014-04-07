//
//  NLBTwitterURLActionTest.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NLBTypetalkURLAction.h"

@interface NLBTypetalkURLActionTest : XCTestCase

@end

@implementation NLBTypetalkURLActionTest

- (void)testPostCustomSchemeURLWithURLSuccess {
    NLBTypetalkURLAction *action = [[NLBTypetalkURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://typetalk.in/topics/123/posts/456"]];
    XCTAssertEqualObjects(@"nulabtypetalk://topics/123/posts/456", url.absoluteString);
}

- (void)testPostCustomSchemeURLWithURLDontGetCustomSchemeURL {
    NLBTypetalkURLAction *action = [[NLBTypetalkURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://typetalkin/topics/123/posts/456"]];
    XCTAssertNil(url.absoluteString);
}

- (void)testTopicCustomSchemeURLWithURLSuccess {
    NLBTypetalkURLAction *action = [[NLBTypetalkURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://typetalk.in/topics/123"]];
    XCTAssertEqualObjects(@"nulabtypetalk://topics/123", url.absoluteString);
}

- (void)testTopicCustomSchemeURLWithURLDontGetCustomSchemeURL {
    NLBTypetalkURLAction *action = [[NLBTypetalkURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"https://typetalkin/topics/123"]];
    XCTAssertNil(url.absoluteString);
}

@end
