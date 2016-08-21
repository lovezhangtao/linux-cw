% Linux C Programming
% SEIE, Soochow University
% Week 10, 2015-2016-1

Ref: 宋劲杉. Linux C 编程一站式学习

> * 编码风格
> * 构建：编译、汇编与链接
> * 调试
> * Makefile 基础

# Coding Style

## Ugly and Suffering

```c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int main(void)
{
char gesture[3][10]={"scissor","stone","cloth"};
int man,computer,result, ret;
srand(time(NULL));
while(1){
computer=rand()%3;
printf("\nInput your gesture (0-scissor 1-stone 2-cloth):\n");
ret=scanf("%d",&man);
if(ret!=1||man<0||man>2){
printf("Invalid input! Please input 0, 1 or 2.\n");
continue;
}
printf("Your gesture: %s\tComputer's gesture:
%s\n",gesture[man],gesture[computer]);
result=(man-computer+4)%3-1;
if(result>0)printf("You win!\n");
else if(result==0)printf("Draw!\n");
else printf("You lose!\n");
}
return 0;
}
```

## Indentation and Spaces

*   A space after `if, switch, case, for, do, while`

    ```c
    while (1)
    ```

*   one space around (on each side of) most binary\
    and ternary operators
    `=  +  -  <  >  *  /  %  |  &  ^  <=  >= `\
    `==  !=  ?  :`
*   no space after unary operators
    `&  *  +  -  ~  !`

---

*   no space `++ -- . ->`

    ```c
    i = i + 1;
    ++i;
    !(i < 1);
    -x;
    &a[1];
    ```

*   space after `,` and `;` (one space after punctuation in western writing)

    ```c
    for(i = 1; i < 10; i++)
        foo(arg1, arg2);
    ```

---

*   Break long lines longer than 80 columns. Keep aligned.

    ```c
    if (sqrt(x*x + y*y) > 5.0
        && x < 0.0
        && y > 0.0)
    foo(sqrt(x*x + y*y),
        a[i-1] + b[i-1] + c[i-1])
        printf("This is such a long sentence that "
               "it cannot be held within a line\n");
    ```

*   indent with `<Tab>` or spaces. one `Tab` equals 8 spaces. Use 8 or 4
    spaces. Do NOT mix space and Tab indentation.

---

*   put the opening brace last on the line, and put the closing brace
    first for non-function statement blocks.

    ```c
    switch (action) {
    case KOBJ_ADD:
        return "add";
    case KOBJ_REMOVE:
        return "remove";
    case KOBJ_CHANGE:
        return "change";
    default:
        return NULL;
    }

    do {
        body of do-loop
    } while (condition);

    if (x == y) {
        ..
    } else if (x > y) {
        ...
    } else {
        ....
    }
    ```

---

*   braces for functions.

    ```c
    int function(int x)
    {
        body of function
    }
    ```

*   blank line between logical 'paragraphes': functions and statement
    groups

## Commenting

*   long (multi-line) comments

    ```c
    /*
     * This is the preferred style for multi-line
     * comments in the Linux kernel source code.
     * Please use it consistently.
     *
     * Description:  A column of asterisks on the left side,
     * with beginning and ending almost-blank lines.
     */
    ```

---

*   comments may be used.
    -   head of source file
    -   above a function, no blank line after it.
    -   above statement groups. no blank line below.
    -   at the right of statements. at least one space.

---

```c
/**
 *	radix_tree_shrink    -    shrink height of a radix tree to minimal
 *	@root		radix tree root
 */
static inline void radix_tree_shrink(struct radix_tree_root *root)
{
	/* try to shrink tree height */
	while (root->height > 0) {
		struct radix_tree_node *to_free = root->rnode;
		struct radix_tree_node *slot;

		BUG_ON(!radix_tree_is_indirect_ptr(to_free));
		to_free = indirect_to_ptr(to_free);

		/*
		 * The candidate node has more than one child, or its child
		 * is not at the leftmost slot, we cannot shrink.
		 */
		if (to_free->count != 1)
			break;
        }
}       
```

## Naming

*   names should be meaningful, clear and short.
*   lowercase letters with `_` for variables, functions and types.
*   constants and macros are all uppercase with `_`
*   NO pinyin

## Functions

*   Keep functions simple.
*   indentations under 4 levels
*   functions should not be too long. Recommend to fit on 2 screen
    (24x80)
*   local variables no more than 10

## Using indent

`indent -kr sourcefile.c`

*   `-i8` 8 spaces, 8 spaces replaced by a TAB
*   `-nut` no tabs

---

```c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void)
{
    char gesture[3][10] = { "scissor", "stone", "cloth" };
    int man, computer, result, ret;

    srand(time(NULL));

    while (1) {
        computer = rand() % 3;
        printf("\nInput your gesture (0-scissor 1-stone 2-cloth):\n");
        ret = scanf("%d", &man);
        if (ret != 1 || man < 0 || man > 2) {
            printf("Invalid input! Please input 0, 1 or 2.\n");
            continue;
        }
        printf("Your gesture: %s\tComputer's gesture: %s\n",
               gesture[man], gesture[computer]);
        result = (man - computer + 4) % 3 - 1;
        if (result > 0)
            printf("You win!\n");
        else if (result == 0)
            printf("Draw!\n");
        else
            printf("You lose!\n");
    }

    return 0;
}
```

# Build Process

## Overview

*   Preprocess (预处理)
*   Compile (编译)
*   Assemble (汇编)
*   Link (链接)

---

![Build Process](res/buildprocess.svg)

## C Preprocessor (cpp)

*   Pass over source
    -   Insert included files
    -   Perform macro substitutions
*   Define macros

. . .

```
$ gcc -E example.c
```

## Compiler (cc1)

*   Compiler translates one language to another
*   gcc is a C compiler, cc for unix
*   gcc compiler translates C to assembly
*   Compiler consists of
    -   Parser
    -   Code generation
*   `gcc -S example.c` "saves" example.s

## Assembler (as)

*   Another translator
*   Assembler to (binary) object
*   Why not compile straight to binary?
*   `gcc -c example.c` to "save" object

## Linker (ld)

*   Combines objects, both user .o files and libraries; makes an
    executable file
*   `gcc *.o -lm` yields `a.out`
*   `gcc -o mytest *.o -lm`

## Simple Way

`gcc hello.c -o hello`

# Debug

## Techniques

*   compiler error/warning messages
*   `printf()` to get run-time states
*   using a debugger

## gdb

*   compile with `-g` option.
    `gcc -g main.c -o main`
*   invoke: `gdb main`

---

### gdb commands

> *   `help`
> *   `list` or `l` got print source code
> *   `quit`
> *   `start`
> *   `next` or `n`
> *   `step` or `s`

---

> *   `backtrace` or `bt`
> *   `info` or `i`
> *   `frame` or `f`
> *   `print` or `p`
> *   `finish`
> *   `set var`
> *   `display` and `undisplay`

---

> *   `break` or `b`
> *   `continue` or `c`
> *   `delete breakpoints`
> *   `disable breakpoints`
> *   `run`
> *   `x`
> *   `watchpoint`

---

### try gdb

```c
#include <stdio.h>

int add_range(int low, int high)
{
    int i, sum;
    for (i = low; i <= high; i++)
        sum = sum + i;
    return sum;
}

int main(void)
{
    int result[100];
    result[0] = add_range(1, 10);
    result[1] = add_range(1, 100);
    printf("result[0]=%d\nresult[1]=%d\n", result[0], result[1]);
    return 0;
}
```

---

`rectangle.c`

```c
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

/** Program to calculate the area and perimeter of 
 * a rectangle using command line arguments
 */
void print_usage() {
    printf("Usage: rectangle -a|-p -l num -b num\n");
}

int main(int argc, char *argv[]) {
    int option = 0;
    int area = -1, perimeter = -1, breadth = -1, length =-1;

    //Specifying the expected options
    //The two options l and b expect numbers as argument
    while ((option = getopt(argc, argv,"apl:b:")) != -1) {
        switch (option) {
        case 'a' : area = 0;
            break;
        case 'p' : perimeter = 0;
            break;
        case 'l' : length = atoi(optarg); 
            break;
        case 'b' : breadth = atoi(optarg);
            break;
        default: print_usage(); 
            exit(EXIT_FAILURE);
        }
    }
    if (area == -1 && perimeter == -1 || length == -1 || breadth ==-1) {
        print_usage();
        exit(EXIT_FAILURE);
    }

    // Calculate the area
    if (area == 0) {
        area = length * breadth;
        printf("Area: %d\n",area);
    }

    // Calculate the perimeter
    if (perimeter == 0) {
        perimeter = 2 * (length + breadth);
        printf("Perimeter: %d\n",perimeter);
    }
    return 0;
}
```

---

`Makefile`

```makefile
# LDFLAGS
CFLAGS += -g

all: rectangle

rectangle: rectangle.o

clean:
	$(RM) rectangle *.o

.PHONY: clean
```
