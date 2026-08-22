#include <iostream>
#include "product.h"
using namespace std;
product::product(){
    name="Unknown";
    id=0;
    price=0;
    quantity=0;

}
product::product(string n,int i,double p,int q){
    if(q>0){
        quantity=q;
    }
    else
        q=0;
    
    if(p>0){
        price=p;
    }
    else
        price=0;
    name=n;
    id=i;
   
}
void product::setprice(double p){
    if(p>0)
        price=p;
   
}
void product::setquantity(int q){
    if(q>0)
        quantity=q;
    
}
void product::getquantity()const{
    cout<<quantity<<endl;

}
void product::getId()const{
    cout<<id<<endl;
}
void product::getname()const{
    cout<<name<<endl;
}
void product::getprice()const{
    cout<<price<<endl;
}
void product::display()const{
    cout<<"price : "<<price<<" quantity : "<<quantity<<" name : "<<name<<" id : "<<id<<endl;  


}

