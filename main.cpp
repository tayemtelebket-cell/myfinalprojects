    #include <iostream>
    #include "customer.h"
    #include "product.h"
    #include "category.h"
    using namespace std;
    void menu(){
        cout<<"1. Add product "<<endl;
        cout<<"2. Add customer"<<endl;
        cout<<"3. Add category"<<endl;
        cout<<"4. Show products "<<endl;
        cout<<"5.Show customers"<<endl;
        cout<<"6. Show categories"<<endl;
        cout<<"7. exit"<<endl;
    }

    int main(){
        product* ptr1=new product[50]; //capacity not stated
        customer* ptr2=new customer[50]; //capacity not stated
        category* ptr3=new category[50]; //capacity not stated
        int count1=0,count2=0,count3=0; //counts to keep track of number of products,customers and categories created
        cout<<"Menu : "<<endl;
        menu();
        cout<<"please choose from menu"<<endl;
        int choice;
        cin>>choice; 
      
      while(choice!=7){ // program execution
            
            switch(choice){
                case 1:
                    {
                        int q,i;
                        double p;
                        string s;
                        cin>>q>>i>>s>>p;
                        *(ptr1+count1)=product(s,i,p,q);
                        count1++;
                    }
                    break;
                case 2:
                {
                    string s;
                    int i;
                    cin>>s>>i;

                    *(ptr2+count2)=customer(s,i);
                    count2++;
                }
                break;
                case 3:
                {
                    string s;
                    int i;
                    cin>>s>>i;
                    *(ptr3+count3)=category(s,i);
                    count3++;
                }
                break;
                case 4:
                {
                    for(int i=0;i<count1;i++){
                        (ptr1+i)->display();
                    }
                }
                break;
                case 5:
                {
                    for(int i=0;i<count2;i++){
                        (ptr2+i)->display();
                    }

                }
                break;
                case 6:
                {
                    for(int i=0;i<count3;i++){
                        (ptr3+i)->display();
                    }
                }
                break;
                default:{
                    cout<<"wrong number entered please stick to the menu"<<endl;
                    menu();
                }
                break;


            }
            cout<<"please choose  from menu"<<endl;
            cin>>choice;
      }
            
        
        
        
        cout<<"Thank you for using our program... Exiting safely"<<endl;
        //handling the dynamic memory allocation using RAII to avoid memory leakage
        delete[] ptr1;
        delete[] ptr2;
        delete[] ptr3;
        return 0;
    }