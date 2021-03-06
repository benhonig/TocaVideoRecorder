//
//  TocaFilter.m
//  TocaBocaVideoRecorder
//
//  Created by CATALINA PETERS on 4/28/16.
//  Copyright © 2016 Gramercy Tech. All rights reserved.
//

#import "TocaFilter.h"

@implementation TocaFilter

- (id)initAtIndex:(int)index {
    self = [super init];
    if (self) {
        NSString *plistPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"TocaFilters.plist"];
        self.filtersList = [[NSArray alloc] initWithContentsOfFile:plistPath];
        if(index > -1) {
            self.filterItem = [self.filterList objectAtIndex:index];
        }
    }
    return self;
}

- (NSArray *)filterList {
    return self.filtersList;
}

- (int)filterType {
    if( [self.filterItem[@"type"] isEqualToString:@"sticker"]) {
        return FilterTypeSticker;
    } else if([self.filterItem[@"type"] isEqualToString:@"animated-scene"]) {
        return FilterTypeFrame;
    } else if([self.filterItem[@"type"] isEqualToString:@"face-tracking"]) {
        return FilterTypeFaceTracking;
    } else {
        return FilterTypeReset;
    }
}

- (UIImage *)filterIcon {
    return [UIImage imageNamed:self.filterItem[@"icon-image"]];
}

- (UIImage *)filterIconPressed {
    return [UIImage imageNamed:self.filterItem[@"icon-image-pressed"]];
}

- (int)animationFramesAmount {
    return [self.filterItem[@"animation-frames-amount"] intValue];
}

- (float)animationHeight {
    if(!self.filterItem[@"animation-height"]) {
        return 0;
    } else {
        return [self.filterItem[@"animation-height"] floatValue];
    }
}

- (float)animationWidth {
    if(!self.filterItem[@"animation-width"]) {
        return 0;
    } else {
        return [self.filterItem[@"animation-width"] floatValue];
    }
}

- (NSString *)animationImagePrefix {
    return self.filterItem[@"animation-image-prefix"];
}

@end
