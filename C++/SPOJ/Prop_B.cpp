#include<iostream>
#include<cstdio>

using namespace std;

int m,n1,n2,a[300];
int main()
{
   // freopen("code.in","r",stdin);
    scanf("%d %d %d",&m,&n1,&n2);

    while(m!=0||n1!=0||n2!=0)
    {
        for(int i=1;i<=m;i++)
            scanf("%d",&a[i]);
        int kq,luu;
        kq=n1;
        luu=a[n1]-a[n1+1];
        for(int i=n1+1;i<=n2;i++)
            if(luu<=a[i]-a[i+1])
            {
                luu=a[i]-a[i+1];
                kq=i;
            }
        printf("%d\n",kq);
        scanf("%d %d %d",&m,&n1,&n2);
    }

}

