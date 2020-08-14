#include <iostream>
#include <cmath>
#include <cstdio>
#include <map>

using namespace std;

#define maxx 1000000001
#define maxn 100001
int n,q,a[maxn],b[maxn],next[maxn];
map<int,int> idx;
int itmax[4*maxn],itmin[4*maxn],itgcd[4*maxn],itnext[4*maxn];


void doc()
{
    scanf("%d %d",&n,&q);
    for(int i=1;i<=n;i++)
        scanf("%d",&a[i]);
}
int gcd(int a,int b)
{
    int n,m,r;
    n=a;m=b;
    while(a!=0)
    {
        r=b%a;
        b=a;
        a=r;
    }
    return b;
}
int buildmax(int k,int i,int j)
{
    int mid;
    if(i==j)
    {
        itmax[k]=a[i];
        return 0;
    }
    mid=(i+j)/2;
    buildmax(2*k,i,mid);
    buildmax(2*k+1,mid+1,j);
    itmax[k]=max(itmax[k*2],itmax[k*2+1]);
    return 0;
}
int buildgcd(int k,int i,int j)
{
    int mid;
    if(i==j)
    {
        itgcd[k]=b[i];
        return 0;
    }
    mid=(i+j)/2;
    buildgcd(2*k,i,mid);
    buildgcd(2*k+1,mid+1,j);
    itgcd[k]=gcd(itgcd[k*2],itgcd[k*2+1]);
    return 0;
}
int buildmin(int k,int i,int j,int it[4*maxn],int a[maxn])
{
    int mid;
    if(i==j)
    {
        it[k]=a[i];
        return 0;
    }
    mid=(i+j)/2;
    buildmin(2*k,i,mid,it,a);
    buildmin(2*k+1,mid+1,j,it,a);
    it[k]=min(it[k*2],it[k*2+1]);
    return 0;
}
int abs(int a)
{
    if(a<0) return -a;
    else return a;
}
void init()
{

    for(int i=1;i<=n;i++)
    {
        int vtri=idx[a[i]];
        if(vtri>0)next[vtri]=i;
        idx[a[i]]=i;
    }
    for(int i=1;i<=n;i++)
        if(next[i]==0)next[i]=n+1;
    for(int i=2;i<=n;i++)
        b[i-1]=abs(a[i]-a[i-1]);
    buildmin(1,1,n,itnext,next);
    buildmax(1,1,n);
    buildgcd(1,1,n-1);
    buildmin(1,1,n,itmin,a);
}
int getmax(int k,int l,int r,int i,int j)
{
    if(l>=i&&r<=j) return itmax[k];
    int mid=(l+r)/2;
    int x,y;
    if (!(mid<i||l>j))x=getmax(k*2,l,mid,i,j);
        else x=-maxx;

    if(!(r<i||mid+1>j))y=getmax(k*2+1,mid+1,r,i,j);
        else y=-maxx;
    return max(x,y);
}
int getgcd(int k,int l,int r,int i,int j)
{
    if(l>=i&&r<=j) return itgcd[k];
    int mid=(l+r)/2;
    int x,y;
    if (!(mid<i||l>j))x=getgcd(k*2,l,mid,i,j);
        else x=-maxx;

    if(!(r<i||mid+1>j))y=getgcd(k*2+1,mid+1,r,i,j);
        else y=-maxx;
    if(x<0)return y;
    else if(y<0) return x;
        else return gcd(x,y);
}
int getmin(int k,int l,int r,int i,int j,int it[4*maxn])
{
    if(l>=i&&r<=j) return it[k];
    int mid=(l+r)/2;
    int x,y;
    if (!(mid<i||l>j))x=getmin(k*2,l,mid,i,j,it);
        else x=maxx;

    if(!(r<i||mid+1>j))y=getmin(k*2+1,mid+1,r,i,j,it);
        else y=maxx;
    return min(x,y);
}
int xuly()
{
    init();
    int da,cu;
    for(int i=1;i<=q;i++)
    {
        scanf("%d %d",&da,&cu);
        if(da==cu)printf("NO\n");
        else
        {
            int ma,mi;
            mi=getmin(1,1,n,da,cu,itmin);
            ma=getmax(1,1,n,da,cu);
            //cout<<ma<<" "<<mi<<endl;
            if(mi==ma||(ma-mi)%(cu-da)!=0)printf("NO\n");
            else
            {
                int d=(ma-mi)/(cu-da);
                int pos=getmin(1,1,n,da,cu,itnext);
                int uc=getgcd(1,1,n-1,da,cu-1);
               // cout<<uc<<endl;
                if(pos>cu&&uc==d)printf("YES\n");
                else printf("NO\n");
            }
        }
    }
}
int main()
{
   // freopen("code.in","r",stdin);
    doc();
    xuly();
    return 0;
}
