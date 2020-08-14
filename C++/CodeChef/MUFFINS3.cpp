#include<iostream>
#include<cmath>
#include<cstdio>

using namespace std;

int t;

int main()
{
    scanf("%d",&t);
    for(int i=1;i<=t;i++)
    {
        int x;
        scanf("%d",&x);
        printf("%d\n",x/2+1);
    }
}
