#include <stdio.h>
#include <stdlib.h>
#include "class.h"

struct _3X {
    int a;
};
struct X {
    void (*const destructor)(void *);
    int a;
    void (*f)(void *);
};
struct _X {
    void *_272pad[1][1][1];
    int a;
    void (*f)(void *);
};
extern const struct _X *X();

void *_impl_X(const char, struct X *, int a);
void _dtor_X(void *self) {
    {
        extern void *_impl_X(const char, struct X *, int a);
        void (*const f)(const char, void *) = (void *)_impl_X;
        f(0, self);
    }
}
void *_ctor_X(void *self, const struct _3X _3) {
    if (self) {
        void *(*const f)(const char, void *, const struct _3X _3) =
            (void *)_impl_X;
        if (sizeof(struct X)) {
            union {
                void *v;
                char *c;
                int *i;
            } _1_ = {.v = self};
            int _2_ = sizeof(struct X);
            while (_2_ & (sizeof(*_1_.i) - 1)) {
                --_2_;
                *_1_.c = 0;
                ++_1_.c;
            }
            _2_ /= sizeof(*_1_.i);
            while (_2_) {
                --_2_;
                *_1_.i = 0;
                ++_1_.i;
            }
        }
        if (f(1, self, _3))
            *(void **)self = _dtor_X;
        else {
            _dtor_X(self);
            return (void *)0;
        }
    }
    return self;
}
const struct _X *X() {
    static union {
        void *p;
        struct _X c;
    } c = {(void *)1};
    if (c.p == (void *)1) {
        c.p = (void *)0;
        {
            const union {
                char init;
                struct _3X _3;
            } zero = {0};
            if (0)
                (void)zero;
            if (_ctor_X(&c, zero._3))
                _dtor_X(&c);
            c.p = (void *)0;
        }
    }
    return (void *)&c;
}
void *_impl_X(const char _274ctr, struct X *self, int a) {
    if (!_274ctr) {
    }
    if (_274ctr) {
        {
            self->a = a;
        }
        {
        }
    } else {
    }
    return self;
    (void)self;
}
struct _6A {
    int a;
};
struct _5A {
    char b;
};
struct _4A {
    double c;
};
struct _3A {
    char *s;
};
struct A {
    void (*const destructor)(void *);
    int a;
    void (*f)(void *);
    char b;
    double c;
    char *s;
    int x;
};
struct _A {
    void *(*const constructor)(void *, int a, char b, double c, char *s);
    int a;
    void (*f)(void *);
    char b;
    double c;
    char *s;
    int x;
};
extern const struct _A *A();

void f1(struct A *p) {
    printf("%d %c %f %s (%d)\n", p->a, p->b, p->c, p->s, p->x);
}

void *_impl_A(const char, struct A *, int a, char b, double c, char *s);
void _dtor_A(void *self) {
    {
        extern void *_impl_A(const char, struct A *, int a, char b, double c,
                             char *s);
        void (*const f)(const char, void *) = (void *)_impl_A;
        f(0, self);
    }
    {
        extern void *_impl_X(const char, struct X *, int a);
        void (*const f)(const char, void *) = (void *)_impl_X;
        f(0, self);
    }
}
void *_ctor_A(void *self, const struct _6A _6, const struct _5A _5,
              const struct _4A _4, const struct _3A _3) {
    if (self) {
        void *(*const f)(const char, void *, const struct _6A _6,
                         const struct _5A _5, const struct _4A _4,
                         const struct _3A _3) = (void *)_impl_A;
        if (sizeof(struct A) - sizeof(struct X)) {
            union {
                void *v;
                char *c;
                int *i;
            } _1_ = {.v = ((char *)self) + sizeof(struct X)};
            int _2_ = sizeof(struct A) - sizeof(struct X);
            while (_2_ & (sizeof(*_1_.i) - 1)) {
                --_2_;
                *_1_.c = 0;
                ++_1_.c;
            }
            _2_ /= sizeof(*_1_.i);
            while (_2_) {
                --_2_;
                *_1_.i = 0;
                ++_1_.i;
            }
        }
        if (f(1, self, _6, _5, _4, _3))
            *(void **)self = _dtor_A;
        else {
            _dtor_A(self);
            return (void *)0;
        }
    }
    return self;
}
const struct _A *A() {
    static union {
        void *p;
        struct _A c;
    } c = {(void *)1};
    if (c.p == (void *)1) {
        c.p = (void *)0;
        X();
        {
            const union {
                char init;
                struct _6A _6;
                struct _5A _5;
                struct _4A _4;
                struct _3A _3;
            } zero = {0};
            if (0)
                (void)zero;
            if (_ctor_A(&c, zero._6, zero._5, zero._4, zero._3))
                _dtor_A(&c);
            c.p = (void *)_ctor_A;
        }
    }
    return (void *)&c;
}
void *_impl_A(const char _295ctr, struct A *self, int a, char b, double c,
              char *s) {
    if (!_295ctr) {
    }
    if (_295ctr) {
        extern void *_ctor_X(void *, const struct _3X _3);
        void *(*const super)(void *, int a) = (void *)_ctor_X;
        {
        }
        {
            super(self, a);
            self->f = (void *)f1;
            self->b = b;
            self->c = c;
            self->s = s;
            self->x = a + b;
        }
    } else {
        if (self->s)
            free(self->s);
        self->s = ((void *)0);
    }
    return self;
    (void)self;
}
struct _7B {
    int a;
};
struct _6B {
    char b;
};
struct _5B {
    double c;
};
struct _4B {
    char *s;
};
struct _3B {
    int cnt;
};
struct B {
    void (*const destructor)(void *);
    int a;
    void (*f)(void *);
    char b;
    double c;
    char *s;
    struct {
        int x;
    } _padA[1][1][1];
    int *arr;
};
struct _B {
    void *(*const constructor)(void *, int a, char b, double c, char *s,
                               int cnt);
    int a;
    void (*f)(void *);
    char b;
    double c;
    char *s;
    struct {
        int x;
    } _padA[1][1][1];
    int *arr;
};
extern const struct _B *B();

void f2(struct B *p) {
    A()->f(p);
    printf("%p\n", p->arr);
}

void *_impl_B(const char, struct B *, int a, char b, double c, char *s,
              int cnt);
void _dtor_B(void *self) {
    {
        extern void *_impl_B(const char, struct B *, int a, char b, double c,
                             char *s, int cnt);
        void (*const f)(const char, void *) = (void *)_impl_B;
        f(0, self);
    }
    {
        extern void *_impl_A(const char, struct A *, int a, char b, double c,
                             char *s);
        void (*const f)(const char, void *) = (void *)_impl_A;
        f(0, self);
    }
    {
        extern void *_impl_X(const char, struct X *, int a);
        void (*const f)(const char, void *) = (void *)_impl_X;
        f(0, self);
    }
}
void *_ctor_B(void *self, const struct _7B _7, const struct _6B _6,
              const struct _5B _5, const struct _4B _4, const struct _3B _3) {
    if (self) {
        void *(*const f)(const char, void *, const struct _7B _7,
                         const struct _6B _6, const struct _5B _5,
                         const struct _4B _4, const struct _3B _3) =
            (void *)_impl_B;
        if (sizeof(struct B) - sizeof(struct A)) {
            union {
                void *v;
                char *c;
                int *i;
            } _1_ = {.v = ((char *)self) + sizeof(struct A)};
            int _2_ = sizeof(struct B) - sizeof(struct A);
            while (_2_ & (sizeof(*_1_.i) - 1)) {
                --_2_;
                *_1_.c = 0;
                ++_1_.c;
            }
            _2_ /= sizeof(*_1_.i);
            while (_2_) {
                --_2_;
                *_1_.i = 0;
                ++_1_.i;
            }
        }
        if (f(1, self, _7, _6, _5, _4, _3))
            *(void **)self = _dtor_B;
        else {
            _dtor_B(self);
            return (void *)0;
        }
    }
    return self;
}
const struct _B *B() {
    static union {
        void *p;
        struct _B c;
    } c = {(void *)1};
    if (c.p == (void *)1) {
        c.p = (void *)0;
        A();
        {
            const union {
                char init;
                struct _7B _7;
                struct _6B _6;
                struct _5B _5;
                struct _4B _4;
                struct _3B _3;
            } zero = {0};
            if (0)
                (void)zero;
            if (_ctor_B(&c, zero._7, zero._6, zero._5, zero._4, zero._3))
                _dtor_B(&c);
            c.p = (void *)_ctor_B;
        }
    }
    return (void *)&c;
}
void *_impl_B(const char _331ctr, struct B *self, int a, char b, double c,
              char *s, int cnt) {
    if (!_331ctr) {
        if (self->arr)
            free(self->arr);
        self->arr = ((void *)0);
    }
    if (_331ctr) {
        extern void *_ctor_A(void *, const struct _6A _6, const struct _5A _5,
                             const struct _4A _4, const struct _3A _3);
        void *(*const super)(void *, int a, char b, double c, char *s) =
            (void *)_ctor_A;
        {
            super(self, 999, '$', c, s);
            self->f = (void *)f2;
            self->arr = malloc(sizeof(*self->arr) * cnt);
        }
        {
        }
    } else {
    }
    return self;
    (void)self;
}
struct C {
    void (*const destructor)(void *);
    int a;
    void (*f)(void *);
    char b;
    double c;
    char *s;
    struct {
        int x;
    } _padA[1][1][1];
};
struct _C {
    void *_340pad[1][1][1];
    int a;
    void (*f)(void *);
    char b;
    double c;
    char *s;
    struct {
        int x;
    } _padA[1][1][1];
};
extern const struct _C *C();

void *_impl_C(const char, struct C *);
void _dtor_C(void *self) {
    {
        extern void *_impl_C(const char, struct C *);
        void (*const f)(const char, void *) = (void *)_impl_C;
        f(0, self);
    }
    {
        extern void *_impl_A(const char, struct A *, int a, char b, double c,
                             char *s);
        void (*const f)(const char, void *) = (void *)_impl_A;
        f(0, self);
    }
    {
        extern void *_impl_X(const char, struct X *, int a);
        void (*const f)(const char, void *) = (void *)_impl_X;
        f(0, self);
    }
}
void *_ctor_C(void *self) {
    if (self) {
        void *(*const f)(const char, void *) = (void *)_impl_C;
        if (sizeof(struct C) - sizeof(struct A)) {
            union {
                void *v;
                char *c;
                int *i;
            } _1_ = {.v = ((char *)self) + sizeof(struct A)};
            int _2_ = sizeof(struct C) - sizeof(struct A);
            while (_2_ & (sizeof(*_1_.i) - 1)) {
                --_2_;
                *_1_.c = 0;
                ++_1_.c;
            }
            _2_ /= sizeof(*_1_.i);
            while (_2_) {
                --_2_;
                *_1_.i = 0;
                ++_1_.i;
            }
        }
        if (f(1, self))
            *(void **)self = _dtor_C;
        else {
            _dtor_C(self);
            return (void *)0;
        }
    }
    return self;
}
const struct _C *C() {
    static union {
        void *p;
        struct _C c;
    } c = {(void *)1};
    if (c.p == (void *)1) {
        c.p = (void *)0;
        A();
        {
            const union {
                char init;
            } zero = {0};
            if (0)
                (void)zero;
            if (_ctor_C(&c))
                _dtor_C(&c);
            c.p = (void *)0;
        }
    }
    return (void *)&c;
}
void *_impl_C(const char _342ctr, struct C *self) {
    if (!_342ctr) {
    }
    if (_342ctr) {
        extern void *_ctor_A(void *, const struct _6A _6, const struct _5A _5,
                             const struct _4A _4, const struct _3A _3);
        void *(*const super)(void *, int a, char b, double c, char *s) =
            (void *)_ctor_A;
        {
            super(self, 0, 0, 0, ((void *)0));
        }
        {
        }
    } else {
    }
    return self;
    (void)self;
}

void main() {

    {
        char *s = malloc(10);
        sprintf(s, "1111");
        struct A c;
        A()->constructor(&c, 1, '1', 1.1, s);
        c.f(&c);
        c.destructor(&c);
    }

    if (0) {
        char *s = malloc(10);
        sprintf(s, "1111");
        struct A c;
        B()->constructor(&c, 2, '2', 2.2, s, 20);
        c.f(&c);
        c.destructor(&c);
    }

    {
        char *s = malloc(10);
        sprintf(s, "3333");
        struct B c;
        B()->constructor(&c, 3, '3', 3.3, s, 30);
        c.f(&c);
        c.destructor(&c);
    }

    {
        char *s = malloc(10);
        sprintf(s, "4444");
        struct A *c =
            B()->constructor(malloc(sizeof(struct B)), 4, '4', 4.4, s, 40);
        c->f(c);
        c->destructor(c);
        free(c);
    }
}
