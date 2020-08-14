#include<iostream>
#include<cmath>
#include<cstdio>

using namespace std;

float kq;

int GCD(int a,int b)
{
    int du;
    while(a!=0)
    {
        du=b%a;
        b=a;
        a=du;
    }
    return b;
}
float R(int a)
{
    float rr;
    rr=0;
    for(int p=1;p<=a;p++)
        for(int q=a-p;q<=a;q++)
          if(GCD(q,p)==1)
          {
              cout<<p<<" "<<q;
              rr+=float(1)/float(p*q);
          }

        return rr;
}
int trau(int n)
{
    kq=0;
    for(int i=2;i<=n;i++)
    {
        cout<<R(i)<<endl;
        kq+=R(i);
    }
    printf("%f \n",kq);
}
int main()
{
    int n;
    while(scanf("%d",&n)!=EOF)
    {
        trau(n);
    }
}
