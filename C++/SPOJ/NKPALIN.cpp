#include<iostream>
#include<cmath>
#include<string>
#include<cstring>
#include<algorithm>
#include<cstdio>

using namespace std;

#define fort(i,n) for(int i=1;i<=n;i++)
#define ford(i,n) for(int i=n;i>0;i--)

int d[2010][2010],tru[2010][2010];
string s,tr,ph;
int main()
{
   // freopen("code.in","r",stdin);
   cin>>s;
    //cout<<s<<endl;
    int n=s.length();
    s="0"+s;
    fort(i,n)
    {
        d[i][i]=1;
        tru[i][i]=1;
    }
    for(int i=2;i<=n;i++)
        for(int j=1;j<=n-i+1;j++)
        {
         if(s[j+i-1]==s[j])
            {
                d[j][j+i-1]=d[j+1][j+i-2]+2;
                tru[j][j+i-1]=1;
            }
            else
         if(d[j+1][j+i-1]<d[j][j+i-2])
         {
             d[j][j+i-1]=d[j][j+i-2];
             tru[j][j+i-1]=2;
         }
         else
         {
             d[j][i+j-1]=d[j+1][j+i-1];
             tru[j][j+i-1]=3;
         }
         }    /////////////////////////////////
   // cout<<s<<endl;
    //fort(i,n)
   // {
    //    fort(j,n)cout<<d[i][j]<<" ";
     //   cout<<endl;
    //}
    //cout<<d[1][n];
    int i=1;
    int j=n;
    while(i<=j)
    {
      //  cout<<i<<" "<<j<<endl;
        if(tru[i][j]==1){
                tr=tr+s[i];
                if(i!=j)ph=s[i]+ph;
                i=i+1;
                j=j-1;
                }
        else if(tru[i][j]==2)j=j-1;
        else i+=1;
    }
    cout<<tr+ph;
}
