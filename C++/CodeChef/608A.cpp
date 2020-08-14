#include<iostream>
#include<cstdio>
#include<cmath>
#include<algorithm>

using namespace std;

int x,y,z,n,s;

int main()
{
    scanf("%d%d",&n,&s);
    z=s;
    for(int i=1;i<=n;i++){
       scanf("%d%d",&x,&y);
       if(z<x+y)z=x+y;
    }
    printf("%d",z);
}
