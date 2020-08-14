#include<iostream>
#include<cmath>
#include<cstdio>

using namespace std;

int n,m;
int s[10000001];
int main()
{
   // freopen("code.in","r",stdin);
    cin>>n>>m;
    long long gt=1;
    for(long long i=1;i<=m;i++)
    {
        gt=(gt*i)%m;
        s[i]=(s[i-1]+i*gt)%m;
    }
    gt=0;
    long long t;
    for(int i=1;i<=n;i++)
    {
        cin>>t;
        long long ss;
        if(t%2==0)ss=((((t/2)%m*((t+1)%m))%m)*((t)%m))%m;
        else ss=(((((t+1)/2)%m)*(t%m)%m)*(t%m))%m;

        if(t>=m)gt=(gt+ss+s[m])%m;
        else gt=(gt+ss+s[t])%m;
       // cout<<gt<<" "<<<<endl;
    }
    cout<<gt;
}
