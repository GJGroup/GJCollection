/*!
 @header     GJCollection.h
 @abstract   该文件主要为NSArray、NSDictionary、NSSet这些Collection类建立Category
 @discussion 主要为这些Collection类提供递归深拷贝方法，对于非Collection类来说，深拷贝直接进行内存拷贝
             没有问题，但是对于Collection类来说，深拷贝时，Collection对象是拷贝了内存，但是其内部元素
             还是指针拷贝，并没有创建新的内存拷贝对象，这些Category方法就是为了解决这个问题，而进行递归
             深拷贝。
 @author     guoxiaoliang
 */

#import <Foundation/Foundation.h>



@protocol GJRecursiveDeepCopy<NSObject>

 @required
- (id)gjw_recursiveDeepCopy;

@end

@interface NSArray(GJRecursiveDeepCopy)<GJRecursiveDeepCopy>

@end

@interface NSDictionary(GJRecursiveDeepCopy)<GJRecursiveDeepCopy>


@end

@interface NSSet(GJRecursiveDeepCopy)<GJRecursiveDeepCopy>

@end


