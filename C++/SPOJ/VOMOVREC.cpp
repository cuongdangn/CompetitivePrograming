#include<iostream>
#include<cstdio>

using namespace std;

#define fou(i,a,b) for(int i=a;i<=b;i++)
#define fod(i,a,b) for(int i=a;i>=b;i--)

struct bg
{
    long long x1,y1,x2,y2;
};

bg a[100004];
int n;

int doc()
{
    scanf("%d",&n);
    fou(i,1,n)scanf("%lld%lld%lld%lld",&a[i].x1,&a[i].y1,&a[i].x2,&a[i].y2);
}
bool kgiao(bg a,bg b)
{
    return (a.x1>=b.x2||a.x2<=b.x1||a.y1>=b.y2||a.y2<=b.y1);
}
bg giao(bg a,bg b)
{
    bg tg;
    tg.x1=max(a.x1,b.x1);
    tg.y1=max(a.y1,b.y1);
    tg.x2=min(a.x2,b.x2);
    tg.y2=min(a.y2,b.y2);
    return tg;
}
bool ktra(long long x)
{
    fou(i,1,n){
        a[i].x1-=x;
        a[i].y1-=x;
        a[i].x2+=x;
        a[i].y2+=x;
    }
    bg tg;
    tg=a[1];
    fou(i,2,n){
        if(kgiao(tg,a[i])){
        fou(i,1,n){
           a[i].x1+=x;
           a[i].y1+=x;
           a[i].x2-=x;
           a[i].y2-=x;}
        return false;
        }
        tg=giao(tg,a[i]);
    }
    fou(i,1,n){
           a[i].x1+=x;
           a[i].y1+=x;
           a[i].x2-=x;
           a[i].y2-=x;}
    return true;
}
long long chat()
{
    long long dau,cuoi,giua,luu;
    dau=0;
    cuoi=4000000001;
    while(dau<=cuoi){
        giua=(dau+cuoi)/2;
        if(ktra(giua)){
            luu=giua;
            cuoi=giua-1;
        }else dau=giua+1;
    }
    printf("%lld",luu);
}
int main()
{
    //freopen("code.in","r",stdin);
    doc();
    chat();
}
