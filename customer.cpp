#include <iostream>
#include "customer.h"
using namespace std;
customer::customer(){
    name="Unknown";
    id=0;
}
customer::customer(string n,int i){
    name=n;
    id=i;
}
void customer::setname(string n){
    if(n!="")
    name=n;
    else
        name="Unknown";
}
void customer::getId()const{
    cout<<id<<endl;
}
void customer::getname()const{
    cout<<name<<endl;
}
void customer::display()const{
    cout<<"name : "<<name<<" if : "<<id<<endl;
}
