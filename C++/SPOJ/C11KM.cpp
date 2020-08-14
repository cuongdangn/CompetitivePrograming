#include <bits/stdc++.h>

using namespace std;

int n;
long long p[1005],kq;
int main()
{
    scanf("%d",&n);
    for(int i=1;i<=n;i++)scanf("%lld",&p[i]);
    bool ok=true;
    int j=n;
    for(int i=1;i<=n;i++)
    {
        kq+=p[i];
        if(p[i]>100){
            j=i;
        if(ok)ok=false;
        else
                kq-=p[i];
        }
    }
    int ma=0;
    for(int i=j+1;i<=n;i++)
        ma=(ma<p[i])?p[i]:ma;
       // cout<<j<<" "<<ma;
    kq-=ma;
    printf("%lld",kq);
}

