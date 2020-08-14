#include<iostream>
#include<cstdio>
#include<cmath>

using namespace std;

#define for(i,a,b) for(int i=a;i<=b;i++)
#define maxn 10000006
int dd[maxn];
long long ti[maxn];
int m,sl[23];
int n;
long long pt[23];

int sang()
{
    int a=10000000;
    for(i,2,trunc(sqrt(a)))
    if(dd[i]==0){
        dd[i]=i;
        int j=i*i;
        while(j<=a){
            dd[j]=i;
            j=j+i;
        }
    }
    for(i,1,a)if(dd[i]==0)dd[i]=i;
}
long long dequy(int i,long long x,long long y)
{
    if(i>m)return x*y;
    long long dem=0;
    long long lt=1;
    long long t=pt[i];
    dem=dequy(i+1,x,y);
    //cout<<dem;
    for(tt,1,sl[i]){
        dem+=dequy(i+1,x*lt*(t-1),y*lt*t);
        lt=lt*t;
    }
    return dem;
}
long long tinh(int a)
{
    if(ti[a]!=-1)return ti[a];
    m=0;
    int t=a;
    while(t!=1){
        int tg=dd[t];
        int dem=0;
        while(t%tg==0){
            dem++;
            t=t/tg;
        }
        m++;
        pt[m]=tg;
        sl[m]=dem;
    }
    //cout<<m;
    ti[a]=dequy(1,1,1);
    return ti[a];
}
int main()
{
    freopen("codec.in","r",stdin);
    freopen("codec.ou","w",stdout);
    int t;
    sang();
    for(i,1,1e7)ti[i]=-1;
    ti[1]=1;
    ti[9699690]=30944711873439;
    scanf("%d",&t);
    for(i,1,t){
        scanf("%d",&n);
        printf("%lld\n",tinh(n));
    }
}

