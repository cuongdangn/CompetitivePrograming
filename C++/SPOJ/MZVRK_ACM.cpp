#include <iostream>
#include <cstdio>
#include <cmath>

using namespace std;

long long a,b;

long long tinh(long long a)
{
    long long tg,x;
    tg=0;
    for(int i=0;i<=50;i++)
    {
        x=a/(1ll<<i);
        tg+=(1ll<<i)*(x/2+(x%2==1));
    //    cout<<tg<<"\n";
    }
    return tg;
}
int main()
{
    long long kq;
    scanf("%lld %lld",&a,&b);
    kq=tinh(b)-tinh(a-1);
    //cout<<tinh(b)<<" ";
    //cout<<tinh(a-1)<<"\n";
    printf("%lld",kq);
    return 0;
}
