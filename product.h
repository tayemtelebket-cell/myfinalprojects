#include <iostream>
using namespace std;
#ifndef product_h
#define produce_h
class product{
    private:
        int id;
        string name;
        double price;
        int quantity;
    public:
        product();
        product(string n,int i,double p=0,int q=0);
        void setprice(double p);
        void setquantity(int q);
        void getId()const;
        void getname()const;
        void getprice()const;
        void getquantity()const;
        void display()const;




};
#endif