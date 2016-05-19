

#import "GJCollection.h"

@implementation NSArray(GJRecursiveDeepCopy)

- (id)gjw_recursiveDeepCopy {
    NSMutableArray *copyArr = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id copyValue;
        if ([obj respondsToSelector:@selector(gjw_recursiveDeepCopy)]) { //Collection对象进行递归拷贝
            copyValue = [obj gjw_recursiveDeepCopy];
        } else if ([obj conformsToProtocol:@protocol(NSMutableCopying)]) { //非Collection对象的NSObject对象
            copyValue = [obj mutableCopy];
        } else if ([obj conformsToProtocol:@protocol(NSCopying)]) { //自定义的NSObject对象，自己实现了拷贝
            copyValue = [obj copy];
        }
        if (copyValue) {
            [copyArr addObject:copyValue];
        }
    }];
    return copyArr;
}

@end


@implementation NSDictionary(GJRecursiveDeepCopy)

- (id)gjw_recursiveDeepCopy {
    NSMutableDictionary *copyDic = [NSMutableDictionary dictionaryWithCapacity:self.count];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        id copyValue;
        if ([obj respondsToSelector:@selector(gjw_recursiveDeepCopy)]) { //Collection对象进行递归拷贝
            copyValue = [obj gjw_recursiveDeepCopy];
        } else if ([obj conformsToProtocol:@protocol(NSMutableCopying)]) { //非Collection对象的NSObject对象
            copyValue = [obj mutableCopy];
        } else if ([obj conformsToProtocol:@protocol(NSCopying)]) { //自定义的NSObject对象，自己实现了拷贝
            copyValue = [obj copy];
        }
        if (copyValue) {
            copyDic[key] = copyValue;
        }
    }];
    return copyDic;
}

@end


@implementation NSSet(GJRecursiveDeepCopy)

- (id)gjw_recursiveDeepCopy {
    NSMutableSet *copySet = [NSMutableSet setWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        id copyValue;
        if ([obj respondsToSelector:@selector(gjw_recursiveDeepCopy)]) { //Collection对象进行递归拷贝
            copyValue = [obj gjw_recursiveDeepCopy];
        } else if ([obj conformsToProtocol:@protocol(NSMutableCopying)]) { //非Collection对象的NSObject对象
            copyValue = [obj mutableCopy];
        } else if ([obj conformsToProtocol:@protocol(NSCopying)]) { //自定义的NSObject对象，自己实现了拷贝
            copyValue = [obj copy];
        }
        if (copyValue) {
            [copySet addObject:copyValue];
        }
    }];
    return copySet;
}

@end
