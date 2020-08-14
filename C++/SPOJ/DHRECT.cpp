#include<cstdio>
#include<iostream>
#include<algorithm>
#include<cmath>

using namespace std;

int n,a[300010],test;
long long ketqua=1ll;

bool cp(int i,int j)
{
    return i>j;
}
int lam()
{
    scanf("%d",&n);
    for(int i=1;i<=n;i++)scanf("%d",&a[i]);
    sort(a+1,a+n+1,cp);
    int soluong=0;int i=1;ketqua=1;
    while(i<n)
     if(a[i]==a[i+1])
     {
         soluong+=1;
         ketqua=ketqua*(long long)a[i];
         if(soluong==2)break;
         i=i+2;
     }else i=i+1;
     if(soluong==2)printf("%lld \n",ketqua);
     else printf("-1 \n");
}
int main()
{
    scanf("%d",&test);
    for(int i1=1;i1<=test;i1++)
        lam();
    return 0;
}
