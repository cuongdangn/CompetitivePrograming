#include<iostream>
#include<cstdio>
int a[1000005];
int main()
{
    int n=1000;
    freopen("codec.ou","r",stdin);
    for(int i=1;i<=n;i++)scanf("%d",&a[i]);
    freopen("codec1.ou","r",stdin);
    for(int i=1;i<=n;i++){
        int x;
        scanf("%d",&x);
        if(x!=a[i]){
            printf("%d\n",i);
            //return 0;
        }
    }
   // printf("CO");
}

