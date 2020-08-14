#include<iostream>
#include<cmath>
#include<algorithm>
#include<vector>
#include<cstdio>

using namespace std;

#define for(i,da,cu) for(int i=da;i<=cu;i++)
const int maxn=500010;

struct bg
{
    int gt,cs;
};
long long n,x;
int a[maxn];
bg s[maxn];
long long bit[maxn];
void doc()
{
    cin>>n>>x;
    for(i,1,n)cin>>a[i];
}
bool cmp(bg i,bg j)
{
    return (i.gt<j.gt||(i.gt==j.gt&&i.cs<j.cs));
}
void up(int i)
{
    while(i<=n)
    {
        bit[i]=bit[i]+1;
        i=i+(i & (-i));
    }
}
long long get(int i)
{
    long long tg=0;
    while(i>0)
    {
        tg=tg+bit[i];
        i=i-(i &(-i));
    }
    return tg;
}
long long tinh(int k)
{

    for(i,1,n)bit[i]=0;
    s[0].gt=0;
    s[0].cs=0;
    for(i,1,n)
        if(a[i]>=k)s[i].gt=s[i-1].gt+1;
        else s[i].gt=s[i-1].gt-1;
    for(i,1,n)s[i].cs=i;
    sort(s+1,s+n+1,cmp);
  //  for(i,1,n)cout<<s[i].cs<<" "<<s[i].gt<<endl;
    /////////////////////
    up(s[1].cs);
     long long kq=0;
     if(s[1].gt>=0)kq+=1;
    for(i,2,n)
    {
        kq=kq+get(s[i].cs-1);
        if (s[i].gt>=0)kq+=1;
        up(s[i].cs);
    }
   // cout<<kq<<endl;
    return kq;
}
void xuly()
{
    double kq=tinh(x)-tinh(x+1);
   // cout<<kq<<endl;
    double t=n*(n-1)/2+n;
    cout<<kq/t;
}
int main()
{
    ios::sync_with_stdio(0);
    cin.tie(0);
   // freopen("code.inp","r",stdin);
    doc();
    xuly();
    return 0;
}
