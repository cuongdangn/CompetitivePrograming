#include <iostream>
#include <cmath>
#include <cstdio>
#include <vector>
#include <algorithm>

using namespace std;

#define maxn 100005

struct bg
{
    int da,cu,k;
};
struct bg1
{
    int l,gt,cs;
};
vector<int> ke[maxn];
int dem,n,c[maxn],b[maxn];
bg tr[maxn];
bg1 a[2*maxn];
long long bit[maxn+10],kq;


int doc()
{
    scanf("%d",&n);
    scanf("%d",&c[1]);
    for(int i=2;i<=n;i++)
    {
        int x;
        scanf("%d %d",&x,&c[i]);
        ke[x].push_back(i);
    }
}
void DFS(int i)
{
    dem++;
    b[dem]=c[i];
    tr[i].da=dem;
    for(int j=0;j<ke[i].size();j++)
        DFS(ke[i][j]);
    tr[i].cu=dem;
    tr[i].k=c[i];
}
long long get(int x)
{
    long long tg;
    tg=0;
    while(x>0)
    {
        tg=tg+bit[x];
        x=x-(x&(-x));
    }
    return tg;
}
void up(int x)
{
    while(x<=n+3)
    {
        bit[x]+=1;
        x=x+(x&(-x));
    }
}
bool cmp(bg1 a,bg1 b)
{
    return (a.gt<b.gt)||(a.gt==b.gt&&a.l>b.l);
}
int init()
{
    DFS(1);
    for(int i=1;i<=n;i++)
    {
        a[i].l=0;
        a[i].cs=i;
        a[i].gt=b[i];
    }
    for(int j=1;j<=n;j++)
    {
        a[j+n].l=1;
        a[j+n].cs=j;
        a[j+n].gt=tr[j].k;
    }
    sort(a+1,a+2*n+1,cmp);
}
int xuly()
{
    long long t;
    for(int i=1;i<=2*n;i++)
    {
        if(a[i].l==0)up(a[i].cs);
            else
            {
                t=get(tr[a[i].cs].cu)-get(tr[a[i].cs].da-1);
               // cout<<tr[a[i].cs].da<<" "<<tr[a[i].cs].cu<<endl;
                kq=t*(t-1)/2+kq;
            }
    }
    printf("%lld",kq);
}
int main()
{
   // freopen("code.in","r",stdin);
    doc();
    init();
    xuly();
    return 0;
}
