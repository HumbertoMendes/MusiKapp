//
//  MKJsonHelper.m
//  MusiKapp
//
//  Created by Humberto Mendes on 24/11/13.
//  Copyright (c) 2013 Humberto Mendes. All rights reserved.
//

#import "MKJsonHelper.h"

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
    NSDictionary *respostaJSON = [NSJSONSerialization JSONObjectWithData:resultado options:kNilOptions error:nil];
    NSArray *monitoramentosJSON = [respostaJSON objectForKey:key];
    
    return monitoramentosJSON;
    /*NSString *codigo = @"RA705639681BR";
    NSString *stringUrla = [NSString stringWithFormat:@"http://services.sandbox.encomendaz.net/tracking.json?id=%@", codigo];
    NSURL *url = [NSURL URLWithString:stringUrla];
    // Submetendo a requisição sem o NSMutableURLRequest, assim vai com GET.
    NSError *error;
    NSData *resultado = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];
    
    // Verificando a ocorrência de erros HTTP.
    if(error){
        NSLog(@"Erro HTTP: %@", error.description);
        return nil;
    }
    
    // Acessando o elemento "data" da estrutura retornada pelo serviço.
    NSDictionary *respostaJSON = [NSJSONSerialization JSONObjectWithData:resultado options:kNilOptions error:nil];
    NSArray *monitoramentosJSON = [respostaJSON objectForKey:@"data"];
    
    return monitoramentosJSON;*/
}

@end
