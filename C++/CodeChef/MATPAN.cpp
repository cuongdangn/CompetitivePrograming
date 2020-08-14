#include <bits/stdc++.h>

using namespace std;

char s[50005];
int a[30],dd[30];
int n;
int main()
{
   // freopen("code.in","r",stdin);
    int test;
    cin >> test;
    while(test --){
            int sum = 0;
        for(int i=1;i<=26;i++)
            cin >> a[i];
        cin >> s;
        n = strlen(s);
        for(int i=1;i<=26;i++)
            dd[i] = 0;
        for(int i=0;i<n;i++)
            dd[int(s[i])-int('a')+1]=1;
        for(int i=1;i<=26;i++)
        if(dd[i]==0)
            sum += a[i];
        cout << sum <<endl;
    }

}
