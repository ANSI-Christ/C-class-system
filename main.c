#include <stdio.h>
#include <stdlib.h>
#include "class.h"



#define CLASS_BEGIN__A \
    public(\
        void(*f)(void*);\
        char *s;\
    ),\
    private(\
        int bla;\
    )
CLASS_END(A);

void f1(CLASS A *p){
   printf("%s (%d)\n",p->s,p->bla); 
}

CLASS_COMPILE(A)(
    constructor(
        self->f=(void*)f1;
        self->s=malloc(2);
        self->s[1]=0;
        self->s[0]='$';
        self->bla=5;
    ),
    destructor(
        free(self->s); self->s=NULL;\
    )
)



#define CLASS_BEGIN__B \
    from(A),\
    constructor(\
        self->f=(void*)f2;\
        self->s[0]='@';\
    ),\
    public(\
        void *b;\
    )
CLASS_END(B);

void f2(CLASS B *p){
   printf("%s\n",p->s); 
}

CLASS_COMPILE(B)()



  
int main()
{
    {
        CLASS A c;
        A()->constructor(&c);
        c.f(&c);
        c.destructor(&c);
    }
    
    {
        CLASS A c;
        B()->constructor(&c);
        c.f(&c);
        c.destructor(&c);
    }

    return 0;
}
