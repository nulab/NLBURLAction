//
//  NLBBacklogURLAction.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBBacklogURLAction.h"

@implementation NLBBacklogURLAction


- (NSString *)name {
    return @"Backlog";
}

- (NSURL *)customSchemeURLWithURL:(NSURL *)url {
    static NSRegularExpression* regex;
    if (!regex) {
        regex = [NSRegularExpression
            regularExpressionWithPattern:@"^https[:]//([0-9a-zA-Z-]+[.](backlog[.]jp|backlogtool[.]com))/view/([A-Z]+[-][0-9]+.*)$"
                                                          options:0 error:nil];
    }
    NSTextCheckingResult *match = [regex firstMatchInString:url.absoluteString options:NSMatchingReportProgress range:NSMakeRange(0, url.absoluteString.length)];
    if (match.numberOfRanges == 4) {
        NSString *domain = [url.absoluteString substringWithRange:[match rangeAtIndex:1]];
        NSString *issueKey = [url.absoluteString substringWithRange:[match rangeAtIndex:3]];
        return [NSURL URLWithString:[NSString stringWithFormat:@"nulabbacklog://%@/issue/%@", domain, issueKey]];
    } else {
        return nil;
    }
}
@end
