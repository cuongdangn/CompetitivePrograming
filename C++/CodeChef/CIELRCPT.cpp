#include<iostream>
#include<cmath>
#include<cstdio>

using namespace std;

int t;
int x,lt[13];

int main()
{
        scanf("%d",&t);
        lt[1]=1;
        for(int i=2;i<=12;i++)lt[i]=lt[i-1]*2;
        for(int i=1;i<=t;i++)
        {
            scanf("%d",&x);
            int kq=0;
            int ii=12;
            while(x>0)
            {
                kq+=x/lt[ii];
                x=x%lt[ii];
                ii-=1;
            }
            printf("%d\n",kq);
        }
}
