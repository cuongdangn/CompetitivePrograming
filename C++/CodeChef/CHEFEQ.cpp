#include<iostream>
#include<cmath>
#include<cstdio>

using namespace std;

int t,n;
int dd[100010];

int main()
{
    cin>>t;
    for(int j=1;j<=t;j++)
    {
        cin>>n;
        int dem=0;
        for(int i=1;i<=100000;i++)dd[i]=0;
        for(int i=1;i<=n;i++)
        {
            int tg;
            cin>>tg;
            dd[tg]+=1;
            dem=max(dem,dd[tg]);
        }
        cout<<n-dem<<endl;
    }
}
