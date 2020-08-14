#include<bits/stdc++.h>
using namespace std;
char s[10000];
int main()
{
    int x,y,n;
    int demx =0;
    int tong =0;
    cin>>s;
    cin>>x>>y;
    n = strlen(s);
    for(int i = 1; i<= n;i++)
    {
        if (s[i] =x) demx = demx++;
        if (s[i] =y) { tong = tong + demx;
        demx = 0;}
    }
    cout<<tong;
}
