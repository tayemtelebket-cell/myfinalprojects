#include <iostream>
#include "category.h"
using namespace std;
category::category(){
    name="Unknown";
    id=0;
}
category::category(string n,int i){
    name=n;
    id=i;
}
void category::setname(string n){
    if(n!="")
    name=n;
    else
        name="Unknown";
}
void category::getId()const{
    cout<<id<<endl;
}
void category::getname()const{
    cout<<name<<endl;
}
void category::display()const{
    cout<<"name : "<<name<<" if : "<<id<<endl;
}
