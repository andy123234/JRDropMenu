//
//  JRGlobalMacro.h
//  JRDropMenuDemo
//
//  Created by 郭吉荣 on 2020/6/12.
//  Copyright © 2020 Imaritime. All rights reserved.
//

#ifndef JRGlobalMacro_h
#define JRGlobalMacro_h

#define AAObject(objectName) [[objectName alloc]init]


#define JRPropStatementAndPropSetFuncStatement(propertyModifier,className, propertyPointerType, propertyName)           \
@property(nonatomic,propertyModifier)propertyPointerType  propertyName;                                                 \
- (className * (^) (propertyPointerType propertyName)) propertyName##Set;



#define JRPropSetFuncImplementation(className, propertyPointerType, propertyName)                                       \
- (className * (^) (propertyPointerType propertyName))propertyName##Set{                                                \
return ^(propertyPointerType propertyName) {                                                                            \
self.propertyName = propertyName;                                                                                       \
return self;                                                                                                            \
};                                                                                                                      \
}

#endif /* JRGlobalMacro_h */
