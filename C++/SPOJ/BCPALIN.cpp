#include<iostream>

using namespace std;
int t,a;
int dao(int a)
{   int tg=0;
    while (a>0)
    {
        tg=tg*10+a%10;
        a=a/10;
    }
   // cout<<tg<<endl;
    return tg;
}
int main()
{
    cin>>t;
    for(int i=1;i<=t;i++)
    {
        cin>>a;
        int t=dao(a);
        if (t==a) cout<<"YES"<<endl;
        else cout<<"NO"<<endl;
    }
    return 0;

}
