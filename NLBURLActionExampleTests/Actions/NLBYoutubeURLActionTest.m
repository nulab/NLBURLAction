//
//  NLBYoutubeURLActionTest.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NLBYoutubeURLAction.h"

@interface NLBYoutubeURLActionTest : XCTestCase

@end

@implementation NLBYoutubeURLActionTest

- (void)testCustomSchemeURLWithURLSuccess1 {
    NLBYoutubeURLAction *action = [[NLBYoutubeURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"http://youtube.com/watch=abcde12345"]];
    XCTAssertEqualObjects(@"youtube://youtube.com/watch=abcde12345", url.absoluteString);
}

- (void)testCustomSchemeURLWithURLSuccess2 {
    NLBYoutubeURLAction *action = [[NLBYoutubeURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"http://youtu.be/watch=abcde12345"]];
    XCTAssertEqualObjects(@"youtube://youtu.be/watch=abcde12345", url.absoluteString);
}

- (void)testCustomSchemeURLWithURLSuccess3 {
    NLBYoutubeURLAction *action = [[NLBYoutubeURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"http://m.youtube.com/watch=abcde12345"]];
    XCTAssertEqualObjects(@"youtube://m.youtube.com/watch=abcde12345", url.absoluteString);
}

- (void)testCustomSchemeURLWithURLSuccess4 {
    NLBYoutubeURLAction *action = [[NLBYoutubeURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"http://www.youtube.com/watch=abcde12345"]];
    XCTAssertEqualObjects(@"youtube://www.youtube.com/watch=abcde12345", url.absoluteString);
}

- (void)testCustomSchemeURLWithURLDontGetCustomSchemeURL {
    NLBYoutubeURLAction *action = [[NLBYoutubeURLAction alloc] init];
    NSURL *url = [action customSchemeURLWithURL:[NSURL URLWithString:@"http://ayoutube.com"]];
    XCTAssertNil(url.absoluteString);
}

@end
