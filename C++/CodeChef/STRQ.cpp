#include<iostream>
#include<cstdio>
#include<cmath>
#include<string>
#include<cstring>

using namespace std;

string ss;
int n,a[1000001];
long long sll[4][1000001];
int sl[4];
int tru[4][1000001];
long long s[4][4][1000001];
char sss[1000001];

int chuanhoa(char c)
{
    if(c=='c')return 0;
    if(c=='h')return 1;
    if(c=='e')return 2;
    if(c=='f')return 3;
}
int main()
{
   //freopen("code.in","r",stdin);
    scanf("%s",&sss);
   // cout<<ss;
   ss=string(sss);
    for(int i=0;i<ss.size();i++)
        a[i+1]=chuanhoa(ss[i]);
    n=ss.size();
   for(int i=1;i<=n;i++)
   {
    for(int j=0;j<=3;j++)
     sll[j][i]=sll[j][i-1];
     sll[a[i]][i]+=1;
   }
    ////////////////////////
    for(int i=1;i<=n;i++)
    {
        for(int j=0;j<=3;j++)
            tru[j][i]=tru[j][i-1];
        tru[a[i]][i]=i;
    }
    for(int k=1;k<=n;k++)
    {
        int tr=tru[a[k]][k-1];
        for(int i=0;i<=3;i++)
            s[i][a[k]][k]=s[i][a[k]][tr]+sl[i];
        sl[a[k]]+=1;
    }

    int t;
    cin>>t;
    char a,b;
    int da,cu;
    for(int i=1;i<=t;i++)
    {
        scanf("\n");
        scanf("%c %c%d%d",&a,&b,&da,&cu);
        int k1=chuanhoa(a);
        int k2=chuanhoa(b);
         long long hieu=(sll[k2][cu]-sll[k2][da-1])*sll[k1][da-1];
        cu=tru[k2][cu];
        da=tru[k2][da-1];

        printf("%lld \n",s[k1][k2][cu]-s[k1][k2][da]-hieu);
    }
    return 0;
}

