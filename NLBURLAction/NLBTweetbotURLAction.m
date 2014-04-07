//
//  NLBTweetbotURLAction.m
//
//  Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import "NLBTweetbotURLAction.h"

@implementation NLBTweetbotURLAction
- (NSString *)name {
    return @"Tweetbot";
}

- (NSURL *)customSchemeURLWithURL:(NSURL *)url {
    static NSRegularExpression* regex;
    if (!regex) {
        regex = [NSRegularExpression
            regularExpressionWithPattern:@"^https?[:]//twitter[.]com/([a-zA-Z0-9_]+)(/status/([0-9]+))?$"
                                 options:0 error:nil];
    }
    NSTextCheckingResult *match = [regex firstMatchInString:url.absoluteString options:NSMatchingReportProgress range:NSMakeRange(0, url.absoluteString.length)];
    if (match.numberOfRanges == 4 && [match rangeAtIndex:2].length == 0) {
        NSString *user = [url.absoluteString substringWithRange:[match rangeAtIndex:1]];
        return [self appendCallbackURL:[NSURL URLWithString:[NSString stringWithFormat:@"tweetbot://%@/user_profile/%@", user, user]]];
    } else if (match.numberOfRanges == 4 && [match rangeAtIndex:2].length > 0) {
        NSString *user = [url.absoluteString substringWithRange:[match rangeAtIndex:1]];
        NSString *statusId = [url.absoluteString substringWithRange:[match rangeAtIndex:3]];
        return [self appendCallbackURL:[NSURL URLWithString:[NSString stringWithFormat:@"tweetbot://%@/status/%@", user, statusId]]];
    } else {
        return nil;
    }
}

- (NSURL *)appendCallbackURL:(NSURL *)url {
    if (self.callbackURL) {
        return [NSURL URLWithString:[NSString stringWithFormat:@"%@?callback_url=%@", url.absoluteString, [NLBDefaultURLAction urlEncode:self.callbackURL.absoluteString]]];
    } else {
        return url;
    }
}

@end
