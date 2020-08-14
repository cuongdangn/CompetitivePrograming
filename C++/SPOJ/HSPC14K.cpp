#include<iostream>
#include<cmath>
#include<cstdio>

using namespace std;

#define maxn  1002

int n,m,q;
long long  bit[maxn][maxn],bit1[maxn][maxn],bit2[maxn][maxn],bit3[maxn][maxn];

void up(int i,int j,long long x,long long bit[maxn][maxn])
{
    while(i<=n)
    {
        int j1=j;
        while(j1<=m)
        {
            bit[i][j1]+=x;
            j1=j1+(j1 &(-j1));
        }
        i=i+(i &(-i));
    }
}
void update()
{
    int a,b,x,y;
    long long w;
    scanf("%d %d %d %d %lld",&a,&b,&x,&y,&w);
    up(a,b,w,bit);
    up(a,y+1,-w,bit);
    up(x+1,b,-w,bit);
    up(x+1,y+1,w,bit);
    /////////////
    up(a,b,w*(1-a)*(1-b),bit3);// bit 3
    up(a,y+1,w*(1-a)*y,bit3);
    up(x+1,b,w*(1-b)*x,bit3);
    up(x+1,y+1,w*x*y,bit3);
    //////////////
    up(a,b,w*(1-b),bit1);   // bit1
    up(x+1,b,-w*(1-b),bit1);
    up(a,y+1,w*y,bit1);
    up(x+1,y+1,-w*y,bit1);
    //////////////
    up(a,b,w*(1-a),bit2);
    up(a,y+1,-w*(1-a),bit2);
    up(x+1,b,w*x,bit2);
    up(x+1,y+1,-w*x,bit2);
}
long long get(int i,int j, long long bit[maxn][maxn])
{
    long long tg=0;
    int j1=j;
    while(i>0)
    {
        j=j1;
        while(j>0)
        {
            tg=tg+bit[i][j];
            j=j-(j &(-j));
        }
        i=i-(i&(-i));
    }
    return tg;
}
long long getx(int i,int j)
{
    return i*j*get(i,j,bit)+i*get(i,j,bit1)+j*get(i,j,bit2)+get(i,j,bit3);
}
void getkq()
{
    int a,b,x,y;
    long long kq;
    scanf("%d %d %d %d ",&a,&b,&x,&y);
    kq=getx(x,y)-getx(a-1,y)-getx(x,b-1)+getx(a-1,b-1);
    printf("%lld \n",kq);
}
int main()
{
    //freopen("K.in","r",stdin);
    //freopen("code.out","w",stdout);
    scanf("%d %d %d",&n,&m,&q);
    for(int i=1;i<=q;i++)
    {
        int l;
        scanf("%d",&l);
        if(l==1)update();
        else getkq();
    }
    return 0;
}
