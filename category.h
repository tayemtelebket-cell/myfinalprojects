#include <iostream>
using namespace std;
#ifndef category_h
#define category_h
class category{
    private:
        string name;
        int id;
    public:
        category();
        category(string n,int i);
        void setname(string n);
        void getname()const;
        void getId()const;
        void display()const;
};
#endif