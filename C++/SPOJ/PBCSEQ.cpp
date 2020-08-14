#include <algorithm>
#include <cmath>
#include <cstdio>
#include <iostream>



struct bg
{
    int x,y;
};
using namespace std;

bg a[100010];
int n,kq,bit[1000010];
void    doc()
{
    cin>>n;
    for(int i=1;i<=n;i++) cin>>a[i].x>>a[i].y;
}
bool cmp(bg i,bg j)
{
    if((i.y>j.y)||((i.y==j.y)&&(i.x<j.x))) return true;
    return false;
}
int get(int x)
{
    int tg=0;
    while (x>0)
    {
       // cout<<x<<endl;
        tg=max(tg,bit[x]);
        x=x-(x & (-x));

    }
    return tg;
}
void up(int x,int t)
{
    while (x<=1000000)
    {
        //cout<<(x & -x)<<endl;
        bit[x]=max(bit[x],t);
        x=x+(x & (-x));
    }
}
void    xuly()
{
    sort(a+1,a+n+1,cmp);

    //for(int i=1;i<=n;i++) cout<<a[i].x<<" "<<a[i].y<<endl;

    for(int i=1;i<=n;i++)
    {
        int t=get(a[i].x);
        //cout<<t<<endl;
        kq=max(kq,t+1);
        up(a[i].x,t+1);
    }
    cout<<kq;
}
int main()
{
    ios::sync_with_stdio(0);
    cin.tie(0);
   //freopen("dnc.inp","r",stdin);
    //freopen("dnc.out","w",stdout);
    doc();
    xuly();
    return 0;
}
