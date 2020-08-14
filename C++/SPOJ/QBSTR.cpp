#include<iostream>
#include<string>
#include<cmath>
#include<cstdio>

using namespace std;

#define for(i,n) for(int i=1;i<=n;i++)

string s1,s2;
int n1,n2,d[10000][10000];

int main()
{
   // ios::sync_with_stdio(0);
   // cin.tie(0);
   // freopen("code.in","r",stdin);
    cin>>s1;
    cin>>s2;
    s1="0"+s1;
    s2="0"+s2;

    n1=s1.length()-1;
    n2=s2.length()-1;
    for(i,n1)
        for(j,n2)
        if(s1[i]==s2[j]) d[i][j]=d[i-1][j-1]+1;
        else d[i][j]=max(d[i-1][j],d[i][j-1]);
    cout<<d[n1][n2];
    return 0;
}
