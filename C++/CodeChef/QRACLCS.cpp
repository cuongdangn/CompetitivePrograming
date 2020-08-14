#include<iostream>
#include<cstdio>
#include<algorithm>
#include<cstring>

using namespace std;

char s[100];
int dem1,dem2,x2,x1;

int main()
{
    //freopen("codec.in","r",stdin);
    int t,n;
    scanf("%d",&t);
    while(t--){
        scanf("%d",&n);
        x1=101;
        x2=101;
        for(int i=1;i<=n;i++){
            scanf("%s\n",s);
            int m=strlen(s);
            dem1=0;
            dem2=0;
            for(int i=0;i<m;i++)
                if(s[i]=='a')dem1++;else dem2++;
                x1=min(x1,dem1);
                x2=min(x2,dem2);
    }
    cout<<min(x1,x2)<<endl;
    }
}
