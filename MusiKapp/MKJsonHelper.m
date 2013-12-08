//
//  MKJsonHelper.m
//  MusiKapp
//
//  Created by Humberto Mendes on 24/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKJsonHelper.h"
#import "MKJsonLib.h"

@implementation MKJsonHelper

+(NSArray*)searchRepository:(NSString*)stringUrl andKey:(NSString*)key{
    NSURL *url = [NSURL URLWithString:stringUrl];
    // Submetendo a requisição sem o NSMutableURLRequest, assim vai com GET.
    NSError *error;
    NSData *resultado = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
    
    // Verificando a ocorrência de erros HTTP.
    if(error){
        NSLog(@"Erro HTTP: %@", error.description);
        return nil;
    }
    
    // Acessando o elemento "data" da estrutura retornada pelo serviço.
    //NSDictionary *respostaJSON = [NSJSONSerialization JSONObjectWithData:resultado options:kNilOptions error:nil];
    
    NSArray *retornoArray = nil;
    
    @try {
        retornoArray = [MKJsonLib convertJsonToArray:resultado withKey:key];
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
    }
    
    return retornoArray;
}

@end
