#include<iostream>
#include<cmath>
#include<algorithm>
#include<cstdio>

using namespace std;

#define for(i,da,cu) for(int i=da;i<=cu;i++)
const int maxn=200012;

struct bg
{
    int gt,cs;
};
int n,x;
int a[maxn];
bg s[maxn];
long long bit[maxn];
void doc()
{
    scanf("%d%d",&n,&x);
    for(i,1,n)scanf("%d",&a[i]);
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
      //  cout<<i;
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
void tinh(int k)
{

    for(i,1,n)bit[i]=0;
    s[0].gt=0;
    for(i,1,n)
        if(a[i]>=k) s[i].gt=s[i-1].gt+1;
        else s[i].gt=s[i-1].gt-1;

    for(i,1,n)s[i].cs=i;
    sort(s+1,s+n+1,cmp);
   // for(i,1,10)cout<<s[i].cs<<" "<<s[i].gt<<endl;
    /////////////////////
    //cout<<s[1].cs<<endl;
    up(s[1].cs);
     long long kq=0;
     if(s[1].gt>=0)kq=1;
    for(i,2,n)
    {
        kq=kq+get(s[i].cs-1);
        if (s[i].gt>=0)kq=kq+1;
        up(s[i].cs);
    }
   // cout<<kq<<endl;
    printf("%lld",kq);
   // cout<<endl;
}
int main()
{
    //ios::sync_with_stdio(0);
    //cin.tie(0);
    //freopen("MEDIAN.inp","r",stdin);
    //freopen("MEDIAN.OUT","w",stdout);
    //scanf("%d",&t);

        doc();
        tinh(x);
    return 0;
}

