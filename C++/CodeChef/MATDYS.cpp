#include <bits/stdc++.h>

using namespace std;

int n;
unsigned long long k;
unsigned long long lt[68];
void solve()
{
    unsigned long long pos = 0;
    unsigned long long t;
    while(k>0){
        t = k /2;
        if(k%2==1)
            pos = pos+lt[n-1];
        k = t;
        n--;
    }
    cout << pos<<endl;
}
int main()
{
   // freopen("code.in","r",stdin);
    int test;
    cin >> test;
    lt[0]=1;
    for(int i=1;i<=64;i++)
        lt[i] = lt[i-1]*2;

    while(test--){
        cin>>n>>k;
        //cout << n <<" "<<k<<endl;
        solve();
    }
}
