#include<iostream>
#include<cmath>
using namespace std;

int main()
{
    long a;
    cin>>a;
    bool ok;
    ok=false;
    for(int i=2;i<=long(sqrt(a));i++)
        if (a%i==0)ok=true;
    if (ok||a<=1) cout<<"NO";
    else cout<<"YES";
    return 0;
}
