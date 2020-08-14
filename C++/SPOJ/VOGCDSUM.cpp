#include<iostream>
#include<cmath>
#include<cstdio>

using namespace std;
const int maxn=100010;
const int base=trunc(1e9)+7;
int n;
long long kq,a[maxn];
void doc()
{
    cin>>n;
    for(int i=1;i<=n;i++)cin>>a[i];
}
long long gcd(long long a,long long b)
{
    long long n,m,r;
    n=a;m=b;
    while(n>0)
    {
        r=m%n;
        m=n;
        n=r;
    }
    return m;
}
void trau()
{
    long long t;
    kq=0;
    for(int i=1;i<=n-1;i++)
    {
        t=a[i];
        kq=(kq+t)%base;
        for(int j=i+1;j<=n;j++)
            {
               t=gcd(t,a[j]);
               kq=(kq+t)%base;
            }
    }
    cout<<(kq+a[n])%base;
}
int main()
{
    ios::sync_with_stdio(0);
    cin.tie(0);
   // freopen("code.inp","r",stdin);
    //freopen("dnc.out","w",stdout);
    doc();
    trau();
    return 0;
}
