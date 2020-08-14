#include<iostream>
#include<cmath>
#include<cstdio>

using namespace std;

long long a;
int main()
{
    scanf("%lld",&a);
    if(a%6==0||a%6==1||a%6==3)printf("yes");
    else printf("no");
}

