#include <iostream>
#include <cmath>
#include <cstdio>

using namespace std;

#define maxn 49999

long long n,k,h[maxn],t[maxn];

 int main()
{
   // freopen("code.in","r",stdin);
    scanf("%lld %lld",&n,&k);
    while(n!=0)
    {
        if(k==0)
        {
            long long kq=1234567891;
            if(kq>n-1)kq=n-1;
            printf("%lld \n",kq);
        }
        else
        {
            long long nut=1;
            long long kq;
            kq=0;
            for(int i=1;i<=maxn;i++)
            {
                h[i]=0;
                t[i]=0;
            }
            t[1]=1;
            for(int i=2;i<=n;i++)
            {
                kq=kq+nut;
                if(kq>1234567890)
                    break;

                t[i]=nut-h[i-1];
                if(i>k)h[i]=h[i-1]+t[i-k];
                nut=nut+t[i];
               // cout<<nut<<" "<<h[i]<<endl;
            }
            printf("%lld \n",kq);
        }
            scanf("%lld %lld",&n,&k);

    }

}
