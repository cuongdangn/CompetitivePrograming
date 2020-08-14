#include <iostream>
#include <cmath>
#include <cstdio>


using namespace std;

char s[1000001];
int dd[123][123];
int n;
long long kq;

void doc()
{
    char c;
    int t;
    scanf("%d",&n);
    scanf("%c",&c);
    t=int(c);
    for(int i=2;i<=n;i++)
    {
        scanf("%c",&c);
        dd[t][int(c)]++;
    }
}
void xuly()
{
    int q;
    scanf("%d",&q);
    for(int i=1;i<=q;i++);
    {

    }
}
int main()
{
    doc();
    xuly();
}
