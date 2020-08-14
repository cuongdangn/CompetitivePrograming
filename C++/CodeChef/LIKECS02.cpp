#include <bits/stdc++.h>

using namespace std;

int n;

void xuat(int x)
{
    if(x<0)
        printf("-1\n");
    else{
        for(int i=x;i<=x+n-1;i++)
            printf("%d ",i);
        printf("\n");
    }
}
int main()
{
    int test;
    scanf("%d",&test);
    while(test--){
        double sum = 0;
        scanf("%d",&n);
        double m = (n*(n+1))/2;
        for(int i=1;i<=n;i++){
            double sum1=0;
            for(int j=i;j<=n;j++){
                sum1+=j;
                sum = sum + sum1/(j-i+1);
            }
        }
        if(sum>=(m*(n-1)) && sum<=(m*(n+1))){
            xuat(1);
        }
        else
            xuat(1+trunc(n-sum/m));

    }
}
