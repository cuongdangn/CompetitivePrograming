#include<iostream>
#include<cmath>
#include<cstdio>

using namespace std;

int a,b;

int main()
{
    scanf("%d%d",&a,&b);
    int h=a-b;
    if(h%10==9)printf("%d",h-1);
    else printf("%d",h+1);
}
