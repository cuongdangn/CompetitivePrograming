#include<cstdio>
#include<iostream>
#include<string>

using namespace std;

int t,n,w[1002];
char s1[1002],s2[1002];


int main()
{
    //freopen("codec.in","r",stdin);
    scanf("%d",&t);
    for(int tt=1;tt<=t;tt++){
        scanf("%d",&n);
        scanf("%s",s1);
        scanf("%s",s2);
        int kq;
        int m=0;
        for(int i=0;i<n;i++)
            if(s1[i]==s2[i])m++;
        for(int i=0;i<=n;i++)
            scanf("%d",&w[i]);
        if(m==n)kq=w[n];else{
                kq=w[0];
        for(int i=1;i<=m;i++)
            kq=max(kq,w[i]);}
            printf("%d\n",kq);
    }
}
