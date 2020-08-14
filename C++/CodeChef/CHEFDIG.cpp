#include <bits/stdc++.h>

using namespace std;

char s[100005];
int dem[11];

bool check(int n)
{
    if(n%10 == n/10)
        return dem[n%10]>1;
    return (dem[n%10]&&dem[n/10]);
}
int main()
{
   // freopen("code.in","r",stdin);
    int test;
    scanf("%d",&test);
    while(test--){
        scanf("%s",s);
        int n = strlen(s);
        for(int i=0;i<=9;i++)
            dem[i]=0;
        for(int i=0;i<n;i++)
            dem[int(s[i])-48]++;
        for(int i=65;i<=90;i++)
            if(check(i))
                printf("%c",char(i));
        printf("\n");
    }
}
