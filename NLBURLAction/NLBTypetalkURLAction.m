//
//  NLBTypetalkURLAction.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBTypetalkURLAction.h"

@implementation NLBTypetalkURLAction

- (NSString *)name {
    return @"Typetalk";
}

- (NSURL *)customSchemeURLWithURL:(NSURL *)url {
    static NSRegularExpression* regex;
    if (!regex) {
        regex = [NSRegularExpression
            regularExpressionWithPattern:@"^https://typetalk[.]in/topics/([0-9]+)(/posts/([0-9]+))?$"
                                 options:0 error:nil];
    }
    NSTextCheckingResult *match = [regex firstMatchInString:url.absoluteString options:NSMatchingReportProgress range:NSMakeRange(0, url.absoluteString.length)];
    if (match.numberOfRanges == 4 && [match rangeAtIndex:2].length == 0) {
        NSString *topicId = [url.absoluteString substringWithRange:[match rangeAtIndex:1]];
        return [NSURL URLWithString:[NSString stringWithFormat:@"nulabtypetalk://topics/%@", topicId]];
    } else if (match.numberOfRanges == 4 && [match rangeAtIndex:2].length > 0) {
        NSString *topicId = [url.absoluteString substringWithRange:[match rangeAtIndex:1]];
        NSString *postId = [url.absoluteString substringWithRange:[match rangeAtIndex:3]];
        return [NSURL URLWithString:[NSString stringWithFormat:@"nulabtypetalk://topics/%@/posts/%@", topicId, postId]];
    } else {
        return nil;
    }
}

@end
