#include<iostream>
#include<cmath>
#include<cstdio>
#include<algorithm>

using namespace std;

int min1;
int n,a[100010],b[100010];
void doc()
{
    for(int i=1;i<=n;i++)cin>>a[i];
    for(int i=1;i<=n;i++)cin>>b[i];
}
int main()
{
    cin>>n;
    doc();
    min1=2*trunc(1e9);
    sort(a+1,a+n+1);
    sort(b+1,b+n+1);
    int i=1;int j=n;
    while((i<=n)&&(j>0))
    {
        min1=min(abs(a[i]+b[j]),min1);
        if ((a[i]+b[j])<0)i++;else j--;
    }
    cout<<min1;
    return 0;

}
