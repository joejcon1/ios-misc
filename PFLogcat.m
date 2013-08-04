//
//  PFLogcat.m
//  Paperfold
//
//  Created by Joseph Conway on 17/05/2013.
//  Copyright (c) 2013 letolab. All rights reserved.
//

#import "PFLogcat.h"
#import "TestFlight.h"
@implementation PFLogcat

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    
    /*
     
     01-05 13:04:12.804 I/System.out(17057): pi = 3.141592653589793
     01-05 13:04:12.804 I/System.out(17057): pi to 5 decimal places =  3.14159
     01-05 13:04:12.809 I/System.out(17057): pi to 3 decimal places in French notation =  3,142
     */
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    char *l = "";
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
    NSString *log = [NSString stringWithFormat:@"%s/%s(%d): %-20@",
                      l, logMessage->function, logMessage->lineNumber, logMessage->logMsg];
    TFLog(log);
    return log;
    
}
@end
