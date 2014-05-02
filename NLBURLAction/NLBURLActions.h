//
// Created by Toshitaka Agata on 4/8/14.
// Copyright (c) 2014 Nulab Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NLBBacklogURLAction.h"
#import "NLBGoogleSheetsURLAction.h"
#import "NLBGoogleDocsURLAction.h"
#import "NLBGoogleDriveURLAction.h"
#import "NLBPasteboardURLAction.h"
#import "NLBSafariURLAction.h"
#import "NLBTweetbotURLAction.h"
#import "NLBTwitterURLAction.h"
#import "NLBTypetalkURLAction.h"
#import "NLBYoutubeURLAction.h"

@interface NLBURLActions : NSObject
+ (NSArray *)actionClasses;
+ (NSArray *)actionClassesWithExcludeActionClasses:(NSArray *)excludeActionClasses;
@end