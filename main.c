#include <stdio.h>
#include <stdlib.h>
#include "class.h"



#define CLASS_BEGIN__X abstract,\
    constructor(int a)(\
        self->a=a;\
    ),\
    public(\
        int a;\
        void(*f)(void*);\
    )
CLASS_END(X);

CLASS_COMPILE(X)()



#define CLASS_BEGIN__A \
    extends(X),\
    constructor(int a,char b,double c,char *s)(),\
    public(\
        char b;\
        double c;\
        char *s;\
    ),\
    private(\
        int x;\
    )
CLASS_END(A);

void f1(CLASS A *p){
   printf("%d %c %f %s (%d)\n",p->a,p->b,p->c,p->s,p->x);
}

CLASS_COMPILE(A)(
    constructor()(
        super(self,a);
        self->f=(void*)f1;
        self->b=b;
        self->c=c;
        self->s=s;
        self->x=a+b;
    ),
    destructor()(
        if(self->s) free(self->s); self->s=NULL;\
    )
)



#define CLASS_BEGIN__B \
    extends(A),\
    constructor(int a,char b,double c,char *s,int cnt)(\
        super(self,999,'$',c,s);\
        self->f=(void*)f2;\
        self->arr=malloc(sizeof(*self->arr)*cnt);\
    ),\
    destructor()(\
        if(self->arr) free(self->arr); self->arr=NULL;\
    ),\
    public(\
        int *arr;\
    )
CLASS_END(B);

void f2(CLASS B *p){
    A()->f(p);
    printf("%p\n",p->arr);
}

CLASS_COMPILE(B)()



#define CLASS_BEGIN__C abstract,\
    extends(A),\
    constructor()(\
        super(self,0,0,0,NULL);\
    )
CLASS_END(C);

CLASS_COMPILE(C)()


  
void main()
{
    /*  CLASS X is abstract and constructor doesnt exist at compilation
        CLASS X c;
        X()->constructor(&c);
        c.f(&c);
        c.destructor(&c);
    */
    
    {
        char *s=malloc(10);
        sprintf(s,"1111");
        CLASS A c;
        A()->constructor(&c,1,'1',1.1,s);
        c.f(&c);
        c.destructor(&c);
    }
    
    if(0){
        char *s=malloc(10);
        sprintf(s,"1111");
        CLASS A c;
        B()->constructor(&c,2,'2',2.2,s,20); // out of bounds sizeof(A) < sizeof(B)
        c.f(&c);
        c.destructor(&c);
    }
    
    {
        char *s=malloc(10);
        sprintf(s,"3333");
        CLASS B c;
        B()->constructor(&c,3,'3',3.3,s,30);
        c.f(&c);
        c.destructor(&c);
    }

    {
        char *s=malloc(10);
        sprintf(s,"4444");
        CLASS A *c=B()->constructor(malloc(sizeof(CLASS B)),4,'4',4.4,s,40);
        c->f(c);
        c->destructor(c);
        free(c);
    }
}
