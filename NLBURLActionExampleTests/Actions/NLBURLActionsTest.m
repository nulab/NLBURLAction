//
//  NLBGoogleDriveURLActionTest.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NLBURLActions.h"

@interface NLBURLActionsTest : XCTestCase

@end

@implementation NLBURLActionsTest

- (void)testActionClasses {
    NSArray *classes = [NLBURLActions actionClasses];
    XCTAssertEqual(7, classes.count);
}

- (void)testActionClassesWithExcludeActionClasses {
    NSArray *classes = [NLBURLActions actionClassesWithExcludeActionClasses:@[[NLBPasteboardURLAction class]]];
    XCTAssertEqual(6, classes.count);
    XCTAssertEqual(false, [classes containsObject:[NLBPasteboardURLAction class]]);
}

@end
