#include<bits/stdc++.h>

using namespace std;

#define maxn 100005
struct bg
{
    int x,y,z,cs;
}a[100005];

struct bg1
{
    int x,y,w;
}cn[maxn*3];

int n,m,cha[maxn],kq;
int doc()
{
    scanf("%d",&n);
    for(int i=1;i<=n;i++){
        scanf("%d%d%d",&a[i].x,&a[i].y,&a[i].z);
        a[i].cs=i;
    }
}
bool cmp1(bg i,bg j)
{
    return i.x<j.x;
}
bool cmp2(bg i,bg j)
{
    return i.y<j.y;
}
bool cmp3(bg i,bg j)
{
    return i.z<j.z;
}
bool cmp(bg1 i,bg1 j)
{
    return i.w<j.w;
}
int fcha(int i)
{
    if(cha[i]==-1)return i;
    cha[i]=fcha(cha[i]);
    return cha[i];
}
int xuly()
{

    for(int i=1;i<=n;i++)cha[i]=-1;
    sort(a+1,a+n+1,cmp1);
    for(int i=2;i<=n;i++)
    {
        m++;
        cn[m].x=a[i-1].cs;
        cn[m].y=a[i].cs;
        cn[m].w=a[i].x-a[i-1].x;
    }
     sort(a+1,a+n+1,cmp2);
    for(int i=2;i<=n;i++)
    {
        m++;
        cn[m].x=a[i-1].cs;
        cn[m].y=a[i].cs;
        cn[m].w=a[i].y-a[i-1].y;
    }
     sort(a+1,a+n+1,cmp3);
    for(int i=2;i<=n;i++)
    {
        m++;
        cn[m].x=a[i-1].cs;
        cn[m].y=a[i].cs;
        cn[m].w=a[i].z-a[i-1].z;
    }
    sort(cn+1,cn+m+1,cmp);
    for(int i=1;i<=m;i++)
    {
        int cha1=fcha(cn[i].x);
        int cha2=fcha(cn[i].y);
        if(cha1!=cha2)
        {
            kq+=cn[i].w;
            cha[cha1]=cha2;
        }
    }
    printf("%d",kq);
}
int main()
{
    //freopen("code.in","r",stdin);
    doc();
    xuly();
}
