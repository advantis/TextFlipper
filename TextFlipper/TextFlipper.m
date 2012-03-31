//
//  Copyright © 2011 Yuri Kotov
//  Licensed under the MIT license: http://opensource.org/licenses/MIT
//  Latest version can be found at http://github.com/advantis/TextFlipper
//

#import "TextFlipper.h"

NSString * FlipString(NSString *string)
{
    NSUInteger length = [string length];
    if (0 == length) return string;

    NSURL *url = [[NSBundle mainBundle] URLForResource:@"ReplacementTable"
                                         withExtension:@"plist"];
    NSDictionary *charTable = [NSDictionary dictionaryWithContentsOfURL:url];
    NSMutableString *result = [NSMutableString stringWithCapacity:(2 * length)];
    for (NSInteger i = length - 1; -1 < i; --i)
    {
        NSString *key = [string substringWithRange:NSMakeRange(i, 1)];
        NSString *value = [charTable valueForKey:key];

        if (!value)
        {
            value = key;
        }

        [result appendString:value];
    }
    return result;
}

@implementation TextFlipper

- (void) flipText:(NSPasteboard *)pasteboard
         userData:(NSString *)userData
            error:(NSString **)error
{
    NSArray *classes = [NSArray arrayWithObject:[NSString class]];
    if (![pasteboard canReadObjectForClasses:classes options:nil])
    {
        *error = NSLocalizedString(@"Couldn't read pasteboard text", nil);
        return;
    }

    NSString *string = [pasteboard stringForType:NSPasteboardTypeString];
    string = [string lowercaseString];
    [pasteboard clearContents];
    [pasteboard writeObjects:[NSArray arrayWithObject:FlipString(string)]];
}

@end
