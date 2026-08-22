#include <iostream>
using namespace std;
#ifndef customer_h
#define customer_h
class customer{
    private:
        string name;
        int id;
    public:
        customer();
        customer(string n,int i);
        void setname(string n);
        void getname()const;
        void getId()const;
        void display()const;
};
#endif