#include<cstdio>
#include<iostream>
#include<cmath>

using namespace std;

#define foru(i,a,b) for(int i=a;i<=b;i++)

int n,m;
int xuly()
{
   // cout<<1;
   if(n==1){printf("Yes\n");return 0;}
    if(m==0)printf("No 1");else{
        int x=n;
        int y=m;
        while(y>0){
            int r=x%y;
            x=y;
            y=r;
        }
        if(x==1)printf("Yes");else
        {
            printf("No %d",n/x);
        }
    }
    printf("\n");
}
int main()
{
    //freopen("codec.in","r",stdin);
    //freopen("codec.ou","w",stdout);
    int t;
    scanf("%d",&t);
    foru(i,1,t){
        scanf("%d%d",&n,&m);
        xuly();
    }
}

