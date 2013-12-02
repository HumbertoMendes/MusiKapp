//
//  MKJsonLib.m
//  MusiKapp
//
//  Created by Humberto Mendes on 30/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKJsonLib.h"

@implementation MKJsonLib
+(NSArray*)convertJsonToArray:(NSData*)data withKey:(NSString*)key{
    // Acessando o elemento "data" da estrutura retornada pelo serviço.
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    NSMutableArray *jsonArray = [[NSMutableArray alloc] init];
    
    id keyValue = [json objectForKey:key];
    
    if ([keyValue isKindOfClass:[NSArray class]])
        return [json objectForKey:key];
    else{
        [jsonArray addObject:[json objectForKey:key]];
        return jsonArray;
    }
}

+(NSString*)formatParameterForUrl:(NSString*)parameter{
    return [parameter stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];;
}

+(NSString*)formatArtistNameForUrl:(NSString*)text{
   return [self stringReplace:@"http://www.vagalume.com.br/" withString:@"" forText:text];
}

+(NSString*)stringReplace:(NSString*)oldString withString:(NSString*)newString forText:(NSString*)text{
    return [text stringByReplacingOccurrencesOfString:oldString withString:newString];
}

+(NSData*)convertJsonToData:(NSObject*)json{
    return [NSJSONSerialization dataWithJSONObject:json options:0 error:nil];
}
@end
