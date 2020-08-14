#include<iostream>
#include<cstdio>
#include<cmath>
#include<cstring>

using namespace std;

char s[200001],s1[200001];
int main()
{
    freopen("codef.in","r",stdin);
    scanf("%s\n",s);
    scanf("%s",s1);
    int n=strlen(s);
    int m=strlen(s1);
    int dem=0;
    int kq=0;
    for(int i=0;i<=m-n;i++)
        if(s[i]=='1')dem++;
    int t=0;
    if(s[t]=='0')kq+=n-dem;else kq+=dem;
    for(int i=m-n+1;i<m;i++)
    {
        t++;
        if(s1[i]=='1')dem++;
        if(s1[t-1]=='1')dem--;
        if(s[t]=='0')kq+=n-dem;else kq+=dem;
    }
    printf("%d",kq);

}
