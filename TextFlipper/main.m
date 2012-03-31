//
//  Copyright © 2011 Yuri Kotov
//  Licensed under the MIT license: http://opensource.org/licenses/MIT
//  Latest version can be found at http://github.com/advantis/TextFlipper
//

#import <Foundation/Foundation.h>
#import "TextFlipper.h"
#import "InfoPlist.h"

int main(int argc, const char *argv[])
{
    @autoreleasepool
    {
        TextFlipper *textFlipper = [TextFlipper new];
        NSRegisterServicesProvider(textFlipper, @"TextFlipper");
        NSDate *date = [NSDate dateWithTimeIntervalSinceNow:TIMEOUT_VALUE/1000.0];
        [[NSRunLoop currentRunLoop] acceptInputForMode:NSDefaultRunLoopMode
                                            beforeDate:date];
    }
    return 0;
}

