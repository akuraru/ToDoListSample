
#import "ToDoViewObject.h"
#import "ToDo.h"

@implementation ToDoViewObject

- (id)initWithToDo:(ToDo *)todo {
    self = [super init];
    if (self) {
        self.todo = todo;
    }
    return self;
}
- (void)setTodo:(ToDo *)todo {
    _todo = todo;
    self.text = todo.text;
}

@end
