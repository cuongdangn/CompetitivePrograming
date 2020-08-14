#include<iostream>
#include<cmath>
#include<cstdio>
#include<windows.h>

using namespace std;

int t;
int n;
long long s;

int main()
{
    freopen("codec.in","r",stdin);
   // freopen("code.out","w",stdout);
    cin>>t;
    //cout<<t;
    for(int j=1;j<=t;j++)
    {
        cin>>n>>s;
        int h;
        for(long long i=n;i>0;i--)
        {
            h=n-i;
            long long k=s-((i)*(i+1))/2;
            if(h<=k)break;
        }
        cout<<h<<endl;
    }
   /* while(1)
    {

        cout<<"(+ +) <+ +>";

        Sleep(10);

    } */

}
