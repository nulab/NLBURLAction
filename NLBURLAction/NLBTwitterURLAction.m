//
//  NLBTwitterURLAction.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBTwitterURLAction.h"

@implementation NLBTwitterURLAction

- (NSString *)name {
    return @"Twitter";
}

- (NSURL *)customSchemeURLWithURL:(NSURL *)url {
    static NSRegularExpression* regex;
    if (!regex) {
        regex = [NSRegularExpression
            regularExpressionWithPattern:@"^https?[:]//twitter[.]com/([a-zA-Z0-9_]+(/status/([0-9]+))?)$"
                                 options:0 error:nil];
    }
    NSTextCheckingResult *match = [regex firstMatchInString:url.absoluteString options:NSMatchingReportProgress range:NSMakeRange(0, url.absoluteString.length)];
    if (match.numberOfRanges == 4 && [match rangeAtIndex:2].length == 0) {
        NSString *user = [url.absoluteString substringWithRange:[match rangeAtIndex:1]];
        return [NSURL URLWithString:[NSString stringWithFormat:@"twitter://user?screen_name=%@", user]];
    } else if (match.numberOfRanges == 4 && [match rangeAtIndex:2].length > 0) {
        NSString *statusId = [url.absoluteString substringWithRange:[match rangeAtIndex:3]];
        return [NSURL URLWithString:[NSString stringWithFormat:@"twitter://status?id=%@", statusId]];
    } else {
        return nil;
    }
}

@end
