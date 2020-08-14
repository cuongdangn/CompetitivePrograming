#include<iostream>
#include<algorithm>
#include<cstdio>

using namespace std;

#define for(i,a,b) for(int i=a;i<b;i++)
struct bg
{
    int x,y,z;
};

bg a[100003],b[100003];
int n;
int UC(int a,int b)
{
    int r;
    while(a!=0){
        r=b%a;
        b=a;
        a=r;
    }
    return b;
}
int doc()
{
    scanf("%d",&n);
    for(i,0,n){
            scanf("%d%d%d",&a[i].x,&a[i].y,&a[i].z);
            int uc;
            uc=UC(UC(a[i].x,a[i].y),a[i].z);
            a[i].x=a[i].x/uc;
            a[i].y=a[i].y/uc;
            a[i].z=a[i].z/uc;
    }
}
bool cmp(bg i,bg j)
{
    return ((i.x<j.x)||(i.x==j.x&&i.y<j.y)||(i.x==j.x&&i.y==j.y&&i.z<j.z));
}
int xuly()
{
    sort(a,a+n,cmp);
    //for(i,0,n)cout<<a[i].x<<" "<<a[i].y<<" "<<a[i].z<<endl;
    int kq=1;
    int dem=0;

    b[0]=a[0];

    for(i,1,n)
        if(a[i].x!=a[i-1].x||a[i].y!=a[i-1].y||a[i].z!=a[i-1].z){
            dem++;
            b[dem]=a[i];
        }
        n=dem+1;
       // for(i,0,n)cout<<b[i].x<<" "<<b[i].y<<" "<<b[i].z<<endl;
    for(i,0,n){
        int uc=UC(b[i].x,b[i].y);
        b[i].x=b[i].x/uc;
        b[i].y=b[i].y/uc;
    }
    dem=1;
    sort(b,b+n,cmp);
    for(i,1,n)
        if(b[i].x==b[i-1].x&&b[i].y==b[i-1].y)dem++;
    else {
            if(kq<dem)kq=dem;
            dem=1;
    }
    if(kq<dem)kq=dem;
    printf("%d\n",kq);

}
int main()
{
    //freopen("codec.in","r",stdin);
    int t;
    scanf("%d",&t);
    while(t--){
        doc();
        xuly();
    }
}
