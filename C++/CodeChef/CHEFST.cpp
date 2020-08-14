#include<cstdio>
#include<cmath>
#include<iostream>

using namespace std;

int main()
{
    int t;
    long long a,b,m;
    scanf("%d",&t);
    while(t--){
        scanf("%lld%lld%lld",&a,&b,&m);
        long long kq=0;
        if(a>b){
         kq=a;
         a=b;
         b=kq;
        }
        if(m%2==0)kq=m/2*(m+1);else kq=(m+1)/2*m;
        if(a>=kq)kq=a-kq+b-kq;else kq=b-a;
        printf("%lld\n",kq);
    }

}
