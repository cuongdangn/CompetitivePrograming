#include<iostream>
#include<cmath>
#include<cstdio>
#include<string>


using namespace std;

int t;
string s;
int dd[28];
int main()
{
    //freopen("codec.inp","r",stdin);
    dd[0]=1;
    dd[1]=2;
    dd[3]=1;
    dd[14]=1;
    dd[15]=1;
    dd[16]=1;
    dd[17]=1;
    scanf("%d",&t);
    for(int i=1;i<=t;i++)
    {
        cin>>s;
        int n=s.size();
        int kq=0;
        for(int j=0;j<n;j++)
            kq=kq+dd[int(s[j])-65];
        printf("%d\n",kq);
    }
}
