#include <iostream>
#include <cmath>
#include <algorithm>
#include <cstdio>

using namespace std;

#define fort(i,t) for(int i=1;i<=t;i++)
#define ford(i,n) for(int i=n;i>0;i--)

int n,m,q;
int a[100010];
int d[100010][20];

void doc()
{
    scanf("%d %d %d",&n,&q,&m);
    fort(i,n)scanf("%d",&a[i]);
}
void sub1()
{
    int u,v;
    fort(i,q)
    {
        scanf("%d %d",&u,&v);
        int t=0;
        int sl=1;
        int kq=u;
        ford(j,u)
        {
            t=t+a[j];
            if (t>m)
            {
                t=a[j];
                sl+=1;
            }
            if (sl>v)
            {
                kq=j+1;
                break;
            }
            else kq=j;
        }
         printf("%d \n",kq);
    }
}
void sub2()
{
    int j=1;
    int t=0;
    fort(i,n)
    {
        t=t+a[i];
        while(t>m&&j<=i)
        {
            t=t-a[j];
            j+=1;
        }
        d[i][0]=j;
    }

    fort(j,18)
     fort(i,n)
      d[i][j]=max(d[d[i][j-1]-1][j-1],1);
    ///////////////////////
    int u,v;
    fort(i,q)
    {
        scanf("%d %d",&u,&v);
        if(v>n)v=n;
        for(int j=18;j>=0;j--)
            if(v>= 1 << j)
            {
               // cout<<j<<" "<<v<<endl;
                v=v-(1 <<j);
                u=d[u][j];
               // cout<<u<<endl;
                if(v==0||u==1)break;
                u=u-1;
            }
            printf("%d \n",u);
    }
}
int main()
{
   // ios::sync_with_stdio(0);
  //  cin.tie(0);
  // freopen("code.in","r",stdin);
   //freopen("code.ou","w",stdout);
    doc();
    if(n<=2000&&q<=2000)sub1();else
        sub2();
    return 0;
}
