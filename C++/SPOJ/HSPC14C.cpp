#include <iostream>
#include <cmath>
#include <cstdio>


using namespace std;

#define maxn 20000000

int dd[maxn];
int GCD(int a,int b)
{
    int n,m,r;
    n=a;
    m=b;
    while (n!=0)
    {
        r=m%n;
        m=n;
        n=r;
    }
    return m;
}
void init()
{
   //freopen("code.in","r",stdin);
    int t,x;
    for(int i=1;i<=2236;i++)
        for(int j=i+1;j<=3162;j++)
        if((j-i)%2==1&&GCD(i,j)==1)
        {
            t=2*j*(i+j);
            x=t;
            while(x<=maxn)
            {
                dd[x]+=1;
                x=x+t;
            }
        }
}
int main()
{
    init();
    int a;
    dd[0]=0;
    for(int i=1;i<=maxn;i++)
    {
        if(dd[i]!=1)dd[i]=0;
        dd[i]=dd[i]+dd[i-1];
    }
   // for(int i=1;i<=30;i++)cout<<kq[i]<<" ";
     while(scanf("%d",&a)!=EOF)
     {
      //  for(int i=1;i<=a;i++)
          //  if(dd[i]==1)printf("%d ",i);
             printf("%d \n",dd[a]);
     }
}
