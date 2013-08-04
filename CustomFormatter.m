#import "CustomFormatter.h"
#import "TestFlight.h"


/**
 * For more information about creating custom formatters, see the wiki article:
 * https://github.com/robbiehanson/CocoaLumberjack/wiki/CustomFormatters
**/
@implementation CustomFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    char *l="";
    switch (logMessage->logFlag) {
        case 1:
            l = "E";
            break;
        case 2:
            l = "W";
            break;
        case 4:
            l = "I";
            break;
        case 8:
            l = "V";
            break;
        case 16:
            l = "T";
            break;
    }
    [formatter setDateFormat:@"HH:mm:ss:SSS"];
    NSString *log = [NSString stringWithFormat:@"%@ %30s:%30s:%-5d %s|%@",
                     [formatter stringFromDate:[NSDate date]], [[logMessage fileName] UTF8String], logMessage->function, logMessage->lineNumber, l, logMessage->logMsg];
//    TFLog(log); 
    return log;

}

@end
