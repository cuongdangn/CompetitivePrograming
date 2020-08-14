#include<iostream>
#include<cmath>
#include<cstdio>
#include<algorithm>

using namespace std;

#define for(i,m,n) for(int i=m;i<=n;i++)

int a,b;
bool p[200010];

void sang(int n)
{
    for(i,1,n)p[i]=true;
    p[1]=false;
    for(i,2,int(sqrt(n)))
        if(p[i])
        {
            int j=i*i;
            while(j<=n)
            {
                p[j]=false;
                j=j+i;
            }
        }
}
int main()
{
    ios::sync_with_stdio(0);
    cin.tie(0);
    cin>>a>>b;
    sang(b);
    for(i,a,b)
        if(p[i])cout<<i<<endl;
    return 0;
}
