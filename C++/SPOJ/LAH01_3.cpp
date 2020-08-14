#include<iostream>
#include<cstdio>

using namespace std;

int d[205];
int j;

int main()
{
    freopen("code.in","r",stdin);
    freopen("code1.ou","w",stdout);
    d[1]=1;
    d[2]=3;
    d[3]=4;
    for(int i=4;i<=200;i++)
    {
        d[i]=d[i/3+i%3]+i-i%3;
        j=i+1;
        d[i]=max(d[i],d[j/3+j%3-1]+j-j%3-1);
        j=j+2;
        d[i]=max(d[i],d[j/3+j%3-2]+j-j%3-2);
    }
    int a;
    while(scanf("%d",&a)!=EOF)
        printf("%d\n",d[a]);
}
