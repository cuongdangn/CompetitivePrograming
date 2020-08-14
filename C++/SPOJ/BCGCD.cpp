#include<iostream>

using namespace std;

long long n,m,a,b;

int main()
{
    cin>>a>>b;
    while(a!=0&&b!=0)
    {
        m=a;n=b;
        long long r;
        while(n!=0)
        {
            r=m%n;
            m=n;
            n=r;
        }
        cout<<m<<" "<<(a/m)*b<<endl;
        cin>>a>>b;
    }
    return 0;
}
