#include <bits/stdc++.h>

using namespace std;

void solve(int n)
{
    for(int i=1;i<=n;i++)
    if(i%2==1){
        printf("%d %d ",i+1,i);
    }
}
int main()
{
    int test;
    int n;
    scanf("%d",&test);
    while(test--){
        scanf("%d",&n);
        if(n%2==0){
            solve(n);
        }
        else {
            solve(n-3);
            printf("%d %d %d",n-1,n,n-2);
        }
        printf("\n");
    }
}
