#include<iostream>
#include<cmath>
#include<cstdio>
#include<string>
#include<cstring>

using namespace std;

string s;
int t,dem1,dem2,kq;
int main()
{
    //freopen("code.in","r",stdin);
    cin>>t;
    for(int j=1;j<=t;j++)
    {
        cin>>s;
        int n=s.length();
        dem2=dem1=0;
        //cout<<s<<" "<<n<<endl;
        for(int i=0;i<n;i++)
        {
            if((i%2==0)&&(s[i]=='+'))dem1=dem1+1;
            if((i%2==1)&&(s[i]=='-'))dem2=dem2+1;
        }
        kq=dem1+dem2;
        dem2=dem1=0;

         for(int i=0;i<n;i++)
        {
            if(i%2==0&&s[i]=='-')dem1+=1;
            if(i%2==1&&s[i]=='+')dem2+=1;
        }
        kq=min(kq,dem1+dem2);
        cout<<kq<<endl;
    }
    return 0;
}
